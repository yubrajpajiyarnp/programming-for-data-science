
input_csv  <- "students_input.csv"
rank_csv   <- "students_by_rank.csv"
assess_csv <- "assessment_wise_averages.csv"
spec_csv   <- "specialization_wise_averages.csv"

## Task 1 — Create Column Vectors and Data Frame

# Character vectors
RegNo <- c("24BCE1001","24BCE1002","24BCE1003","24BCE1004","24BCE1005",
           "24BCE1006","24BCE1007","24BCE1008","24BCE1009","24BCE1010")

Name <- c("Aadesh Kumar","Bhavya Reddy","Charan Iyer","Divya Sharma",
          "Esha Nair","Farhan Khan","Gayathri Raj","Harish Kumar",
          "Ishita Menon","Jai Verma")

Programme <- rep("B.Tech", 10)

Specialization <- c("CSE","AI","DS","IT","CSE",
                    "ECE","Cyber","AI","DS","IT")

# Numeric vectors
Assess1 <- c(18,15,20,14,20,12,17,16,19,18)
Assess2 <- c(17,16,19,15,20,14,18,17,18,17)
Assess3 <- c(19,14,18,15,19,13,17,16,19,16)
Assess4 <- c(18,18,20,16,20,16,19,15,18,19)

# Create data frame
students <- data.frame(
  RegNo,
  Name,
  Programme,
  Specialization,
  Assess1,
  Assess2,
  Assess3,
  Assess4,
  stringsAsFactors = FALSE
)

# Display structure and preview
cat("\nStructure of students data frame:\n")
str(students)

cat("\nFirst rows of students data frame:\n")
head(students)

## Task 2 — Write Input CSV

write.csv(students, input_csv, row.names = FALSE, na = "")

cat("\nstudents_input.csv created successfully.\n")

## Task 3 — Read CSV and Validate Data

students_in <- read.csv(input_csv, stringsAsFactors = FALSE)

cat("\nStructure of loaded CSV:\n")
str(students_in)

# Define required columns
assess_cols <- c("Assess1","Assess2","Assess3","Assess4")

required_cols <- c("RegNo","Name","Programme","Specialization", assess_cols)

# Validate columns exist
missing_cols <- setdiff(required_cols, names(students_in))

if(length(missing_cols) > 0)
{
  stop(paste("Missing columns:", paste(missing_cols, collapse=", ")))
}

# Ensure assessment columns are numeric
students_in[assess_cols] <- lapply(students_in[assess_cols], as.numeric)

## Task 4 — Per-Student Analytics (Total, Average, Rank)

# Compute Total
students_in$Total <- rowSums(students_in[assess_cols], na.rm = TRUE)

# Compute Average
students_in$Average <- students_in$Total / 4

# Compute Rank (Highest Total = Rank 1)
students_in$Rank <- rank(-students_in$Total, ties.method = "min")

# Sort by Rank and RegNo
students_by_rank <- students_in[order(students_in$Rank,
                                      students_in$RegNo), ]

# Save CSV
write.csv(students_by_rank, rank_csv, row.names = FALSE, na = "")

cat("\nstudents_by_rank.csv created successfully.\n")

## Task 5 — Assessment-Wise Average

assessment_avg <- colMeans(students_in[assess_cols], na.rm = TRUE)

assessment_avg_df <- data.frame(
  Assessment = names(assessment_avg),
  Average = as.numeric(assessment_avg),
  stringsAsFactors = FALSE
)

# Save CSV
write.csv(assessment_avg_df, assess_csv, row.names = FALSE, na = "")

cat("\nassessment_wise_averages.csv created successfully.\n")

## Task 6 — Specialization-Wise Average
specialization_avg <- aggregate(
  students_in[assess_cols],
  by = list(Specialization = students_in$Specialization),
  FUN = mean,
  na.rm = TRUE
)

# Add overall average
specialization_avg$Overall_Average <- rowMeans(
  specialization_avg[assess_cols],
  na.rm = TRUE
)

# Sort descending
specialization_avg <- specialization_avg[
  order(-specialization_avg$Overall_Average),
]

# Save CSV
write.csv(specialization_avg, spec_csv, row.names = FALSE, na = "")

cat("\nspecialization_wise_averages.csv created successfully.\n")

