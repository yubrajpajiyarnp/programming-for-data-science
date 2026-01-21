#function to vonvert from celsious to farenheit
celsius_to_farenheit<- function(c)
{
  f= (c*9/5)+32
  cat("the conversion of temperature from",c,"C is",f,"F")
}
celsius_to_farenheit(0)
celsius_to_farenheit(68)
celsius_to_farenheit(10)