# Demo 1 — colour-highlighted plot title with ggtext
library(ggplot2)
library(ggtext)
library(dplyr)
library(hrbrthemes)  # theme_ipsum()

iris %>%
  group_by(Species) %>%
  summarize(mean_petal_width = mean(Petal.Width), .groups = "drop") %>%
  ggplot(aes(Species, mean_petal_width, fill = Species)) +
  geom_col(show.legend = FALSE) +
  theme_ipsum() +
  scale_fill_manual(values = c(
    setosa = "lightgray",
    versicolor = "lightgray",
    virginica = "red"
  )) +
  labs(
    x = NULL,
    y = NULL,
    title = "<span style='color: red;'>Virginica irises</span> have the largest average sepal width"
  ) +
  theme(plot.title = element_markdown())
