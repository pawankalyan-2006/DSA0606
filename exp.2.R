customer_data <- data.frame(
  CustomerID = c(1,2,3,4,5),
  Age = c(25,30,35,28,40),
  Satisfaction = c(4,5,3,4,5)
)

customer_data

ggplot(customer_data, aes(x = Age)) +
  geom_histogram(binwidth = 5, fill = "skyblue", color = "black") +
  labs(
    title = "Distribution of Customer Ages",
    x = "Age",
    y = "Frequency"
  ) +
  theme_minimal()

satisfaction_table <- table(customer_data$Satisfaction)

pie(
  satisfaction_table,
  labels = names(satisfaction_table),
  main = "Customer Satisfaction Scores",
  col = rainbow(length(satisfaction_table))
)

customer_data$AgeGroup <- cut(
  customer_data$Age,
  breaks = c(20,30,40,50),
  labels = c("21-30","31-40","41-50"),
  include.lowest = TRUE
)

ggplot(customer_data,
       aes(x = AgeGroup,
           fill = factor(Satisfaction))) +
  geom_bar() +
  labs(
    title = "Customer Satisfaction by Age Group",
    x = "Age Group",
    y = "Number of Customers",
    fill = "Satisfaction"
  ) +
  theme_minimal()

library(wordcloud)

feedback <- c(
  "Excellent service",
  "Very satisfied",
  "Good support",
  "Excellent quality",
  "Fast delivery",
  "Friendly staff",
  "Satisfied customer",
  "Great experience",
  "Good product",
  "Excellent support"
)

words <- unlist(strsplit(tolower(paste(feedback, collapse = " ")), "\\s+"))

freq <- table(words)

wordcloud(
  names(freq),
  freq,
  random.order = FALSE,
  colors = rainbow(8)
)