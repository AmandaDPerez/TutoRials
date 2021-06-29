#install.packages("devtools")
devtools::install_github("arthurwelle/codehover")

library(tidyverse)
library(htmltools)
library(knitr)
library(codehover)

ggplot() +
  geom_point(data = cars,
             aes(x = speed, 
                 y = dist,
                 color = 'red')) +
  scale_y_continuous(limits = c(0,100)) +
  labs(title = 'A ggplot fot the rest of us',
       subtitle = 'Testing a way of explicit showing the R workflow') +
  theme_bw()

# create IMG folted
#dir.create("./IMG/")


g <- ggplot2::ggplot() +
  geom_point(data = cars,
             aes(x = speed, 
                 y = dist))

ggplot2::ggsave("./IMG/1b.png", width = 4, height = 3) 

g <-  g + aes(color = "red")
ggplot2::ggsave("./IMG/2b.png", width = 4, height = 3) 

g <-  g + scale_y_continuous(limits = c(0,100))
ggplot2::ggsave("./IMG/3b.png", width = 4, height = 3) 

g <-  g + labs(title = "A ggplot fot the rest of us")
ggplot2::ggsave("./IMG/4b.png", width = 4, height = 3) 

g <-  g + labs(subtitle = "Testing a way of explicit showing the R workflow")
ggplot2::ggsave("./IMG/5b.png", width = 4, height = 3) 

g <-  g + theme_bw()
ggplot2::ggsave("./IMG/6b.png", width = 4, height = 3) 

## creating

result <- ch_int(type = "incremental") %>% 
  ch_row(text = 
           "ggplot() + 
                      <br> <tab1> geom_point(data = cars, </tab1>
                      <br> <tab2> aes(x = speed, </tab2>
                      <br> <tab2> &nbsp; &nbsp; y = dist, </tab2>",
         img ="./IMG/1b.png") %>% 
  ch_row(text = "<tab2> color = 'red')) + </tab2>",
         img ="./IMG/2b.png") %>%   
  ch_row(text = "<tab1> scale_y_continuous(limits = c(0,100)) + </tab1>",
         img ="./IMG/3b.png") %>% 
  ch_row(text = "<tab1> labs(title = 'A ggplot fot the rest of us', </tab1>",
         img ="./IMG/4b.png") %>%   
  ch_row(text = "<tab2> subtitle = 'Testing a way of explicit showing the R workflow') + </tab2>",
         img ="./IMG/5b.png") %>% 
  ch_row(text = "<tab1>  theme_bw()</tab1> ",
         img ="./IMG/6b.png") %>%
  ch_out(img = "./IMG/1b.png") 
code1 <- htmltools::HTML(result)

code1
