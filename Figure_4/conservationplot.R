library(tidyverse)

read_delim("Arch_cons.txt" ,delim = " " ,col_names = F ) %>% 
  janitor::remove_empty()  -> df

df %>% 
  mutate(X3 = (X1-mean(X1))/sd(X1)) %>% 
    mutate(X4 = rownames(.)) %>% 
  left_join(., hy , by=c('X2'='X12')) -> df1

order <- c(df1$X2)

ggplot(df1, aes(y = X1, x = fct_inorder(paste0(X2,X4)), fill= X3>1)) +
  geom_bar(stat = 'identity' , color="black" , size = 0.2) +
  scale_y_continuous(limits = c(0,1) , expand = c(0,0)) +
  ylab("Conservation") +
  xlab("") +
  scale_fill_manual(values = c("white" , "#ffa000") ) +
  theme_classic(base_size = 5) +
  theme(axis.text.x = element_text(colour = df1$X2.y , size = 5))+
  theme(axis.text.y = element_text(colour = "black" , size = 5)) +
  theme(axis.title.y = element_text(size = 6)) +
  scale_x_discrete(labels = order) +
  theme(legend.position = 'NONE')
  

ggsave('arch.png' , width = 5.2 , height = 1.8 ,units = "in" , dpi=600)
  

####

read_tsv("aminoacid_polarity.tsv" ,col_names = F) %>% rename(X12=X1) -> hy

# geom_line(aes(group=1) , stat='smooth', method = 'loess', 
#           span=0.2 , se=F , color='black' , alpha=0.6 , size=0.2)

#####
#master

read_delim("maroon_2_cons.txt" ,delim = "\t" ,col_names = F ) %>% 
  janitor::remove_empty()  -> df

df %>% 
  #mutate(X3 = (X1-mean(X1))/sd(X1)) %>% 
  #mutate(X4 = rownames(.)) %>% 
  left_join(., hy , by=c('X2' = 'X12')) -> df1

order <- c(df1$X2)

ggplot(df1, aes(y = X1, x = fct_inorder(paste0(X2,X3)), fill= X4>1)) +
  geom_bar(stat = 'identity' , color="black" , size = 0.2) +
  scale_y_continuous(limits = c(0,1) , expand = c(0,0)) +
  ylab("Conservation") +
  xlab("") +
  scale_fill_manual(values = c("white" , "#ff96ac") ) +
  theme_classic(base_size = 5) +
  theme(axis.text.x = element_text(colour = df1$X2.y , size = 3.4))+
  theme(axis.text.y = element_text(colour = "black" , size = 5)) +
  theme(axis.title.y = element_text(size = 6)) +
  scale_x_discrete(labels = order) +
  theme(legend.position = 'NONE')


ggsave('fungialba2_2.png' , width = 5.2 , height = 1.8 ,units = "in" , dpi=600)

####pf3n4

read_delim("pfalba6_cons.txt" ,delim = " " ,col_names = F ) %>% 
  janitor::remove_empty()  -> df

df %>% 
  mutate(X3 = (X1-mean(X1))/sd(X1)) %>% 
  mutate(X4 = rownames(.)) %>% 
  left_join(., hy , by='X12') -> df1

order <- c(df1$X12)

ggplot(df1, aes(y = X1, x = fct_inorder(paste0(X12,X4)), fill= X3>1)) +
  geom_bar(stat = 'identity' , color="black" , size = 0.2) +
  scale_y_continuous(limits = c(0,1) , expand = c(0,0)) +
  ylab("Conservation") +
  xlab("") +
  scale_fill_manual(values = c("white" , "#e1b5e6") ) +
  theme_classic(base_size = 5) +
  theme(axis.text.x = element_text(colour = df1$X2 , size = 6.2))+
  theme(axis.text.y = element_text(colour = "black" , size = 5)) +
  theme(axis.title.y = element_text(size = 6)) +
  scale_x_discrete(labels = order) +
  theme(legend.position = 'NONE')


ggsave('pfalba6.png' , width = 5.2 , height = 1.8 ,units = "in" , dpi=600)







