p_load("summarytools", "dlookr", "DataExplorer")

#dlookr
plot_hist_numeric(df,
                  "age_years",
                  "survival_months",
                  title = "Histograms of numerical data in munich2019dataset",
                  each = FALSE)

plot_bar_category(df,
                  "SVZ_status_nocontact0_contact1",
                  title = "Bar charts of Sex",
                  each = FALSE)

plot(univar_category(df), prompt = TRUE)

eda_web_report(df)

#dataExplorer
plot_bar(df$cHsp70_low0_high1)$page_1 +
  geom_text(aes(label = after_stat(y)), position = position_fill(-5)) +
  labs(y = "Frequency")
