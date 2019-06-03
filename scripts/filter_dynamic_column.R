
# Filters dataframe using dynamic column value
# Solution found online 
# Credit to Keith McNulty at Towards Data Science



# df: data frame
# fcol1: column name (can be dynamic)
# fv1: what you want to filter by
# Example: filter1_by(filtered, fill_choice, "Y")

filter1_by <- function(df, fcol1, fv1) {
  
  filter_var1 <- quo(fcol1)
  df %>% filter_at(vars(!!filter_var1), all_vars(. == fv1))
}
