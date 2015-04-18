Sys.setlocale(category="LC_CTYPE", locale = "russian")

тест
#gains <- t(matrix(c(budget$full_gain, budget$full_gain.1), ncol=2))
#gains

par(mfrow=c(1, 2))

barplot(budget$full_gain, names.arg=budget$year_1, col="yellow",
        main="ÐÑÐ´Ð¶ÐµÑ Ð³. Ð¢ÑÐµÑÐ³Ð¾ÑÐ½ÑÐ¹", xlab="ÐÐ¾Ð´", ylab="ÑÑÑ. ÑÑÐ±Ð»ÐµÐ¹")

abline(a = budget[1,]$full_gain, b = 0, col = 2)
txt1 <- format(budget[1,]$full_gain, digits=9, decimal.mark=",",
               big.mark=" ",small.mark=".", , small.interval=3)
txt1 <- paste(txt1, "ÑÑÑ. ÑÑÐ±Ð»ÐµÐ¹")
text(0, budget[1,]$full_gain, txt1, col = "red", adj = c(-.1, -1))

abline(a = budget[5,]$full_gain, b = 0, col = 2)
txt1 <- format(budget[5,]$full_gain, digits=9, decimal.mark=",",
               big.mark=" ",small.mark=".", , small.interval=3)
txt1 <- paste(txt1, "ÑÑÑ. ÑÑÐ±Ð»ÐµÐ¹")
text(0, budget[5,]$full_gain, txt1, col = "red", adj = c(-.1, 1.5))

#############################

barplot(budget$full_gain.1, names.arg=budget$year_1, col="orange",
        main="ÐÑÐ´Ð¶ÐµÑ Ð³. Ð¢ÑÐµÑÐ³Ð¾ÑÐ½ÑÐ¹ (Ñ ÑÑÐµÑÐ¾Ð¼ Ð¸Ð½ÑÐ»ÑÑÐ¸Ð¸)", xlab="ÐÐ¾Ð´", ylab="ÑÑÑ. ÑÑÐ±Ð»ÐµÐ¹")

abline(a = budget[1,]$full_gain.1, b = 0, col = 2)
txt1 <- format(budget[1,]$full_gain.1, digits=9, decimal.mark=",",
               big.mark=" ",small.mark=".", , small.interval=3)
txt1 <- paste(txt1, "ÑÑÑ. ÑÑÐ±Ð»ÐµÐ¹")
text(0, budget[1,]$full_gain.1, txt1, col = "red", adj = c(-.1, -1))

abline(a = budget[5,]$full_gain.1, b = 0, col = 2)
txt1 <- format(budget[5,]$full_gain.1, digits=9, decimal.mark=",",
               big.mark=" ",small.mark=".", , small.interval=3)
txt1 <- paste(txt1, "ÑÑÑ. ÑÑÐ±Ð»ÐµÐ¹")
text(0, budget[5,]$full_gain.1, txt1, col = "red", adj = c(-.1, 1.5))
