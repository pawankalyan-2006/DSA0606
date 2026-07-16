website_data <- data.frame(
  Date = as.Date(c("2023-01-01",
                   "2023-01-02",
                   "2023-01-03",
                   "2023-01-04",
                   "2023-01-05")),
  PageViews = c(1500,1600,1400,1650,1800),
  CTR = c(2.3,2.7,2.0,2.4,2.6)
)

website_data

ggplot(website_data,
       aes(x = Date,
           y = PageViews,
           group = 1)) +
  geom_line(color = "blue", linewidth = 1.2) +
  geom_point(color = "red", size = 3) +
  labs(
    title = "Daily Website Page Views",
    x = "Date",
    y = "Page Views"
  ) +
  theme_minimal()

top_ctr <- website_data[order(-website_data$CTR), ]

ggplot(top_ctr,
       aes(x = reorder(as.character(Date), CTR),
           y = CTR,
           fill = CTR)) +
  geom_bar(stat = "identity") +
  coord_flip() +
  labs(
    title = "Top Days by Click-Through Rate",
    x = "Date",
    y = "Click-Through Rate (%)"
  ) +
  theme_minimal()

interaction_data <- data.frame(
  Date = website_data$Date,
  Likes = c(120,135,110,145,160),
  Shares = c(40,45,35,50,55),
  Comments = c(25,30,20,35,40)
)

interaction_data

install.packages("tidyr")   # Run only once
library(tidyr)

interaction_long <- pivot_longer(
  interaction_data,
  cols = c(Likes, Shares, Comments),
  names_to = "Interaction",
  values_to = "Count"
)

ggplot(interaction_long,
       aes(x = Date,
           y = Count,
           fill = Interaction)) +
  geom_area() +
  labs(
    title = "User Interactions Over Time",
    x = "Date",
    y = "Number of Interactions"
  ) +
  theme_minimal()

line_plot <- ggplot(website_data,
                    aes(Date,
                        PageViews,
                        group = 1)) +
  geom_line(color = "blue") +
  geom_point(size = 3)

bar_plot <- ggplot(top_ctr,
                   aes(reorder(as.character(Date), CTR),
                       CTR,
                       fill = CTR)) +
  geom_bar(stat = "identity") +
  coord_flip()

subplot(
  ggplotly(line_plot),
  ggplotly(bar_plot),
  nrows = 2
)

write.csv(website_data,
          "website_analytics.csv",
          row.names = FALSE)

