library(tidyverse)
library(RColorBrewer)
library(ggtext)
read_csv("TMscore_mat_rfvspd.csv") -> df

cc <- colorRampPalette(brewer.pal(9, "Blues"))(25)

x <- df1[1:5,] %>% 
  select(name)
x1 <- read_csv("orderpdb.csv" , row.names(F))
df1$name

df %>% 
  pivot_longer(-1) %>% 
  mutate(...1 = ...1 %>% factor(levels = x1 %>% pull()) %>% fct_rev(),
         name = name %>% factor(levels = x %>% pull())) %>%
  ggplot(aes(x = name,  y = ...1, fill = value)) +
  geom_tile() +
  scale_fill_gradientn(limits = c(0,1) , colours = cc) +
  theme_classic() +
  theme(axis.text.x = element_markdown(angle = 90,vjust = 0.5, hjust = 1, size = 20, colour = "black"),
        axis.text.y = element_markdown(size = 20 , colour = "black"),
        axis.title = element_blank(),
        legend.title = element_text(angle = 90 , hjust = 0.5, size = 20 ),
        axis.line = element_blank(),
        text = element_text(family = "Arial")) +
  guides(fill = guide_colourbar(barwidth = 1.5,
                                barheight = 18 , title = "TM-score",
                                title.position = "right" , 
                                label.theme = element_text(size = 20))) +
  coord_fixed()

ggsave("SupplFig4.svg" , width = 10 , height = 10)

