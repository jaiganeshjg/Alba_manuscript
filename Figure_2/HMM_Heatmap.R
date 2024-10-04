library(tidyverse)
library(ggtext)
library(RColorBrewer)
library(glue)
library(plotly)

read_csv("heatmapmatrix.csv") -> df
read_csv("New_order.csv",  row.names(F)) -> order
read_csv("order.csv" , row.names(F)) -> name 

order %>% pull() -> order1
name %>% pull() -> name1

df %>% select(-1) %>% data.matrix() -> mat2
row.names(mat2) <- (df %>% names())[-1]

mat2[name1,name1] -> mat3
colnames(mat3) <- c(order1)
rownames(mat3) <- c(order1)
mat3 %>% data.frame() -> df2
write_csv(df2, "finale_matrix.csv")

###

read_csv("finale_matrix.csv") -> df
cc <- colorRampPalette(brewer.pal(9, "Blues"))(25)

order %>%
  separate(X1, into = c("x", "y"), sep = "_") %>% 
  #mutate(y = paste0("_", y)) %>% 
  mutate(orderi = row_number()) %>% 
  mutate(name_new = glue("*{x}* {y}"),
         name_new = name_new %>% fct_reorder(orderi)) %>% 
  mutate(X1 = order %>% pull(), .before = x) -> ddff

ddff %>% 
  select(X1, name_new) -> first_df

df2 %>% 
  rownames_to_column("loki") %>% 
  pivot_longer(-1) %>% 
  mutate(name = name %>% str_replace("E.coli_IF3.C", "E.coli_IF3-C")) %>% 
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
        legend.title = element_text(angle = 90 , hjust = 0.5, size = 20),
        axis.line = element_blank(),
        text = element_text(color = "black" , family = "Arial")) +
  guides(fill = guide_colourbar(barwidth = 1.5,
                                barheight = 25 , title = "HHpred Probability %",
                                title.position = "right", 
                                title.theme = element_text(size = 25 , angle = 90 , hjust = 0.5),
                                label.theme = element_text(size = 25))) +
  coord_fixed()

plotly::ggplotly(plot)


df2 %>% 
  pivot_longer(cols = everything()) %>% 
  mutate(name = name %>% factor(levels = order %>% pull()) %>% fct_rev(),
         name = name %>% factor(levels = order %>% pull())) %>% 
  ggplot(aes(x = name, y = name, fill = value)) +
  geom_tile() +
  scale_fill_gradientn(limits = c(0,1) , colours = cc) +
  theme_classic() +
  theme(axis.text.x = element_text(angle = 90, hjust = 0.9, face = "italic" , size = 12 , colour = "black"),
        axis.text.y = element_text(face = "italic" , size = 12 , colour = "black"),
        axis.title = element_blank(),
        legend.title = element_text(angle = 90 , hjust = 0.5, size = 12 ),
        axis.line = element_blank(),
        text = element_text(family = "Arial")) +
  guides(fill = guide_colourbar(barwidth = 1.5,
                                barheight = 25 , title = "TM-score",
                                title.position = "right")) +
  coord_fixed()

read_csv("New_order_withcolour.csv" , row.names(F)) -> co
co %>% pull() -> ccoo

heatmap(mat3, Colv = NA , Rowv = NA,
        revC = T,
        col = colorRampPalette(brewer.pal(9, "Blues"))(34),
        labRow = order1,
        RowSideColors = ccoo,
        cexRow = 2,
        cexCol = 2,
        coord_fixed()) -> cs

ggsave("colorstrip.svg" ,plot = cs , width = 14 , height = 14)

