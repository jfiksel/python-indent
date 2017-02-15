# This file represents all known cases of special-case indentations

x <- c("this",
       "is",
       "a",
       "test")

y <- c(1:5, 0.6, 0.9)

y %>% round(2) %>%
  print()

list <- list(c(1,2,3),
             c("test"),
             3)

for (i in 1:10){
  # run this code
  # @stephen I'm not vectorizing
  dnorm(i,0,1) %>%
    print()

}
