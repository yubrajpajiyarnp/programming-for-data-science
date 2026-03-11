input_csv         <- "branches_input.csv"
branches_rank_csv <- "branches_by_rank.csv"
quarter_avg_csv   <- "quarter_wise_averages.csv"
region_avg_csv    <- "region_wise_averages.csv"

## Task 1 — Create Column Vectors

# Character vectors
BranchID <- c("BR001","BR002","BR003","BR004","BR005",
              "BR006","BR007","BR008","BR009","BR010")

BranchName <- c("Vellore Town","Chennai Central","Mumbai Andheri","Pune Hinjewadi",
                "Delhi Karol Bagh","Noida Sector 18","Kolkata Park St",
                "Hyderabad Hitech","Ahmedabad CG Rd","Jaipur MI Road")

Region <- c("South","South","West","West","North",
            "North","East","South","West","North")

Segment <- c("Grocery","Electronics","Grocery","Home","Apparel",
             "Electronics","Grocery","Home","Apparel","Home")

# Numeric vectors
Q1 <- c(120,140,110,95,150,132,105,128,115,108)
Q2 <- c(115,150,118,100,142,138,107,131,120,112)
Q3 <- c(130,145,122,108,155,136,112,134,125,118)
Q4 <- c(125,160,120,112,158,140,115,137,129,121)

# Duplicate column as required
Q3_Sales <- Q3

## Task 2 — Create Data Frame and Write Input CSV

branches <- data.frame(
  BranchID,
  BranchName,
  Region,
  Segment,
  Q1,
  Q2,
  Q3,
  Q4,
  Q3_Sales,
  stringsAsFactors = FALSE
)

# Show structure and preview
cat("\nStructure of branches:\n")
str(branches)

cat("\nFirst rows of branches:\n")
head(branches)

# Save input CSV
write.csv(branches, input_csv, row.names = FALSE, na = "")

cat("\nbranches_input.csv created successfully.\n")

## Task 3 — Read CSV and Validate Data

branches_in <- read.csv(input_csv, stringsAsFactors = FALSE)

cat("\nStructure of loaded CSV:\n")
str(branches_in)

# Define required columns
quarter_cols <- c("Q1","Q2","Q3","Q4")

required_cols <- c("BranchID","BranchName","Region","Segment",
                   quarter_cols,"Q3_Sales")

# Check missing columns
missing_cols <- setdiff(required_cols, names(branches_in))

if(length(missing_cols) > 0)
{
  stop(paste("Missing columns:", paste(missing_cols, collapse=", ")))
}

# Ensure numeric type
branches_in[quarter_cols] <- lapply(branches_in[quarter_cols], as.numeric)

## Task 4 — Per-Branch Analytics (Sum, Average, Rank)

# Calculate Sum
branches_in$Sum <- rowSums(branches_in[quarter_cols], na.rm = TRUE)

# Calculate Average
branches_in$Average <- branches_in$Sum / 4

# Calculate Rank (Highest = Rank 1)
branches_in$Rank <- rank(-branches_in$Sum, ties.method = "min")

# Sort by Rank and BranchID
branches_by_rank <- branches_in[order(branches_in$Rank,
                                      branches_in$BranchID), ]

# Save result CSV
write.csv(branches_by_rank,
          branches_rank_csv,
          row.names = FALSE,
          na = "")

cat("\nbranches_by_rank.csv created successfully.\n")

## Task 5 — Quarter-Wise Average

quarter_avg <- colMeans(branches_in[quarter_cols], na.rm = TRUE)

quarter_avg_df <- data.frame(
  Quarter = names(quarter_avg),
  Average = as.numeric(quarter_avg),
  stringsAsFactors = FALSE
)

# Save CSV
write.csv(quarter_avg_df,
          quarter_avg_csv,
          row.names = FALSE,
          na = "")

cat("\nquarter_wise_averages.csv created successfully.\n")

## Task 6 — Region-Wise Average

region_avg <- aggregate(
  branches_in[quarter_cols],
  by = list(Region = branches_in$Region),
  FUN = mean,
  na.rm = TRUE
)

# Add overall average
region_avg$Overall_Average <- rowMeans(region_avg[quarter_cols],
                                       na.rm = TRUE)

# Sort descending
region_avg <- region_avg[order(-region_avg$Overall_Average), ]

# Save CSV
write.csv(region_avg,
          region_avg_csv,
          row.names = FALSE,
          na = "")

cat("\nregion_wise_averages.csv created successfully.\n")


