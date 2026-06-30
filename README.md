![Python](https://img.shields.io/badge/Python-3.11-blue)
![BigQuery](https://img.shields.io/badge/Google-BigQuery-4285F4)
![LightGBM](https://img.shields.io/badge/Model-LightGBM-success)
![CatBoost](https://img.shields.io/badge/Model-CatBoost-orange)
![Power BI](https://img.shields.io/badge/Visualization-PowerBI-yellow)

# Steam Game Rating Prediction: A Comparative Study of Binary and Multiclass Classification

# Steam Game Rating Prediction: A Comparative Study of Binary and Multiclass Classification

![Steam project dashboard with summary KPI cards for total games 117.311 total reviews 1.048.148 highly rated rate 53,23 percent and highly rated games 62.447 along with charts for games released by year price range and top genres](images/overview_dashboard.png)

## Project Overview

This project presents an end-to-end machine learning pipeline for predicting Steam game ratings using real-world Steam platform data.

The study investigates two different target definitions:

- **Binary Classification:** Predict whether a game is *Highly Rated* (positive review rate ≥ 90%).
- **Multiclass Classification:** Predict the rating group (75–80%, 81–85%, 86–90%, >90%).

The objective is to compare both approaches and determine which target formulation provides better predictive performance.

---

## Project Workflow

```
Steam Dataset
      │
      ▼
BigQuery SQL Data Preparation
      │
      ▼
Feature Engineering
      │
      ▼
Exploratory Data Analysis
      │
      ▼
Binary Classification
      │
      ├── LightGBM
      └── CatBoost
      │
      ▼
Multiclass Classification
      │
      ├── LightGBM
      └── CatBoost
      │
      ▼
Model Comparison
      │
      ▼
Power BI Dashboard
```

---

# Dataset

- Source: Steam Games Dataset 2025
- Games: ~240,000
- Reviews: ~1,000,000
- SQL Engine: Google BigQuery

---

# Technologies

- SQL (BigQuery)
- Python
- Pandas
- NumPy
- Scikit-learn
- LightGBM
- CatBoost
- Optuna
- Matplotlib
- Seaborn
- Power BI

---

# Repository Structure

```
steam-game-rating-prediction
│
├── sql/
├── notebooks/
├── powerbi/
├── images/
├── README.md
├── requirements.txt
└── .gitignore
```

---

# Data Preparation

The raw Steam dataset was processed in Google BigQuery.

Major preprocessing steps include:

- Review aggregation
- Feature engineering
- Missing value handling
- Genre normalization
- Target variable creation
- Data quality checks

The complete SQL pipeline is available in the **sql/** directory.

---

# Machine Learning Models

Two machine learning algorithms were evaluated.

## Binary Classification

Target:

```
Highly Rated = 1
positive_rate ≥ 90%

Otherwise = 0
```

Models:

- LightGBM
- CatBoost

---

## Multiclass Classification

Target Groups:

- 75–80%
- 81–85%
- 86–90%
- >90%

Models:

- LightGBM
- CatBoost

---

# Model Comparison

The binary classification approach achieved the strongest overall performance.

Although multiclass classification was evaluated to reduce dependence on a fixed threshold, severe class imbalance significantly reduced predictive performance for minority rating groups.

Therefore, binary classification was selected as the final modeling strategy.

---

# Power BI Dashboard

## Project Dashboard

![Steam analytics dashboard showing data charts and summary metrics for game rating prediction with a KPI panel on total games reviews and highly rated rate alongside bar charts for release year price range and top genres](images/overview_dashboard.png)

---

## Binary Classification Dashboard

![Binary classification dashboard showing model evaluation metrics score comparisons and feature impact visuals for Steam game ratings in a professional report layout](images/binary_classification_dashboard.png)

---

## Binary vs Multiclass Comparison

![Comparison dashboard presenting side by side binary and multiclass model performance charts confusion matrix summaries and visual comparison of prediction outcomes](images/binary_vs_multiclass_comparison_dashboard.png)

---

# Additional Visualizations

The **images/** folder also contains:

- ROC Curves
- Confusion Matrices
- Feature Importance plots

for both LightGBM and CatBoost models.

---

# Future Improvements

- Hyperparameter optimization with larger search spaces
- Additional ensemble methods
- SHAP value analysis
- Deployment using Streamlit or FastAPI

---

# Author

**Zehra Dedebali**

Data Analytics & Machine Learning Portfolio Project
