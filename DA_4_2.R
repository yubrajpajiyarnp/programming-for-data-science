
# Task 1 — Create Column Vectors

# Character vectors
PatientID <- c("HOS1001","HOS1002","HOS1003","HOS1004","HOS1005",
               "HOS1006","HOS1007","HOS1008","HOS1009","HOS1010")

Name <- c("Arjun Menon","Bhavana Iyer","Chirag Gupta","Devika Nair","Eshwar Rao",
          "Farida Sheikh","Gaurav Kumar","Harini Krishnan","Ishita S","Jatin Verma")

Department <- c("Cardiology","Neurology","Endocrinology","Pulmonology","Cardiology",
                "Endocrinology","Neurology","Pulmonology","Cardiology","Endocrinology")

Diagnosis <- c("Hypertension","Migraine","Type-2 Diabetes","Asthma","Hypertension",
               "Thyroid Disorder","Epilepsy","COPD","Arrhythmia","Type-1 Diabetes")

# Numeric vectors (test scores)
Test1 <- c(82,71,90,64,95,60,78,68,87,83)
Test2 <- c(76,69,92,70,94,63,82,72,85,79)
Test3 <- c(88,73,86,67,93,61,79,70,90,77)
Test4 <- c(84,75,91,72,96,66,81,69,88,85)

# Required duplicate column
Test3_Score <- Test3

# Task 2 — Build the Data Frame

patients <- data.frame(
  PatientID,
  Name,
  Department,
  Diagnosis,
  Test1,
  Test2,
  Test3,
  Test4,
  Test3_Score,
  stringsAsFactors = FALSE
)

# Display structure of data frame
cat("\nStructure of patients data frame:\n")
str(patients)

# Display first 6 rows
cat("\nFirst 6 rows of patients data frame:\n")
head(patients)

# Display full data frame
cat("\nFull patients data frame:\n")
print(patients)

# Task 3 — Patient-Level Sum, Average, Rank

# Compute Sum using rowSums (vectorized operation)
patients$Sum <- rowSums(patients[, c("Test1","Test2","Test3","Test4")])

# Compute Average
patients$Average <- round(patients$Sum / 4, 2)

# Compute Rank (Highest Sum = Rank 1)
# ties.method = "min" means tied values get same rank, next rank is skipped
patients$Rank <- rank(-patients$Sum, ties.method = "min")

# Display full data frame with new columns
cat("\nPatients data frame with Sum, Average, Rank:\n")
print(patients)

# Display sorted by Rank
cat("\nPatients sorted by Rank:\n")
patients_sorted <- patients[order(patients$Rank), ]
print(patients_sorted)

# Task 4 — Test-Wise Average (Overall)

test_cols <- c("Test1","Test2","Test3","Test4")

test_wise_avg <- colMeans(patients[, test_cols], na.rm = TRUE)

cat("\nTest-wise Average (Overall):\n")
print(round(test_wise_avg, 2))

# Task 5 — Department-Wise Averages (Per Test + Overall)

dept_test_avg <- aggregate(
  patients[, test_cols],
  by = list(Department = patients$Department),
  FUN = function(x) mean(x, na.rm = TRUE)
)

# Add Overall Department Average
dept_test_avg$Overall_Average <- round(
  rowMeans(dept_test_avg[, test_cols], na.rm = TRUE), 2
)

# Sort by Overall Average descending
dept_test_avg <- dept_test_avg[order(-dept_test_avg$Overall_Average), ]

# Display Department-wise averages
cat("\nDepartment-wise Test Averages:\n")
print(dept_test_avg)
