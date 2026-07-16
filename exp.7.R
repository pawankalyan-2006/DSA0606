customer_data <- data.frame(
  CustomerID = c(1,2,3),
  Age = c(28,35,42),
  Gender = c("Female","Male","Female"),
  Income = c(50000,60000,75000)
)

customer_data

ggplot(customer_data,
       aes(x = factor(CustomerID),
           y = Age,
           fill = factor(CustomerID))) +
  geom_bar(stat = "identity") +
  labs(
    title = "Customer Age Distribution",
    x = "Customer ID",
    y = "Age (Years)"
  ) +
  theme_minimal()

gender_count <- table(customer_data$Gender)

pie(
  gender_count,
  labels = paste(names(gender_count), gender_count),
  col = c("pink","lightblue"),
  main = "Gender Distribution"
)

print(customer_data)

bar_chart <- ggplot(customer_data,
                    aes(x = factor(CustomerID),
                        y = Age,
                        fill = factor(CustomerID))) +
  geom_bar(stat = "identity")  

pie_chart <- plot_ly(
  labels = names(gender_count),
  values = as.numeric(gender_count),
  type = "pie"
)

subplot(
  ggplotly(bar_chart),
  pie_chart,
  nrows = 2
)

