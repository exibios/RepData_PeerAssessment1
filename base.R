link <- "https://d396qusza40orc.cloudfront.net/repdata%2Fdata%2Factivity.zip"
filename<-"repdata_data_activity.zip"
cwd <- getwd()
innerfolder <- paste(c(cwd,"/data"),collapse = "") 
dir.create(innerfolder)
outdir <- paste(c(innerfolder,"/",filename),collapse = "")
download.file(url = link,destfile = outdir)
unzip(outdir,exdir = paste(c(innerfolder)) )
