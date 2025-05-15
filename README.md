# 🍕 Pizza Delivery Preferences – Conjoint Analysis in R

This project analyzes customer preferences for different pizza delivery options using **conjoint analysis**. The goal is to understand which features (and combinations) influence customer choices the most, such as size, crust, topping, price, and delivery time.

---

## 📌 Objective

To identify:
- The **most preferred combinations** of pizza features.
- The **importance** of each feature in customer decision-making.
- The **part-worth utilities** for individual attribute levels.

---

## 🧠 Methodology

We used **Conjoint Analysis** in R using the `conjoint` package. The steps followed were:

1. **Generate a Full Factorial Design**:
   - Used `expand.grid()` to create all possible combinations of features.
   - Total combinations: 3 × 3 × 3 × 3 × 3 = 243

2. **Create an Orthogonal Design**:
   - Reduced the combinations to 13 using `caFactorialDesign()` for practical surveying.

3. **Encode the Design**:
   - Encoded both the full and orthogonal designs using `caEncodedDesign()`.

4. **User Ratings**:
   - Ratings from respondents were collected in an Excel file (`ConjointData.xlsx`).
   - Users rated 13 combinations on a scale (e.g., 1 to 10).

5. **Analysis Performed**:
   - **Part-worth Utilities**: How much users value each level of a feature.
   - **Importance Scores**: Overall importance of each attribute.
   - **Preference Prediction**: Identified top combinations based on total utility.

---

## 🔍 Features Considered

| Feature       | Levels                          |
|---------------|----------------------------------|
| Size          | Small, Medium, Large             |
| Crust         | Thin, Medium, Large              |
| Topping       | Margherita, Salami, Vegetarian   |
| Price         | $7, $10, $13                     |
| Delivery Time | 20 minutes, 40 minutes, 60 minutes |

---



