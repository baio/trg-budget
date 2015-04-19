#plots
#source read-and-clean

library(ggplot2)

levels(budget.m$kind) <- c("без изменений", "с учетом инфляции")

c <- ggplot(budget.m, aes(year_1, full_gain, fill=kind))

#position=position_dodge()

y_formatter <- function(x) {
  lab <- x / 1000000
}


c + 
  scale_x_reverse() +
  geom_bar(stat="identity") +
  scale_y_continuous(label=y_formatter) + 
  #  coord_flip() +
  facet_grid(. ~ kind) +
  labs(title = "Динамика изменнеий дохода бюджета г. Трехгорный 2011 - 2015 г") + 
  labs(x = "год") + 
  labs(y = "общий объем дохода (млрд. рублей)") +
  theme(legend.position="none")

dev.copy(png, file = "plots/plot-gain.png")
dev.off()