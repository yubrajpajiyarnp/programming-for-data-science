#function to convert the input to return as floating point number
getfloatinpt<-function(a)
{
  s<-as.numeric(a)
  cat("the converted input is",s)
}
#sending input
b<-getfloatinpt(4.4)
b<-getfloatinpt(HI)
b<-getfloatinpt(10)
