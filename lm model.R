library(gapminder)
library(modelr)
library(modelr)
options(na.action=na.warn)
ggplot(gapminder,mapping=aes(year,lifeExp,group=country))+geom_line(alpha=1/3)
models <- tibble(a1=runif(250,-20,40),a2=runif(250,-5,5))
plrdmod <- ggplot(sim1,aes(x,y))+geom_abline(models,mapping=aes(intercept=a1,slope=a2),alpha=1/4)+geom_point()
model1 <- function(a,data){a[1]+data$x*a[2]}
model1(c(7,1.5),sim1)
measure_dist <- function(mod,data){
  diff <- data$y-model1(mod,data)
  sqrt(mean(diff^2))
}
measure_dist(c(7,1.5),sim1)
sim1_dist <- function(a1,a2){
  measure_dist(c(a1,a2),sim1)
}
models <- mutate(models,dist=purrr::map2_dbl(a1,a2,sim1_dist))
plot <- ggplot(sim1,aes(x,y))+geom_point(size=2,color="grey30")+geom_abline(aes(intercept=a1,slope=a2,color=-dist),data=filter(models,rank(dist)<=10))
plot1 <- ggplot(models,aes(a1,a2))+geom_point(data=filter(models,rank(dist)<=10),size=4,color="red")+geom_point(aes(colour=-dist))
expand.grid(a1 = seq(-5,20,length=25),a2 =seq(1,3,length=25))%>%
mutate(grid,dist=purrr::map2_dbl(a1,a2,sim1_dist))
grid%>%
  ggplot(aes(a1,a2))+geom_point(data=filter(grid,rank(dist)<=10),size=4,colour="red")+geom_point(aes(color=-dist))
ggplot(sim1,aes(x,y))+geom_point(size=2,color="grey30")+geom_abline(aes(intercept=a1,slope=a2,color= -dist),data=filter(grid,rank(dist)<=10))
best <- optim(c(0,0),measure_dist,data=sim1)
best$par
ggplot(sim1,aes(x,y))+geom_point(size=2,color="grey30")+geom_abline(intercept=best$par[1],slope=best$par[2])
