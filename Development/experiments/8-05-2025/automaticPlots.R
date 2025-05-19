p_load("dlookr", "DataExplorer", "dplyr")

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

#Target vs altra
target <- target_by(df, target = post_surgery_therapy_none0_monotherapy1_RT.TMZ2)
plot(relate(target, survival_months))

#Categorica vs categorica
all_cat <- compare_category(df)
plot(all_cat, prompt = TRUE)

#Numerica vs numerica
all_num <- compare_numeric(df)
plot(all_num, prompt = TRUE)

eda_web_report(df)

#dataExplorer
plot_bar(df$post_surgery_therapy_none0_monotherapy1_RT.TMZ2)

plot_histogram(df$age_years)

plot_boxplot(df, by = "SVZ_status_nocontact0_contact1")

plot_scatterplot(df, by = "SVZ_status_nocontact0_contact1",
                 ncol = 1,
                 nrow = 1)$page_1 +
  scale_y_discrete(name = "Hello")
