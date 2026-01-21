#function to take first name and last name and return the combination of both name
make_full_name<-function(first_name, last_name) 
{
  f_name=paste(first_name, last_name)
  cat("new full name",f_name)
}
make_full_name("yubraj", "pajiyar")
make_full_name("ram","ji")