library(tidyverse)
library(RColorBrewer)
library(ggtext)
library(shadowtext)
jg <- read_csv("TMALIGN_Matrix.csv")
str(order1)
read_csv("New_order.csv" , row.names(FALSE)) -> order
order %>% pull() -> order1
mutate(jg, order, .before = E.coli_IF3.C) -> jg1

# pivot_longer(jg1, cols = -c(X1), names_to = "name" , values_to = "value") -> jg.long

read_csv("/home/jai/Desktop/Figures and Tables/New_order_withcolour.csv", row.names(F)) -> color
color %>% filter(!row_number() %in% c(25)) -> color
color %>% pull() -> color1
as.character(color) -> color1
is.vector(as.character(color1[]))
cc <- colorRampPalette(brewer.pal(9, "Blues"))(25)

#col_fun <- circlize::colorRamp2(c(0,0.5,1), c("blue", "white", "red"))


#ggplot(data = jg.long, mapping = aes(x = name, y = X1, fill = value)) + geom_tile()

###
#plotting using base R heatmap function
###

as.matrix(jg) -> jg3
rownames(jg3) <- paste0(order)
heatmap(jg3, Colv = NA , Rowv = NA,
          revC = T,
          col= colorRampPalette(brewer.pal(9, "Blues"))(25),
          labRow = order1,
          RowSideColors = ccoo,
        cexRow = 2,
        cexCol = 2)

legend(x="bottomright", legend=c(0:1), 
       fill=colorRampPalette(brewer.pal(9, "Blues"))(25), )  

seq(0,1, length.out = 25)


#####

jg1 %>% 
  pivot_longer(-1) %>% 
  mutate(name = name %>% str_replace("E.coli_IF3.C", "E.coli_IF3-C")) %>% 
  mutate(X1 = X1 %>% factor(levels = order %>% pull()) %>% fct_rev(),
         name = name %>% factor(levels = order %>% pull())) %>% 
  ggplot(aes(x = name, y = X1, fill = value)) +
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
  
#plotly::ggplotly(plot)
df <-data.frame(x = factor(c(4,8,10)), colour = factor(c(1,2,1)))
plot2 <- ggplot(df, aes(x=x, y=1, fill = colour)) +
  geom_tile() +
  theme_void() +
  scale_fill_manual(values=c('orange', 'green', 'orange')) +
  theme(legend.position = 'none')

data <- tibble(
  bactname = c("Staphylococcaceae", "Moraxella", "Streptococcus", "Acinetobacter"),
  OTUname = c("OTU 1", "OTU 2", "OTU 3", "OTU 4"),
  value = c(-0.5, 0.5, 2, 3)
)

library(glue)
data %>% mutate(
  color = c("#009E73", "#D55E00", "#0072B2", "#000000"),
  name = glue("<i style='color:{color}'>{bactname}</i> ({OTUname})"),
  name = fct_reorder(name, value)
) 
######
#plot with italicised and colored axis legends without colors
######
read_csv("New_order_withcolour.csv" , row.names(F)) -> co
co %>% pull() -> ccoo
order %>%
  separate(X1, into = c("x", "y"), sep = "_") %>% 
  mutate(y = paste0("_", y)) %>% 
  mutate(orderi = row_number(),
         color = ccoo) %>% 
  mutate(name_new = glue("<i style='color:{color}'>{x}</i> {y}"),
         name_new = name_new %>% fct_reorder(orderi)) %>% 
  mutate(X1 = order %>% pull(), .before = x) -> ddff
  
ddff %>% 
  select(X1, name_new) -> first_df

library(ggtext)
jg1 %>% 
  pivot_longer(-1) %>% 
  mutate(name = name %>% str_replace("E.coli_IF3.C", "E.coli_IF3-C")) %>% 
  left_join(first_df %>% mutate(X1 = X1 %>% fct_rev())) %>% 
  left_join(first_df %>% rename(name = X1, name_two = name_new)) %>% 
  select(name_new, name_two, value) %>% 
  rename(X1 = name_new,
         name = name_two) %>% 
  mutate(X1 = X1 %>% fct_rev()) %>% 
  ggplot(aes(x = name, y = X1, fill = value)) +
  geom_tile() +
  scale_fill_gradientn(limits = c(0,1) , colours = cc) +
  theme_classic() +
  theme(axis.text.x = element_markdown(angle = 90, hjust = 0.9, size = 14),
        axis.text.y = element_markdown(size = 14),
        axis.title = element_blank(),
        legend.title = element_text(angle = 90 , hjust = 0.5, size = 14),
        axis.line = element_blank(),
        text = element_text(family = "Arial")) +
  guides(fill = guide_colourbar(barwidth = 1.5,
                                barheight = 25 , title = "TM-score", 
                                title.theme = element_text(size = 14 , angle = 90 , hjust = 0.5),
                                label.theme = element_text(size = 14),
                                title.position = "right")) +
  coord_fixed()


######
#plot with italicised axis legends without colors
######

order %>%
  separate(X1, into = c("x", "y"), sep = "_") %>% 
  #mutate(y = paste0("_", y)) %>% 
  mutate(orderi = row_number()) %>% 
  mutate(name_new = glue("*{x}* {y}"),
         name_new = name_new %>% fct_reorder(orderi)) %>% 
  mutate(X1 = order %>% pull(), .before = x) -> ddff

ddff %>% 
  select(X1, name_new) -> first_df

cc <- colorRampPalette(brewer.pal(n = 9, 'RdYlGn'))(30)

library(ggtext)
jg1 %>% 
  pivot_longer(-1) %>% 
  mutate(name = name %>% str_replace("E.coli_IF3.C", "E.coli_IF3-C")) %>% 
  left_join(first_df %>% mutate(X1 = X1 %>% fct_rev())) %>% 
  left_join(first_df %>% rename(name = X1, name_two = name_new)) %>% 
  select(name_new, name_two, value) %>% 
  rename(X1 = name_new,
         name = name_two) %>% 
  mutate(X1 = X1 %>% fct_rev()) %>%
  ggplot(aes(x = name, y = X1, fill = value)) +
  geom_tile() +
  #scale_fill_continuous_diverging(limits = c(0,1) , palette = 'Blue-Yellow 3' , mid = 0.5) +
  scale_fill_gradient2(limits = c(0,1) , high ='#d72b22'  , mid = '#ffffc0' , low ='#4376b6' ,midpoint = 0.3) +
  #scale_fill_gradientn(limits = c(0,1) , colours = cc) +
  theme_classic() +
  theme(axis.text.x = element_markdown(angle = 90,vjust = 0.5, hjust = 1, size = 20, colour = "black"),
        axis.text.y = element_markdown(size = 20 , colour = "black"),
        axis.title = element_blank(), legend.position = "bottom", legend.direction = "horizontal",
        legend.title = element_text(angle = 90 , hjust = 0.5, size = 15 ),
        axis.line = element_blank(),
        text = element_text(color = "black" , family = "Arial")) +
  guides(fill = guide_colourbar(title = "TM-score",
                                title.position = "bottom", barwidth = 25 , barheight = 1.5,
                                title.theme = element_text(size = 25 , hjust = 0.5),
                                label.theme = element_text(size = 25),)) +
  coord_fixed()

ggsave("Fig3B_V2.svg" , width = 14 , height = 14)
 
