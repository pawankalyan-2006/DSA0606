sales_data <- data.frame(
  ProductID = c(1,2,3),
  ProductName = c("Product A","Product B","Product C"),
  JanuarySales = c(2000,1500,1200),
  FebruarySales = c(2200,1800,1400),
  MarchSales = c(2400,1600,1100)
)

sales_data

sales_long <- pivot_longer(
  sales_data,
  cols = c(JanuarySales, FebruarySales, MarchSales),
  names_to = "Month",
  values_to = "Sales"
)

sales_long

ggplot(sales_long,
       aes(x = ProductName,
           y = Sales,
           fill = Month)) +
  geom_bar(stat = "identity",
           position = "dodge") +
  labs(
    title = "Monthly Product Sales (First Quarter)",
    x = "Product Name",
    y = "Sales"
  ) +
  theme_minimal()

ggplot(sales_long,
       aes(x = Month,
           y = Sales,
           fill = ProductName,
           group = ProductName)) +
  geom_area(alpha = 0.7) +
  labs(
    title = "Overall Sales Trend",
    x = "Month",
    y = "Sales"
  ) +
  theme_minimal()

print(sales_data)

group_bar <- ggplot(sales_long,
                    aes(ProductName,
                        Sales,
                        fill = Month)) +
  geom_bar(stat = "identity",
           position = "dodge")

area_chart <- ggplot(sales_long,
                     aes(Month,
                         Sales,
                         fill = ProductName,
                         group = ProductName)) +
  geom_area()

subplot(
  ggplotly(group_bar),
  ggplotly(area_chart),
  nrows = 2
)

write.csv(sales_data,
          "product_sales.csv",
          row.names = FALSE)