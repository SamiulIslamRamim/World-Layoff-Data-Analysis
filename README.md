# World-Layoff-Data-Analysis
This project cleans, explores, and visualizes global layoff data from 2020-2023 using SQL to identify key trends and insights.


### **Project Overview**

This project analyzes global layoff data from 2020 to 2023. It involves cleaning a raw dataset with SQL, performing exploratory analysis to uncover trends, and presenting the findings in a dashboard.

### **Methodology**

1.  **Data Cleaning (`data_cleaniing_1_WORLD_LAYOFFS.sql`):**
    * Removed duplicate records using the `ROW_NUMBER()` function.
    * Standardized text fields for company, industry, and country names.
    * Converted the date column to a uniform `DATE` format.
    * Handled null values and removed rows with incomplete data.

2.  **Exploratory Data Analysis (`data_explore_1_WORLD_LAYOFFS.sql`):**
    * Aggregated layoff totals by company, industry, and country.
    * Analyzed monthly trends to track layoff volume over time.
    * Used window functions to rank companies with the most layoffs each year.

3.  **Visualization (`layoff.pdf`):**
    * Summarized the findings in a dashboard that visualizes layoff trends, top affected companies, and geographical hotspots.

### **Key Findings**

* A massive surge in layoffs occurred in late 2022 and peaked in early 2023.
* Major tech companies like Amazon, Google, and Meta led the layoffs.
* Post-IPO companies represented the largest share of layoffs among company stages, at 19.15%.

### **Repository Contents**

* `data_cleaniing_1_WORLD_LAYOFFS.sql`: SQL script for the data cleaning process.
* `data_explore_1_WORLD_LAYOFFS.sql`: SQL script for the exploratory analysis.
* `layoff.pdf`: The final dashboard showcasing key insights.
* `layoff.pbix`: The dasboard project file.
