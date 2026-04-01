#Step1:
# Install necessary package
install.packages("ggplot2")
# Load the necessary package(s)
library(ggplot2)
#Step2: 
# Create a sample data frame in wide format
data <- data.frame(
  a = 1:10,
  b = rnorm(10),
  label = letters[11:20]
)
# print data
print(data)
#Step3:
#3.1.1. Create a scatter plot
ggplot(data = data, aes(x = a, y = b)) +
  geom_point() +
  labs(title = "Scatter Plot", x = "X-axis", y = "Y-axis")
#Step3:
#3.1.2. Create a scatter plot with color customizations
ggplot(data = data, aes(x = a, y = b)) +
geom_point(color = "forestgreen", size = 1) +
  labs(title = "Scatter Plot with Color Cusmization", x = "X-axis", y = "Y-axis")
#Step3:
#3.1.2. Create a scatter plot with text labels and colors
ggplot(data = data, aes(x = a, y = b)) +
  geom_point(color = "forestgreen", size = 3) +
  geom_text(aes(label = label), vjust = -1, color = "blue")+
  labs(title = "Scatter Plot with text labels", x = "X-axis", y = "Y-axis")
#Step3:
## 3.1.4 Create a scatter plot with customizations & a smooth line
ggplot(data = data, aes(x = a, y = b)) +
  geom_point(color = "forestgreen", size = 1) +
  geom_smooth(method = "lm", se = FALSE) +
  labs(title = "Scatter Plot with Smooth Line", x = "X-axis", y = "Y-axis")

#Step3:
#3.2. Create a line plot & with customizations
ggplot(data = data, aes(x = a, y = b)) +
  geom_line(color = "red", size = 1) +
  labs(title = "Line Plot", x = "X-axis", y = "Y-axis")

#Step3:
#3.3. Create a bar plot & with customizations
ggplot(data = data, aes(x = a, y = b)) +
  geom_bar(stat = "identity", fill = "blue") +
  labs(title = "Bar Plot", x = "X-axis", y = "Values")



