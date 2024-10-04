library(tidyverse)
library(RColorBrewer)
library(ggtext)
read_csv("Pairwise_heatmap.csv") -> df

colnames(df) -> loki

df %>% 
  mutate(loki , .before = "Aeropyrum pernix") %>%
  column_to_rownames("loki") %>% 
  as.matrix() -> mat1

read_csv("order.csv" , row.names(F)) -> order
order %>% pull() -> order1

mat1[order1,order1] -> mat2
rownames(mat2) <- c(name1)
colnames(mat2) <- c(name1)
as.data.frame(mat2) -> df
read_csv("New_order.csv" , row.names(F)) -> name
name %>% pull() -> name1


  
cc <- colorRampPalette(brewer.pal(9, "Blues"))(25)

name %>%
  separate(X1, into = c("x", "y"), sep = "_") %>% 
  #mutate(y = paste0("_", y)) %>% 
  mutate(orderi = row_number()) %>% 
  mutate(name_new = glue("*{x}* {y}"),
         name_new = name_new %>% fct_reorder(orderi)) %>% 
  mutate(X1 = name %>% pull(), .before = x) -> ddff

ddff %>% 
  select(X1, name_new) -> first_df

df %>% 
  rownames_to_column("loki") %>% 
  pivot_longer(-1) %>% 
  left_join(first_df %>% mutate(loki = X1 %>% fct_rev())) %>% 
  left_join(first_df %>% rename(name = X1, name_two = name_new)) %>% 
  select(name_new, name_two, value) %>% 
  rename(X1 = name_new,
         name = name_two) %>% 
  mutate(X1 = X1 %>% fct_rev()) %>% 
  ggplot(aes(x = name, y = X1, fill = value)) +
  geom_tile() +
  scale_fill_gradientn(limits = c(0,100) , colours = cc) +
  theme_classic() +
  theme(axis.text.x = element_markdown(angle = 90, vjust = 0.5, hjust = 1, size = 19, colour = "black"),
        axis.text.y = element_markdown(size = 19 , colour = "black"),
        axis.title = element_blank(),
        legend.title = element_text(angle = 90 , hjust = 0.5, size = 19 ),
        axis.line = element_blank(),
        text = element_text(color = "black" , family = "Arial")) +
  guides(fill = guide_colourbar(barwidth = 1.5,
                                barheight = 25 , title = "HHalign Probability %",
                                title.position = "right", 
                                title.theme = element_text(size = 25 , angle = 90 , hjust = 0.5),
                                label.theme = element_text(size = 25))) +
  coord_fixed()

ggsave("fig2b_Final.tiff" , width = 14 , height = 14)



