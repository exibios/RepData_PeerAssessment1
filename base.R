
link <- "https://d396qusza40orc.cloudfront.net/repdata%2Fdata%2Factivity.zip"
filename<-"repdata_data_activity.zip"
cwd <- getwd()
innerfolder <- paste(c(cwd,"/data"),collapse = "") 
dir.create(innerfolder)
outdir <- paste(c(innerfolder,"/",filename),collapse = "")
download.file(url = link,destfile = outdir)
unzip(outdir,exdir = paste(c(innerfolder)) )

#df <- read.csv2(file="activity.zip",na.strings="NA",header = TRUE,sep = ",",quote = "\"",skipNul=TRUE,row.names = NULL)

unzip("activity.zip")
dir(getwd())
df <- read.csv2(file="activity.csv",na.strings = "NA",skip = 0,sep = ",")
str(df)
head(df[df$date=='2012-10-21',],100)
# correct data types
#steps -> int
#date -> date
#interval -> int
#######################################
install.packages("ggplot2") ## install
library(ggplot2)            ## load
install.packages("dplyr")   ## install
library("dplyr")            ## load

df$date = as.Date(df$date)

date_steps <-
  df %>%
  group_by(date) %>%
  summarize(steps_by_day = sum(steps))

knitr::
date_steps$date <- as.POSIXct(date_steps$date)
summary(date_steps)


g<-ggplot(data=date_steps,aes(date))
g+geom_histogram(stat= "bin")

#%>%
#+geom_histogram()#%>%
#+geom_vline(aes(xintercept = mean(steps_by_day,na.rm = TRUE)), colour="red",linetype=1)%>%
#+geom_vline(aes(xintercept = median(steps_by_day,na.rm = TRUE)), colour="green",linetype=2)

#######################################

head(df,100)
str(df)

df_cc <- df[complete.cases(df),]

date_interval <-
  df_cc %>%
  group_by(interval) %>%
  summarize(steps_avg = mean(steps))


g<-ggplot(data=date_interval,aes(x=interval,y=steps_avg))
g+geom_line(linetype="solid")+ggtitle("Titulo Aqui")+theme_minimal()
