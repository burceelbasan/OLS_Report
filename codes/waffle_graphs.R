# I used this template for post-mentee question 3 and post-mentor question 3

# Values from the survey results
vals <- c(14, 8, 4)
# Transforming them to Percentages and Naming them
  val_names <- sprintf("%s (%s)", c("Always Constructive", "Mostly Constructive", "Somewhat Constructive"), scales::percent(round(vals/35, 2)))
  names(vals) <- val_names
  
  # For coloring
  waffle::waffle(vals,colors = c("#FEB24C", "#FC4E2A", "#BD0026")) 
