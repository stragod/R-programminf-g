ign <- function(x)
{
  if(x<0)
 {
  print("negative")
  }
  else if(x>0)
  {
    print("Positive")
  }
  else
  {
    print("0")
  }
  
}

v<- c(1:12)
M1 <- matrix(v,nrow=4,ncol=3)
v1<- c(13:24)
M2 <- matrix(v1,nrow=4,ncol=3)
x<- c("1","2","3","4")
y<- c("sex","height","weight")
A <- array(data=c(M1,M2),dim = c(4,3,2),dimnames = list(x,y))

Rows <-c()

for(i in 1:4)
{
  Rows <- c(Rows,paste("This is Row",i,sep=","))
}


write.table(A,file ="array.txt")
ads<- c("god",1,2,3,4)

library(tidyverse)
mpg
demo <- tribble(~a,~b,
               "bar1",20,
               "bar2",30,
               "bar3",40)

csv <- read_csv("a,b,c
         1,2,3
         4,5,6
         7,8,9")

