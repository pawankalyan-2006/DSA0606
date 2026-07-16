inventory_data <- data.frame(
  ProductID = c(1,2,3,4,5),
  ProductName = c("Product A","Product B","Product C","Product D","Product E"),
  Quantity = c(250,175,300,200,220)
)

inventory_data

ggplot(inventory_data,
       aes(x = ProductName,
           y = Quantity,
           fill = ProductName)) +
  geom_bar(stat = "identity") +
  labs(
    title = "Product Inventory Quantity",
    x = "Product Name",
    y = "Quantity Available"
  ) +
  theme_minimal()

inventory_data$Category <- c(
  "Electronics",
  "Electronics",
  "Furniture",
  "Furniture",
  "Stationery"
)

inventory_data

ggplot(inventory_data,
       aes(x = Category,
           y = Quantity,
           fill = ProductName)) +
  geom_bar(stat = "identity") +
  labs(
    title = "Product Quantity by Category",
    x = "Category",
    y = "Quantity Available",
    fill = "Products"
  ) +
  theme_minimal()

inventory_data$Price <- c(120,150,100,180,130)

inventory_data

ggplot(inventory_data,
       aes(x = Price,
           y = Quantity)) +
  geom_point(size = 4, color = "blue") +
  geom_smooth(method = "lm",
              se = FALSE,
              color = "red") +
  labs(
    title = "Product Price vs Quantity Available",
    x = "Product Price",
    y = "Quantity Available"
  ) +
  theme_minimal()
bar_plot <- ggplot(inventory_data,
                   aes(ProductName,
                       Quantity,
                       fill = ProductName)) +
  geom_bar(stat = "identity")

stack_plot <- ggplot(inventory_data,
                     aes(Category,
                         Quantity,
                         fill = ProductName)) +
  geom_bar(stat = "identity")

subplot(
  ggplotly(bar_plot),
  ggplotly(stack_plot),
  nrows = 2
)
write.csv(inventory_data,
          "product_inventory.csv",
          row.names = FALSE)