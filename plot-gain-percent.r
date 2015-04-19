#plots
#source read-and-clean

library(ggplot2)

levels(budget.m$kind) <- c("без изменений", "с учетом инфляции")

c <- ggplot(budget.m, aes(year_1, full_gain.2, fill=kind))

#position=position_dodge()

y_formatter <- function(x) {
  lab <- x * 100
}


c + 
  scale_x_reverse() +
  geom_bar(stat="identity") +
  scale_y_continuous(label=y_formatter) + 
  #  coord_flip() +
  facet_grid(. ~ kind) +
  labs(title = "Измение дохода бюджета относительно предыдущего года (в процетах)") + 
  labs(x = "год") + 
  labs(y = "общий объем дохода относительно предыдущего года в %") +
  theme(legend.position="none")

dev.copy(png, file = "plots/plot-gain-percent.png")
dev.off()