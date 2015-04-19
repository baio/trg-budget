#setwd("C:/dev/budget")
#read and prepare data
budget <- read.csv("./data/trg_budget.csv", stringsAsFactors=FALSE)
budget[,c(3:6)] <- as.numeric(gsub(",", "", unlist(budget[,c(3:6)])))
#make 1k units
budget[,c(3:6)] <-  budget[,c(3:6)] / 1000

#order
budget <-  budget[order(-budget$year_1),]

#calc diffrences between years, loss current related to previous
dif <- diff(as.matrix(budget[,c(3:6)])) * -1
dif <- rbind(dif, c(0,0,0,0))
dif <- as.data.frame(dif)
pdif <- dif / budget[,c(3:6)]

#aggr by row
#diffrence between pervious and current year
budget[, c(7:10)] <- dif
#diffrence between pervious and current year in percents
budget[, c(11:14)] <- pdif

#here rows ordered from 2015 downto 2001
#1-year,2:13-monthly,14-total
inflation <- read.csv("./data/inf-2015-2001.csv", stringsAsFactors=FALSE, header=F)
inflation$month.mean <-  rowMeans(inflation[, c(2:13)])

#shift values row down to calulate diffs betwee years

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

#create discounted (ajusetd) and raw factors for each row
#raw - mean no valude modification on the columsn was made
#adjusted - values include infaltion

#calc adjusted budget values 
budget.adj <- budget
budget.adj[,c(3:14)] <- budget[,c(3:4)] * (1 + frm / 100)

budget$kind <- factor("raw")
budget.adj$kind <- factor("adj")

budget.m <- rbind(budget, budget.adj)
#budget.m$year_1 <- factor(budget.m$year_1)
#order from latest year
#budget.m <-  budget.m[order(-budget.m$year_1),]

#budget.adj <- budget[,c(3:6)] * (1 + frm / 100)
#budgeta.d[, c(1:2)] <- budget[,c(3:6)] * (1 + frm / 100)


