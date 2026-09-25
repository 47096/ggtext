# Demo 2 — progressive rich-text styling in ggplot2

library(ggplot2)
library(ggtext)
library(dplyr)
library(glue)

graph_data <- data.frame(
  Hashtag = rep(c("#python", "#rstats"), each = 4),
  Category = rep(c("FiveLikes", "FiveRTs", "HasURL", "HasMedia"), 2),
  NumTweets = c(179, 74, 604, 288, 428, 173, 592, 293),
  stringsAsFactors = FALSE
)

base_chart <- ggplot(graph_data, aes(x = Category, y = NumTweets, fill = Hashtag)) +
  geom_col(position = "dodge", alpha = 0.9) +
  theme_minimal() +
  xlab("") +
  ylab("") +
  scale_fill_manual(values = c("#ff8c00", "#346299")) +
  theme(
    panel.grid.major = element_blank(),
    panel.grid.minor = element_blank(),
    panel.background = element_blank(),
    axis.line = element_line(colour = "grey")
  )

# 1) Plain title (default ggplot2)
base_chart +
  labs(title = "#python and #rstats: Comparing 1,000 random tweets")

# 2) Coloured title
base_chart +
  labs(title = paste0(
    "<span style='color:#ff8c00'>#python</span> and ",
    "<span style='color:#346299'>#rstats</span>: Comparing 1,000 random tweets"
  )) +
  theme(plot.title = element_markdown())

# 3) Bold + coloured title
base_chart +
  labs(title = paste0(
    "<strong><span style='color:#ff8c00'>#python</span></strong> and ",
    "<strong><span style='color:#346299'>#rstats</span></strong>: Comparing 1,000 random tweets"
  )) +
  theme(plot.title = element_markdown(), legend.position = "none")

# 4) Styled axis labels (conditional markdown)
graph_data <- graph_data %>%
  mutate(
    category_with_color = ifelse(
      Category %in% c("FiveLikes", "FiveRTs"),
      glue("<strong><i style='color:red;font-size:14px'>{Category}</i></strong>"),
      glue("<strong><i>{Category}</i></strong>")
    )
  )

ggplot(graph_data, aes(x = category_with_color, y = NumTweets, fill = Hashtag)) +
  geom_col(position = "dodge", alpha = 0.9) +
  theme_minimal() +
  xlab("") +
  ylab("") +
  scale_fill_manual(values = c("#ff8c00", "#346299")) +
  labs(title = paste0(
    "<strong><span style='color:#ff8c00'>#python</span></strong> and ",
    "<strong><span style='color:#346299'>#rstats</span></strong>: Comparing 1,000 random tweets"
  )) +
  theme(
    plot.title = element_markdown(),
    legend.position = "none",
    axis.text.x = element_markdown(),
    panel.grid.major = element_blank(),
    panel.grid.minor = element_blank(),
    panel.background = element_blank(),
    axis.line = element_line(colour = "grey")
  )
