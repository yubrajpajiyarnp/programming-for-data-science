# Vector of names
names <- c("Alice", "Bob", "Charlie", "David")

# 1. Convert all names to uppercase
upper_names <- toupper(names)
print(upper_names)

# 2. Count number of characters in each name
char_count <- nchar(names)
print(char_count)

# 3. Check if any names contain the letter "a"
contains_a <- grepl("a", names, ignore.case = TRUE)
print(contains_a)
