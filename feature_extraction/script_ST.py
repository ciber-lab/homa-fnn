import pandas as pd
import more_itertools
import numpy as np
import tsfel
from scipy.stats import skew
from scipy.stats import kurtosis
from scipy.fftpack import fft
from entropy import app_entropy, sample_entropy


labels_df = pd.read_csv(
    r"CARMA_0-1.csv",
    header=None)
labels_numpy = labels_df.to_numpy()
# file_key: "HR", file_path: "D:/...."
files = {
    "ST": r"ST.csv"
}
fs=4 #Sampling frequency

for p_size in range(3, 9):
    for t_size in range(3, 9):
        dataframes = []
        # since you have multiple files
        for file_key, file_path in files.items():
            # for each file you have a data frame
            features_df = pd.DataFrame()
            # we read the signal data
            signal_df = pd.read_csv(file_path, header=None)
            # we transform the dataframe into a numpy array for facilitate
            # the manipulation
            data_numpy = signal_df.to_numpy()
            # we grab the signal data, labels
            for signal_array, labels_array in zip(np.rollaxis(data_numpy, axis=1), np.rollaxis(labels_numpy, axis=1)):
                # we get the sliding windows
                signal_windows = more_itertools.windowed(signal_array, n=t_size*fs, step=fs)
                # for each window we need to predict the label
                # based on the p_size th elements of the next window
                for idx, signal_window in enumerate(signal_windows):
                    label_window = labels_array[idx + t_size: idx + t_size + p_size].tolist()
                    # we get the max in the prediction window
                    final_label = np.max(label_window) if len(label_window) == p_size else -1
                    if final_label == -1:
                        continue
                    # we save the data into the results dataframe
                    features_df = features_df.append({
                        f"{file_key}_max": np.max(signal_window),
                        f"{file_key}_min": np.min(signal_window),
                        f"{file_key}_maxslope": (np.max(signal_window) - np.min(signal_window)) / (t_size * fs),
                        f"{file_key}_mean": np.mean(signal_window),
                        f"{file_key}_median": np.median(signal_window),
                        f"{file_key}_skew": skew(signal_window),
                        f"{file_key}_kurtosis": kurtosis(signal_window),
                        f"{file_key}_std": np.std(signal_window),
                        f"{file_key}_var": np.var(signal_window),
                        f"{file_key}_auc": np.trapz(signal_window),
                        f"{file_key}_app_entropy": app_entropy(signal_window, order=2, metric='chebyshev'),    # Approximate entropy
                        # f"{file_key}_sampen": sample_entropy(signal_window, order=2, metric='chebyshev'),
                        # f"{file_key}_zero_crossing": tsfel.feature_extraction.features.zero_cross(signal_window),

                        f"{file_key}_avg_phase": np.mean(np.angle(fft(signal_window))),
                        f"{file_key}_avg_magnitude": np.mean(np.abs(fft(signal_window))),
                        f"{file_key}_total_energy": tsfel.feature_extraction.features.total_energy(signal_window, fs),
                        f"{file_key}_spectral_distance": tsfel.tsfel.feature_extraction.features.spectral_distance(
                            signal_window, fs),
                        # f"{file_key}_max_frequency": tsfel.feature_extraction.features.max_frequency(signal_window, fs),
                        # f"{file_key}_median_frequency": tsfel.feature_extraction.features.median_frequency(
                        #     signal_window, fs),
                        f"{file_key}_spectral_entropy": tsfel.feature_extraction.features.spectral_entropy(
                            signal_window, fs),
                        f"{file_key}_max_power_spectrum": tsfel.feature_extraction.features.max_power_spectrum(
                            signal_window, fs),
                        f"{file_key}_power_bandwidth": tsfel.feature_extraction.features.power_bandwidth(signal_window,
                                                                                                         fs),
                        f"{file_key}_spectral_kurtosis": tsfel.feature_extraction.features.spectral_kurtosis(
                            signal_window, fs),
                        f"{file_key}_spectral_skewness": tsfel.feature_extraction.features.spectral_skewness(
                            signal_window, fs),
                        f"{file_key}_spectral_variation": tsfel.feature_extraction.features.spectral_variation(
                            signal_window, fs),
                        f"{file_key}_fundamental_frequency": tsfel.feature_extraction.features.fundamental_frequency(
                            signal_window, fs),

                        f"label": final_label
                    }, ignore_index=True)
            dataframes.append(features_df)



        final_df = pd.concat(dataframes, axis=1)
        final_df = final_df.loc[:, ~final_df.columns.duplicated()]
        final_df = final_df[[c for c in final_df.columns.tolist() if c != "label"]+['label']]
        for index, row in final_df.iterrows():
            if row["label"] == 1:
                final_df.drop(final_df.loc[index + p_size: index + p_size + t_size + 10].index, inplace=True)
        final_df.to_csv(f".\Dataset_3\{file_key}_dataset_t{t_size}_p{p_size}.csv", index=False)