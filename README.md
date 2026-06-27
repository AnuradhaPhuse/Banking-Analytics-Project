# Banking-Analytics-Project using SQL, Python, Machine Learning & Power BI

## 📌 Project Overview

This project is an end-to-end Banking Analytics and Fraud Detection solution built using **SQL, Python, Machine Learning, and Power BI**. It analyzes banking transaction data to identify fraudulent transactions, uncover business insights, and present interactive dashboards for decision-making.

The project demonstrates the complete data analytics lifecycle, including data preprocessing, exploratory data analysis (EDA), SQL-based business analysis, machine learning model development, hyperparameter tuning, and interactive dashboard creation.

---

# 📂 Project Structure

```text
Banking-Analytics-Project/
│
├── data/
│   └── banking_cleaned.csv
│
├── notebooks/
│   └── Banking_Analytics.ipynb
│
├── sql/
│   ├── BankingAnalysis.sql
│  
│
├── powerbi/
│   └── Banking_analysis_dashboard.pbix
│
├── models/
│   └── full_dataset_fraud_model.pkl
|   └── sample_dataset_fraud_model.pkl
│
├── images/
│   ├── page1.png
│   ├── page2.png
│   ├── page3.png
│   ├── page4.png
│   └── page5.png
│
├── requirements.txt
├── README.md
└── LICENSE
```

---

# 🎯 Project Objectives

* Analyze banking transaction data.
* Detect fraudulent transactions using Machine Learning.
* Generate business insights through SQL analysis.
* Build interactive Power BI dashboards.
* Compare multiple Machine Learning algorithms.
* Improve model performance using Hyperparameter Tuning.

---

# 🛠️ Technologies Used

### Programming

* Python
* SQL (MySQL)

### Libraries

* Pandas
* NumPy
* Matplotlib
* Seaborn
* Scikit-learn
* XGBoost
* Imbalanced-learn (SMOTE)
* Joblib

### Business Intelligence

* Power BI

### Development Tools

* Jupyter Notebook
* Git
* GitHub

---

# 📊 Dataset Information

* Banking Transaction Dataset
* Total Records: **1,296,675**
* Features: Transaction Amount, Merchant, Category, Gender, State, City, Age, Hour, Fraud Status, etc.
* Target Variable:

  * `is_fraud`

    * 0 = Genuine Transaction
    * 1 = Fraudulent Transaction

---

# 🔄 Project Workflow

### 1. Data Collection

* Imported Banking Transaction Dataset

### 2. Data Cleaning

* Checked missing values
* Removed duplicates
* Corrected data types
* Converted date columns

### 3. Feature Engineering

Created new features including:

* Age
* Hour
* Month
* Day
* Amount Group
* Age Group

### 4. Exploratory Data Analysis (EDA)

Performed:

* Revenue Analysis
* Fraud Analysis
* Customer Analysis
* Transaction Analysis
* Category Analysis
* State Analysis
* Time-Based Analysis

Created more than **15 visualizations**.

---

# 🗄️ SQL Analysis

Implemented more than **30 SQL queries**, including:

### Executive Overview

* Total Transactions
* Total Revenue
* Fraud Rate
* Revenue by Category
* Monthly Revenue Trend

### Fraud Analysis

* Fraud by State
* Fraud by Category
* Fraud by Gender
* Fraud by Hour

### Transaction Analysis

* Revenue by Month
* Revenue by State
* Revenue by Category
* Transactions by Hour

### Customer Analysis

* Customers by Gender
* Customers by Age Group
* Top Cities
* Average Spend by Gender
* Top Jobs

### Reports & Insights

* Revenue Contribution
* Fraud Contribution
* Business Performance
* High-Risk Categories
* Monthly Insights

---

# 🤖 Machine Learning Pipeline

### Data Preprocessing

* Label Encoding
* Feature Selection
* Train-Test Split
* StandardScaler
* SMOTE for class balancing

### Machine Learning Models

* Logistic Regression
* Decision Tree
* Random Forest
* XGBoost

### Hyperparameter Tuning

* RandomizedSearchCV
* Random Forest Optimization
* XGBoost Optimization

---

# 📈 Model Evaluation

Evaluated all models using:

* Accuracy
* Precision
* Recall
* F1-Score
* ROC-AUC Score
* Confusion Matrix
* ROC Curve
* Feature Importance

Compared all models to identify the best-performing fraud detection model.

---

# 📊 Power BI Dashboard

The project includes an interactive **5-page dashboard**.

### 📄 Page 1 – Executive Overview

* KPI Cards
* Monthly Revenue Trend
* Revenue by Category
* Fraud vs Non-Fraud
* Interactive Filters

---

### 📄 Page 2 – Fraud Analysis

* Total Fraud Cases
* Fraud by State
* Fraud by Category
* Fraud by Gender
* Fraud by Hour

---

### 📄 Page 3 – Transaction Analysis

* Revenue Trend
* Transactions by Category
* Transactions by Hour
* Top Revenue States
* Peak Day & Peak Hour

---

### 📄 Page 4 – Customer Analysis

* Customer Demographics
* Customers by Gender
* Customers by Age Group
* Top Cities
* Top Occupations
* Average Spending

---

### 📄 Page 5 – Reports & Insights

* Executive KPIs
* Monthly Performance
* Fraud Distribution
* Top 10 Business Insights
* Management Recommendations

---

# 📷 Dashboard Preview

## Executive Overview

![Page 1][(images/overview.png)](https://github.com/AnuradhaPhuse/Banking-Analytics-Project/blob/main/Images/Overview.png)

## Fraud Analysis

![Page 2](images/fraud analysis.png)

## Transaction Analysis

![Page 3](images/transactions.png)

## Customer Analysis

![Page 4](images/customers.png)

## Reports & Insights

![Page 5](images/reports.png)

---

# 🚀 Future Improvements

* Real-time fraud detection
* Streamlit web application
* Deep Learning models
* Explainable AI (SHAP/LIME)
* Cloud deployment
* REST API integration


# 📌 Key Skills Demonstrated

* Data Cleaning
* Exploratory Data Analysis
* SQL Query Writing
* Business Intelligence
* Feature Engineering
* Machine Learning
* Fraud Detection
* Hyperparameter Tuning
* Model Evaluation
* Data Visualization
* Power BI Dashboard Development
* Git & GitHub
