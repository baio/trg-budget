#setwd("C:/dev/budget")
#read and prepare data
budget <- read.csv("./data/trg_budget.csv", stringsAsFactors=FALSE)
budget[,c(3:6)] <- as.numeric(gsub(",", "", unlist(budget[,c(3:6)])))
#make 1k units
budget[,c(3:6)] <-  budget[,c(3:6)] / 1000

#order
budget <-  budget[order(-budget$year_1),]

#here rows ordered from 2015 downto 2001
#1-year,2:13-monthly,14-total
inflation <- read.csv("./data/inf-2015-2001.csv", stringsAsFactors=FALSE, header=F)
inflation$month.mean <-  rowMeans(inflation[, c(2:13)])

#adjust inflation
#take total year inaflation and monthly mean 
inf <- inflation[,c(14,15)]
#set current year no inflation
inf[1,1] <- 0
#accumulate inflation for each year
inf$cum <- cumsum(inf$V14)
#adgjusted as monly mean + cum inflation for pervious years
inf$adj <- inf$cum - inf$V14 + inf$month.mean
inf$adj[1] <- 0

#trunc rows to number of budjet rows 
inf <-inf[c(1:nrow(budget)),]

#create aux frame to fast multiply numeric columns
frm <- matrix(unlist(rep(inf$adj,6)), nrow=6)

#calc adjusted budget values 
budget[, c(7:10)] <- budget[,c(3:6)] * (1 + frm / 100)

