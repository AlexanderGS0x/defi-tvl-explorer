# Install and load libraries
install.packages(c("tidyverse", "lubridate", "ggplot2", "scales"))
library(tidyverse)
library(lubridate)
library(ggplot2)
library(scales)

# Read cleaned data
tvl_data <- read_csv("cleaned_defi_tvl_data.csv")

# Convert Date to Date type
tvl_data$Date <- as_date(tvl_data$Date)

# Check date range and protocols
summary(tvl_data)
unique(tvl_data$Protocol)

# Aggregate monthly TVL (average TVL per month)
monthly_tvl <- tvl_data %>%
  mutate(Year = year(Date), Month = month(Date)) %>%
  group_by(Protocol, Year, Month) %>%
  summarise(Avg_TVL = mean(TVL_USD, na.rm = TRUE), .groups = "drop") %>%
  mutate(Date = as_date(paste(Year, Month, "01", sep = "-")))

# Read BigQuery results for growth percentages
growth_data <- read_csv("tvl_growth_results.csv")

# Identify top protocol
top_protocol <- growth_data %>%
  arrange(desc(growth_percentage)) %>%
  slice(1)
cat("Top Protocol:", top_protocol$Protocol, "with", top_protocol$growth_percentage, "% growth\n")

# Visualization 1: Line chart of monthly TVL trends
line_plot <- ggplot(monthly_tvl, aes(x = Date, y = Avg_TVL, color = Protocol)) +
  geom_line(size = 1.2) +
  geom_point(size = 2) +
  labs(title = "DeFi Protocol TVL Trends (Q1 2024 - Q1 2025)",
       subtitle = "Monthly Average TVL in USD",
       x = "Date", y = "TVL (USD)",
       caption = "Data Source: DeFiLlama") +
  theme_minimal(base_size = 14) +
  scale_y_continuous(labels = dollar_format(scale = 1e-9, suffix = "B")) +
  scale_x_date(date_breaks = "1 month", date_labels = "%b %Y") +
  theme(legend.position = "bottom",
        plot.title = element_text(face = "bold"),
        axis.text.x = element_text(angle = 45, hjust = 1))

# Save line plot
ggsave("tvl_trends_line_plot.png", line_plot, width = 10, height = 6, dpi = 300)

# Visualization 2: Bar chart of growth percentages
bar_plot <- ggplot(growth_data, aes(x = reorder(Protocol, -growth_percentage), y = growth_percentage, fill = Protocol)) +
  geom_bar(stat = "identity", color = "black", size = 0.2) +
  labs(title = "TVL Growth by DeFi Protocol",
       subtitle = "Percentage Change from Q1 2024 to Q1 2025",
       x = "Protocol", y = "Growth (%)",
       caption = "Data Source: DeFiLlama via BigQuery") +
  theme_minimal(base_size = 14) +
  theme(axis.text.x = element_text(angle = 45, hjust = 1),
        plot.title = element_text(face = "bold"),
        legend.position = "none") +
  scale_fill_brewer(palette = "Set3") +
  geom_text(aes(label = sprintf("%.1f%%", growth_percentage)), vjust = -0.5, size = 4)

# Save bar plot
ggsave("tvl_growth_bar_plot.png", bar_plot, width = 10, height = 6, dpi = 300)