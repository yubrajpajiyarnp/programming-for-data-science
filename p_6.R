# Function to calculate BMI (Body Mass Index)
calculate_bmi <- function(height, weight) {
  bmi <- weight / (height^2)
  cat("Height:", height, "Weight:", weight,"BMI:",bmi)          
}
calculate_bmi(1.7,6.5)
calculate_bmi(2,6.7)