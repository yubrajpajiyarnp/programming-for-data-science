
install.packages("dplyr")

library(dplyr)

data("iris")

# Print full dataset
print(iris)

nrow(iris)
ncol(iris)

head(iris)
tail(iris)


summary(iris)

str(iris)

# Create basic plot of Sepal.Length over time
# (Row index assumed as time)

iris %>%
  mutate(Time = row_number()) %>%
  with(plot(Time, Sepal.Length,
            type = "l",
            main = "Sepal Length Over Time",
            xlab = "Time (Row Index)",
            ylab = "Sepal Length",
            col = "blue"))


# Handle missing data (remove missing values)

iris_clean <- iris %>%
  na.omit()

View(iris_clean)

# Display first few rows of cleaned dataset
head(iris_clean)

# Scatter Plot: Sepal.Length vs Petal.Length

iris_clean %>%
  with(plot(Sepal.Length, Petal.Length,
            main = "Scatter Plot: Sepal Length vs Petal Length",
            xlab = "Sepal Length",
            ylab = "Petal Length",
            pch = 19,
            col = "darkgreen"))

# Add regression line
model <- iris_clean %>%
  lm(Petal.Length ~ Sepal.Length, data = .)

abline(model, col = "red", lwd = 2)

# Create bins for Sepal.Length

iris_clean <- iris_clean %>%
  mutate(Sepal_Bin = cut(Sepal.Length,
                         breaks = c(-Inf, 5.0, 6.0, 7.0, Inf),
                         labels = c("Below 5.0",
                                    "5.0-5.9",
                                    "6.0-6.9",
                                    "7.0 and above")))

View(iris_clean)

# Boxplot of Petal.Length for Sepal.Length bins
iris_clean %>%
  with(boxplot(Petal.Length ~ Sepal_Bin,
               main = "Petal Length by Sepal Length Bins",
               xlab = "Sepal Length Bins",
               ylab = "Petal Length",
               col = "lightblue"))

# Group by Sepal_Bin and summarize average Petal.Length
# (same style as your reference code)
summary_data <- iris_clean %>%
  group_by(Sepal_Bin) %>%
  summarize(avg_Petal_Length = mean(Petal.Length, na.rm = TRUE))

print(summary_data)
View(summary_data)


# Load library again (reference style)
library(dplyr)
