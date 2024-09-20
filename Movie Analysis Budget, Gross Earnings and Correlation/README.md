# Movie Dataset Analysis: Budget, Gross Earnings, and Correlation Insights

This project focuses on analyzing a dataset of movies using Python libraries such as Pandas, Seaborn, and Matplotlib. The goal is to explore relationships between various movie attributes, such as budget, gross earnings, and release dates, while identifying key correlations through visualizations and statistical analysis. The dataset used for this analysis can be found at [Kaggle](https://www.kaggle.com/datasets/danielgrijalvas/movies).

## Key Steps and Approach

### Data Loading and Cleaning

- The movie dataset is loaded from a CSV file using Pandas.
- A quick inspection of the data reveals missing values, which are handled by replacing NaN values in columns like budget, gross, and rating with 0.
- Data types of certain columns are adjusted for analysis (e.g., converting budget and gross to integers).

### Date Transformation

- A custom function is used to transform the release date from a string format (e.g., "February 7, 2020") into a standard date format.
- A new column, `yearcorrect`, is created to extract the year from the release date.

### Exploratory Data Analysis

- The dataset is sorted by gross earnings, and duplicates are removed to ensure data integrity.
- Scatter plots and regression plots are created to visualize the relationship between budget and gross earnings.
- A correlation matrix is generated using Pearson’s correlation to identify relationships between numeric variables such as budget, gross earnings, and rating.

### Correlation Analysis

- A correlation heatmap is produced to visualize the strength of the relationships between various numeric movie features.
- Non-numeric columns (e.g., categorical data) are converted into numerical codes to allow for more comprehensive correlation analysis.

### Visualizations

- Several plots, including scatter plots, regression plots, and heatmaps, are used to highlight trends and relationships within the data.
- The results provide insights into how movie budgets correlate with gross earnings, and the overall influence of other movie features.

## Tools and Libraries

- **Pandas** for data manipulation and cleaning.
- **Seaborn** for advanced data visualization.
- **Matplotlib** for generating plots and charts.
- **NumPy** for handling missing values and numerical computations.

## Conclusion

This project provides a detailed analysis of movie data, uncovering significant correlations between budget and gross earnings while demonstrating the power of data cleaning, visualization, and transformation techniques in Python. The insights derived from this analysis can assist in understanding key factors that influence movie performance in the industry.
