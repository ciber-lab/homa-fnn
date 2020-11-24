# **Feed-forward neural network for drone accident prediction from physiological signals**

<img src="" alt="Demo" width="840" align="middle"/>

## **Table of Contents**
1. [Introduction](#introduction)
2. [Implementation](#implementation)
3. [Dataset](#dataset) ([request form](https://docs.google.com/forms/d/e/1FAIpQLSe-47QX3it0NLLQsbtcpbNO8A0nBkw7yJ5Soq6ZfHzsATy1UQ/viewform))
4. [FNN model](#Models)
5. [Tutorials](#tutorials)

## **Introduction**

The repository presents accident prediction using Feed-forward Neural Network and physiological signals. The detailed procedures can be found in the following paper.

### Article

[**An artificial neural network for drone accident prediction from physiological signals**](https://) \
Md Nazmus Sakib, Theodora Chaspari, Amir H. Behzadan \
Journal: 

Please cite the article if you use the dataset, model or method(s), or find the article useful in your research. Thank you!

### LaTeX citation:

@article{Sakib2021,
    author  = {Md Nazmus Sakib and Theodora Chaspari and Amir H. Behzadan},
    title   = {An artificial neural network for drone accident prediction from physiological signals},
    journal = {},
    volume  = {},
    year    = {},
    pages   = {}


## **Implementation**

### Dependencies
- `Scikit-learn`
- `numpy`
- `smote`
- `tsfel`
- `matplotlib`
- `pandas`

**Please stay tuned! The detailed description of the implementation is coming soon**

## **Dataset**

### Time-seried signals
- Electrocardiogram (ECG or EKG)
    - Recording device: Actiheart 5
    - Sampling frequency: 1024 Hz
- Electrodermal activity (EDA) or galvanic skin response (GSR)
    - Recording device: Empatica E4
    - Sampling frequency: 4 Hz
- Skin temperature (ST)
    - Recording device: Empatica E4
    - Sampling frequency: 4 Hz
- Heart rate (HR)
    - Recording device: Actiheart 5 and Empatica E4
    - Sampling frequency: 1 Hz

### Time-domain features

### Frequency-domain features

### Dataset statisctics

The dataset contains physiological signals from 25 participants while flying drone in outsdoor environment. A brief statistics of the dataset is shown in the following figure.

<img src="" alt="Dataset" width="840" align="middle"/>

### Download the dataset

The raw dataset can be found in this [Google Drive folder](https://drive.google.com). \
The filtered dataset can be found in this [Google Drive folder](https://drive.google.com). \
The final dataset can be found in this [Google Drive folder](https://drive.google.com).

## **Methods/Approaches**

This paper presents beflow approaches to predict an accident:

<img src="" alt="Methods/Approaches" width="840" align="middle"/>

## **Results**

- The F1-score and average-precision (AP) of model to predict accident :

- The training (t) and prediction (p) window as 8 seconds and 6 seconds respectively:

<img src="" alt="Results" width="840" align="middle"/>


## **Pre-trained Models**

Models trained on Pictor-v3 dataset are available on the following links:

- FNN-v1
- FNN-v2

**Please stay tuned! Links to download the models well be added soon.**

## **Tutorials**

**Please stay tuned! The detailed step-by-step tutorials are coming soon.**
