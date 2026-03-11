
library(dplyr)

data("starwars", package = "dplyr")

# View full dataset
print(starwars)

# Display first few rows
head(starwars)

# Summary statistics for height and mass

summary(starwars$height)
summary(starwars$mass)

# Display structure of dataset
str(starwars)

# Filter only Human characters

human_data <- starwars %>%
  filter(species == "Human")

View(human_data)

# Create Lean Mass Index (LMI) column
# Formula (same as BMI style): mass / (height/100)^2

human_data <- human_data %>%
  mutate(LMI = mass / (height/100)^2)

View(human_data)

# Average LMI grouped by homeworld
summary_data <- human_data %>%
  group_by(homeworld) %>%
  summarize(avg_LMI = mean(LMI, na.rm = TRUE))

print(summary_data)
View(summary_data)

# Histogram of LMI

hist(human_data$LMI,
     breaks = 10,
     main = "Histogram of LMI for Human Characters",
     xlab = "Lean Mass Index (LMI)",
     ylab = "Frequency",
     col = "lightblue",
     border = "black")


# Density Plot grouped by homeworld

plot(density(human_data$LMI, na.rm = TRUE),
     main = "Density Plot of LMI for Human Characters",
     xlab = "Lean Mass Index (LMI)",
     col = "blue",
     lwd = 2)

# Add another density curve (example: Tatooine humans)
tatooine_data <- human_data %>%
  filter(homeworld == "Tatooine")

lines(density(tatooine_data$LMI, na.rm = TRUE),
      col = "red",
      lwd = 2)

legend("topright",
       legend = c("All Humans", "Tatooine Humans"),
       col = c("blue", "red"),
       lwd = 2)


# Create height bins

human_data <- human_data %>%
  mutate(height_bin = cut(height,
                          breaks = c(-Inf, 150, 180, 210, Inf),
                          labels = c("Below 150",
                                     "150–179",
                                     "180–209",
                                     "210 and above")))

View(human_data)

# Bar chart of average LMI by height bin

height_summary <- human_data %>%
  group_by(height_bin) %>%
  summarize(avg_LMI = mean(LMI, na.rm = TRUE))

print(height_summary)

barplot(height_summary$avg_LMI,
        names.arg = height_summary$height_bin,
        main = "Average LMI by Height Bin",
        xlab = "Height Bin (cm)",
        ylab = "Average LMI",
        col = "lightgreen")
