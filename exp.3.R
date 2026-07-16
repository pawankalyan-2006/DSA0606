employee_data <- data.frame(
  EmployeeID = c(1,2,3,4,5),
  Department = c("Sales","HR","Marketing","Sales","HR"),
  YearsOfService = c(5,3,7,4,2),
  PerformanceScore = c(85,92,78,90,76)
)

employee_data

ggplot(employee_data,
       aes(x = EmployeeID,
           y = PerformanceScore,
           group = 1,
           color = "Performance")) +
  geom_line(linewidth = 1.2) +
  geom_point(size = 3) +
  labs(
    title = "Employee Performance Trend",
    x = "Employee ID",
    y = "Performance Score",
    color = "Legend"
  ) +
  theme_minimal()

ggplot(employee_data,
       aes(x = Department,
           fill = Department)) +
  geom_bar() +
  labs(
    title = "Employees by Department",
    x = "Department",
    y = "Number of Employees"
  ) +
  theme_minimal()

ggplot(employee_data,
       aes(x = YearsOfService,
           y = PerformanceScore)) +
  geom_point(size = 4, color = "blue") +
  geom_smooth(method = "lm",
              se = FALSE,
              color = "red") +
  labs(
    title = "Years of Service vs Performance Score",
    x = "Years of Service",
    y = "Performance Score"
  ) +
  theme_minimal()

line_plot <- ggplot(employee_data,
                    aes(EmployeeID,
                        PerformanceScore,
                        group = 1)) +
  geom_line(color = "blue") +
  geom_point(size = 3)  

bar_plot <- ggplot(employee_data,
                   aes(Department,
                       fill = Department)) +
  geom_bar()

subplot(
  ggplotly(line_plot),
  ggplotly(bar_plot),
  nrows = 2
)

write.csv(employee_data, "employee_data.csv", row.names = FALSE)