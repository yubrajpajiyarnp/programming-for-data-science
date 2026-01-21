# Library borrowing system (sample data)
library_books <- list(
  "The Hobbit" = c("Alice", "Bob"),
  "1984" = c("Charlie", "Alice"),
  "Moby Dick" = c("Bob")
)

# Add new book with borrowers
add_book <- function(book, borrowers) {
  library_books[[book]] <<- borrowers
}

# Remove a book from the system
remove_book <- function(book) {
  library_books[[book]] <<- NULL
}

# Total number of borrowers for each book
total_borrowers <- function() {
  totals <- sapply(library_books, length)
  return(totals)
}

# Find book with highest and lowest number of borrowers
highest_lowest_borrowers <- function() {
  totals <- total_borrowers()
  
  highest_book <- names(totals)[which.max(totals)]
  lowest_book <- names(totals)[which.min(totals)]
  
  cat("Highest Borrowers:", highest_book, "=", max(totals), "\n")
  cat("Lowest Borrowers:", lowest_book, "=", min(totals), "\n")
}

# Example usage
add_book("Harry Potter", c("David", "Emma", "Alice"))
remove_book("Moby Dick")

print(total_borrowers())
highest_lowest_borrowers()
