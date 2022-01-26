I used this template for the mid-mentee question 1

# Creating the Columns with number of answers and persentage of answers
Data3_midRenamed_FirstQ_summary <- Data3_midRenamed_Firstq %>% 
  group_by(responses) %>% 
  count(name = "n_answers") %>% 
  group_by(responses) %>% 
  mutate(percent_answers = n_answers / 23) %>% 
  mutate(percent_answers_label = percent(percent_answers, accuracy = 1))
view(Data3_midRenamed_FirstQ_summary)
# Transforming to continuous data
Data3_midRenamed_FirstQ_summary$responses <- toString(Data3_midRenamed_FirstQ_summary$responses)
# Creating responses labels
Data3_midRenamed_FirstQ_summary <- Data3_midRenamed_FirstQ_summary %>% 
add_column(opinions = c("Neutral", "Good", "Very Good"))
view(Data3_midRenamed_FirstQ_summary)
# Changing the order of the coulumns
Data3_midRenamed_FirstQ_summary <- Data3_midRenamed_FirstQ_summary[, c("responses", "n_answers", "percent_answers", "percent_answers_label", "opinions")]
Data3_midRenamed_FirstQ_summary <- Data3_midRenamed_FirstQ_summary[, c("responses","opinions", "n_answers","percent_answers", "percent_answers_label")] 
view(Data3_midRenamed_FirstQ_summary)
# Creating the graph
Data3_midRenamed_FirstQ_summary %>%
  ggplot(aes(x = "OLS-3 program is helping me work openly", 
             y = percent_answers,
             fill = opinions)) +
  geom_col() +
  geom_text(aes(label = percent_answers_label),
            position = position_stack(vjust = 0.5),
            color = "white",
            fontface = "bold") +
  coord_flip() +
  scale_x_discrete() +
  scale_fill_viridis_d() +
  labs(title = "Answers for the First Question in Data3_mid",
       x = NULL,
       fill = NULL) +
  theme_minimal() +
  theme(axis.text.x = element_blank(),
        axis.title.x = element_blank(),
        panel.grid = element_blank(),
        legend.position = "top")     
# Diverging the percentages
Data3_midRenamed_FirstQ_summary_divergening <- Data3_midRenamed_FirstQ_summary %>%
  mutate(percent_answers = if_else(responses %in% c("5", "4"), percent_answers, -percent_answers)) %>% 
  mutate(percent_answers_label = percent(percent_answers, accuracy = 1))
view(Data3_midRenamed_FirstQ_summary_divergening)
Data3_midRenamed_FirstQ_summary_divergening_right_order <- Data3_midRenamed_FirstQ_summary_divergening_good_labels %>% 
  mutate(opinions = fct_relevel(opinions,
                               "Neutral", "Good", "Very Good"),
         opinions = fct_rev(opinions)) 
  Data3_midRenamed_FirstQ_summary_divergening_right_order
# Final Form
  Data3_midRenamed_FirstQ_summary_divergening_right_order %>%
  ggplot(aes(x = "OLS-3 program is helping me work openly", 
             y = percent_answers,
             fill = opinions)) +
  geom_col() +
  geom_text(
    aes(label = percent_answers_label),
    position = position_stack(vjust = 0.5),
    color = "white",
    fontface = "bold"
  ) +
  coord_flip() +
  scale_x_discrete() +
  scale_fill_viridis_d() +
  labs(title = "Answers for the First Question in Data3_mid",
       x = NULL,
       fill = NULL) +
  theme_minimal() +
  theme(axis.text.x = element_blank(),
        axis.title.x = element_blank(),
        panel.grid = element_blank(),
        legend.position = "top")
