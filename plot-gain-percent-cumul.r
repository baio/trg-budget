#plots
#source read-and-clean

library(ggplot2)

levels(budget.m$kind) <- c("без изменений", "с учетом инфляции")



cum_sum_raw <- budget.m[which(budget.m$kind == "без изменений"),]
cum_sum_raw$cum_p <- rev(cumsum(cum_sum_raw$full_gain.2))
cum_sum_adj <- budget.m[which(budget.m$kind == "с учетом инфляции"),]
cum_sum_adj$cum_p <- rev(cumsum(cum_sum_adj$full_gain.2))

data <- rbind(cum_sum_raw, cum_sum_adj)
data <- data[which(data$year_1 != 2015),]


c <- ggplot(data, aes(year_1, cum_p, fill=kind))

#position=position_dodge()

y_formatter <- function(x) {
  lab <- x * 100
}

x_formatter <- function(x) {
  lab <- x + 1
}


c + 
  scale_x_reverse(label=x_formatter) +
  geom_bar(stat="identity") +
  scale_y_continuous(label=y_formatter) + 
  #  coord_flip() +
  facet_grid(. ~ kind) +
  labs(title = "Динамика падения дохода бюджета относительно 2011г") + 
  labs(x = "год") + 
  labs(y = "падение дохода бюджета относительно 2011г (%)") +
  theme(legend.position="none")

dev.copy(png, file = "plots/plot-gain-percent-cumul.png")
dev.off()
