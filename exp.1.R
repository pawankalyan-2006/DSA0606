sales_data <- data.frame(
  Month = c("January", "February", "March", "April", "May"),
  Sales = c(15000,18000,22000,20000,23000)
)

sales_data

ggplot(sales_data,
       aes(x = Month, y = Sales, group = 1)) +
  geom_line(color = "blue", linewidth = 1.5) +
  geom_point(size = 4, color = "red") +
  labs(
    title = "Monthly Sales",
    x = "Month",
    y = "Sales ($)"
  ) +
  theme_minimal()  

product_data <- data.frame(
  Product = c("Product A","Product B","Product C","Product D","Product E"),
  Sales = c(50000,42000,38000,30000,27000)
)

product_data

ggplot(product_data,
       aes(x = Product,
           y = Sales,
           fill = Product)) +
  geom_bar(stat = "identity") +
  labs(
    title = "Top Selling Products",
    x = "Products",
    y = "Annual Sales ($)"
  ) +
  theme_minimal()
advertising <- c(3000,3500,4200,3900,4500)

scatter_data <- data.frame(
  Advertising = advertising,
  Sales = c(15000,18000,22000,20000,23000)
)

scatter_data

ggplot(scatter_data,
       aes(x = Advertising,
           y = Sales)) +
  geom_point(size = 4, color = "darkgreen") +
  geom_smooth(method = "lm", se = FALSE, color = "red") +
  labs(
    title = "Advertising Budget vs Monthly Sales",
    x = "Advertising Budget ($)",
    y = "Monthly Sales ($)"
  ) +
  theme_minimal()

line_plot <- ggplot(sales_data,
                    aes(Month, Sales, group = 1)) +
  geom_line(color = "blue") +
  geom_point(size = 3)

ggplotly(line_plot)  

bar_plot <- ggplot(product_data,
                   aes(Product,
                       Sales,
                       fill = Product)) +
  geom_bar(stat = "identity")

ggplotly(bar_plot)

subplot(
  ggplotly(line_plot),
  ggplotly(bar_plot),
  nrows = 2
)