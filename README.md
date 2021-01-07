# **Feed-forward Neural Network (FNN) for Drone Accident Prediction from Physiological Signals**

<img src="images/main.jpg" alt="Demo" width="840" align="middle"/>

## **Table of Contents**
1. [Introduction](#introduction)
2. [Implementation](#implementation)
3. [Data collection protocol] (#Data collection protocol)
4. [Dataset](#dataset) ([download](https://drive.google.com/drive/folders/1jrGqgwpBh1hD354zGkpxY7JTZTe13QgY?usp=sharing))
5. [FNN model](#Models)
6. [Tutorials](#tutorials)

## **Introduction**

Unmanned aerial vehicles (UAVs), commonly known as drones, are a major game-changer in construction and civil infrastructure projects, and are rapidly transforming the traditional way of conducting tasks such as surveying, safety inspection, and progress monitoring. While the industry is still years away from implementing autonomous drones on the jobsite, human operators still play a critical role in ensuring safe drone missions in compliance with operational protocols such as those of the United States Federal Aviation Administration (FAA) and the European Union Aviation Safety Agency (EASA). Research shows that operator’s stress and fatigue are among the leading causes of drone accidents. Our previous work suggests that physiological data collected by nonintrusive wearable devices can accurately predict drone operator’s performance, mental workload, and stress. In this research, we use data from real-world and virtual reality flight experiments to design an artificial neural network (ANN) model coupled with a robust feature engineering (feature extraction and selection) scheme for exploring the complex interactions between drone operator’s time-series physiological signals (e.g., electrocardiogram, electrodermal activity, heart rate, skin temperature) as explanatory variables, and the likelihood of an imminent drone accident. The findings of this study will lay the foundation for future work in creating automated intervention systems for drone operations, ultimately leading to safer jobsites.

### Article

[**A feed-forward neural network for drone accident prediction from physiological signals**](https://) \
Md Nazmus Sakib, Theodora Chaspari, Amir H. Behzadan \
Journal: Smart and Sustainable Built Environment (SASBE)

Please cite the article if you use the dataset, model or method(s), or find the article useful in your research. Thank you!

### LaTeX citation:

@article{Sakib2021,
    author  = {Md Nazmus Sakib and Theodora Chaspari and Amir H. Behzadan},
    title   = {A feed-forward neural network for drone accident prediction from physiological signals},
    journal = {Smart and Sustainable Built Environment},
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

## **Data collection protocol**

<img src="images/protocol.jpg" alt="Data collection protocol" width="840" align="middle"/>

## **Dataset**

### Wearable devices
Figure shows the Actiheart 5, chest wearable device. Manufactured by CamNtech Ltd. <img src="images/actiheart.jpg" alt=" Actiheart 5" width="840" align="middle"/>

Figure shows the Empatica E4, wrist wearable device. Manufactured by Empatica Inc. <img src="images/empatica.jpg" alt="Empatica E4" width="840" align="middle"/>

### Time-series signals
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

The dataset contains physiological signals from 25 participants while flying a drone in outsdoor environment. A brief statistics of the dataset is shown in the following figure.

<img src="" alt="Dataset" width="840" align="middle"/>

### Download the dataset

To download this dataset please fill out the [Dataset Download Request Form](https://docs.google.com/forms/d/e/1FAIpQLSe-47QX3it0NLLQsbtcpbNO8A0nBkw7yJ5Soq6ZfHzsATy1UQ/viewform?usp=sf_link).

**Note:** These datasets are strictly for research purposes. Can not be redistributed to anyone else or put anywhere for public access. Once research purposes are completed, please destroy the original files. The participants identifying information (if any) can not be revealed publicly or in a research paper/presentation.

## **Methods/Approaches**

This paper presents below approaches to predict an accident:

<img src="" alt="Methods/Approaches" width="840" align="middle"/>

## **Results**

- The F1-score and average-precision (AP) of model to predict accident :

- The training (t) and prediction (p) window as 8 seconds and 6 seconds respectively:

<img src="" alt="Results" width="840" align="middle"/>


## **Models**

The models used for analysis available on the following links:

- FNN-v1
- FNN-v2

**Please stay tuned! Links to download the models well be added soon.**

## **Tutorials**

**Please stay tuned! The detailed step-by-step tutorials are coming soon.**
