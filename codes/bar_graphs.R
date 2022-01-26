# I used this sample template for mid-mentee questions 4,5,8 / mid-mentor question 9/ post-mentee question 1 and post-mentor question 1

# Reading excel file
Data3_post_mentee_Renamed_1q <- read_xlsx("Data3_post_mentee_Renamed_1q.xlsx")
  view(Data3_post_mentee_Renamed_1q)
# Converting Responses to Percentages  
  Data3_post_mentee_Renamed_1q <-   Data3_post_mentee_Renamed_1q %>%   
    mutate(percent_answers = Responses / 35) 
  View(Data3_post_mentee_Renamed_1q)
# Creating a Column with Question Numbers
  Data3_post_mentee_Renamed_1q  <-  Data3_post_mentee_Renamed_1q %>%   
    mutate(numbers = c("Q1","Q2","Q3"))
  View(  Data3_post_mentee_Renamed_1q)
 # For Graph 
  p <-   Data3_post_mentee_Renamed_1q %>% 
    ggplot(aes(x = numbers, y= percent_answers, fill = numbers, label = scales::percent(percent_answers), labels = numbers))+ 
    geom_bar(stat="identity", color="black")+ 
    geom_text(position = position_dodge(width = .9),    # move to center of bars
              vjust = -0.5,    # nudge above top of bar
              size = 3)+ 
    scale_fill_manual(values = wes_palette(3, name = "Royal1",type = "continuous"), name = "") +
    xlab("Questions")+
    ylab("Percentage of Answers")+
    ggtitle("How was your overall project leadership experience in OLS-3?")+
    scale_y_continuous(labels = scales::percent)
  
  p
  
  # Creating Labels and Legend Explanations
  p+ scale_fill_discrete(name="Questions",
                         breaks=c("Q1","Q2","Q3"),
                         labels=c("I was able to meet ALL my goals","I was able to meet MOST of my goals","I was able work on my project but only PARTIALLY"))
  
