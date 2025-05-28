p_load("dlookr", "DataExplorer", "dplyr")

#dlookr

#Numeriche
plot_hist_numeric(df,
                  "age_years",
                  "survival_months",
                  title = "Histograms of numerical data in munich2019dataset",
                  each = FALSE)

#Categoriche
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
plot(all_cat)

#Numerica vs numerica
all_num <- compare_numeric(df)
plot(all_num)

eda_web_report(df)

#DataExplorer

#Categoriche
plot_bar(df$post_surgery_therapy_none0_monotherapy1_RT.TMZ2)

#Numeriche
plot_histogram(df$age_years)

#Numeriche vs categorica target
plot_boxplot(df, by = "SVZ_status_nocontact0_contact1")

#Categoriche vs categorica target
plot_bar(df, by = "SVZ_status_nocontact0_contact1")

#Numeriche vs numerica target
plot_scatterplot(df, by = "age_years", ncol = 1, nrow = 1)$page_4 +
  labs(y = "OS in months",
       x = "Age in years",
       title = "Age vS Survival") +
  scale_y_discrete(limits = factor(seq(0, 34, by = 0.01)), breaks = seq(0, 34, by = 1))

