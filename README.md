# H&M Customer Behavior Analysis and Purchase Prediction

This project is a data science case study designed to analyze customer purchasing behavior and predict sales trends using H&M’s customer and product data. The project includes customer segmentation, seasonal campaign performance evaluation, and sales forecasting using time series analysis.

---

## 🔍 About the Project

The objective of this study is to gain actionable insights from historical sales and transaction data of H&M. The analysis focuses on:

- Identifying customer clusters based on shopping habits.
- Measuring the impact of promotional campaigns on different customer segments.
- Forecasting sales for future periods, particularly focusing on seasonal trends.

The project uses Python and PostgreSQL for data preprocessing, analysis, and modeling.

---
## 📁 Project Structure & Business Rules


H-M/
├── Campaign Analysis/
├── Summer_Analysis/
├── TeamSeriesPredict1/
├── Stepby_PSQL/
├── README.md
└── LICENSE


### 📂 Campaign Analysis

**Business Rules Applied:**

- Campaign periods are defined by specific date ranges tied to marketing efforts.
- Only transactions within the campaign dates are included in performance analysis.
- Performance metrics include: total sales, conversion rate, and revenue per user.
- Customer engagement is evaluated by the number of transactions per campaign.
- Product categories are compared based on their uplift during campaigns.

### 📂 Summer_Analysis

**Business Rules Applied:**

- Summer period is defined from June 1st to August 31st.
- Only purchases made within the summer season are used for seasonal trend analysis.
- Top-selling categories and items are identified using purchase frequency and quantity.
- Heatmap visualizations show customer activity levels by product type and location.
- Seasonality is assumed to influence product demand significantly and is modeled accordingly.

### 📂 TeamSeriesPredict1

**Business Rules Applied:**

- Weekly aggregated sales data is used as input for time series models.
- Only data from the last 12 months is used to capture recent trends.
- Forecasting is performed for short-term periods (4–8 weeks ahead).
- Missing dates are filled with zero sales to maintain time series continuity.
- Seasonality and trend decomposition are used to improve model accuracy.
- Models evaluated: ARIMA, SARIMA, and Prophet.

---

## 🧠 Suggestions for Further Development

Here are some practical next steps to extend the value of the project:

1. **RFM Analysis Integration**: Combine Recency, Frequency, and Monetary metrics for more advanced segmentation.
2. **Predictive Campaign Optimization**: Use machine learning to predict which customer segments will respond best to a given promotion.
3. **Product Recommendation System**: Add collaborative filtering or content-based recommendation models using customer-product interactions.
4. **Customer Lifetime Value Modeling**: Estimate long-term value per customer to inform personalized marketing strategies.
5. **Real-Time Dashboard**: Build an interactive dashboard (e.g., with Streamlit or Power BI) for live tracking of campaign metrics and forecasts.
6. **Deep Learning Forecasting**: Explore LSTM or Transformer-based models for complex time series prediction.

---

## 📄 License

This project is licensed under the [MIT License](LICENSE).
