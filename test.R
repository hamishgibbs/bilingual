a <- 1

print(a)

print(c(1, 2, 3))


require(dplyr)

d <- tibble(x = 1:3)

d %>%
  mutate(y = x * 8)

  
