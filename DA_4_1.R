# ---- 1) Create column vectors ----
Reg.No <- c("24BCE1001","24BCE1002","24BCE1003","24BCE1004","24BCE1005",
            "24BCE1006","24BCE1007","24BCE1008","24BCE1009","24BCE1010")

Name <- c("Aadesh Kumar","Bhavya Reddy","Charan Iyer","Divya Sharma","Esha Nair",
          "Farhan Khan","Gayathri Raj","Harish Kumar","Ishita Menon","Jai Verma")

Programme <- rep("B.Tech", 10)

Specialization <- c("CSE","AI","DS","IT","CSE","ECE","Cyber","AI","DS","IT")

Subject1 <- c(86,72,90,65,94,58,77,69,88,82)
Subject2 <- c(78,68,88,70,96,62,81,75,85,79)
Subject3 <- c(91,74,85,69,93,60,79,72,90,76)
Subject4 <- c(84,80,92,73,95,66,83,70,87,85)

Subject3_Marks <- Subject3

# ---- 2) Create the data frame ----
students <- data.frame(
  Reg.No = Reg.No,
  Name = Name,
  Programme = Programme,
  Specialization = Specialization,
  Subject1 = Subject1,
  Subject2 = Subject2,
  Subject3 = Subject3,
  Subject4 = Subject4,
  Subject3_Marks = Subject3_Marks,
  stringsAsFactors = FALSE
)

# ---- 3) Add Sum and Average ----
students$Sum <- rowSums(students[, c("Subject1","Subject2","Subject3","Subject4")])
students$Average <- students$Sum / 4

# ---- 4) Add Rank ----
students$Rank <- rank(-students$Sum, ties.method = "min")

# ---- 5) Print full table ----
print(students)

# ---- 6) Print sorted table by Rank ----
students_sorted <- students[order(students$Rank), ]
print(students_sorted)
