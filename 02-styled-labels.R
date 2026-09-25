library(ggplot2)
library(ggtext)
library(dplyr)

Hashtag <- c("#python", "#python", "#python", "#python", "#rstats", "#rstats", "#rstats", "#rstats")
Category <- c("FiveLikes", "FiveRTs", "HasURL", "HasMedia", "FiveLikes", "FiveRTs", "HasURL", "HasMedia") 
NumTweets <- c(179, 74, 604, 288, 428, 173, 592, 293)
graph_data <- data.frame(Hashtag, Category, NumTweets, stringsAsFactors = FALSE)

glimpse(graph_data)

ggplot(graph_data, aes(x=category_with_color, y=NumTweets, fill= Hashtag)) + 
  geom_col(position="dodge", alpha = 0.9) +
  theme_minimal() +
  xlab("") +
  ylab("") +
  theme(panel.grid.major = element_blank(), panel.grid.minor = element_blank(), panel.background = element_blank(), axis.line = element_line(colour = "grey")) +
  scale_fill_manual(values = c("#ff8c00", "#346299")) + 
  labs(
    title = "<strong><span style='color:#ff8c00'>#python</span></strong> and <strong><span style='color:#346299'>#rstats</strong>: Comparing 1,000 random tweets"
  ) +
  theme(
    plot.title = element_markdown(), legend.position = "none",
    axis.text.x = element_markdown() # Added element_markdown() to axis.text.x in theme
  ) 
