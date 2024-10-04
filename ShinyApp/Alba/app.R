library(tidyverse)
library(shiny)
library(DT)

read_csv("Alba_Domain_containing proteins_with_clusterinformation.csv") -> final1

final1 %>% 
  mutate(`Accession ID` = paste0('<a href=https://www.ncbi.nlm.nih.gov/protein/',`Accession ID` , ' target="_blank"' , '>',
                                 `Accession ID`, "</a>") , .before=Cluster) %>% 
  mutate(`Taxonomy ID` = paste0('<a href=https://www.ncbi.nlm.nih.gov/Taxonomy/Browser/wwwtax.cgi?id=',`Taxonomy ID`, ' target="_blank"', '>',
                                `Taxonomy ID`, "</a>") , .before=`Scientific Name`) -> final2 

datatable(final2, options = list(initComplete = JS(
  "function(settings, json) {",
  "$('body').css({'font-family': 'Arial'});","}") , pageLength = 10) , escape = FALSE) %>%
  formatStyle('Cluster' , backgroundColor = styleEqual('Archaeal Alba' , '#FFA000')) %>% 
  formatStyle('Cluster' , backgroundColor = styleEqual('Rpp25', '#F9003F')) %>%
  formatStyle('Cluster' , backgroundColor = styleEqual('Rpp20','#009806')) %>%
  formatStyle('Cluster' , backgroundColor = styleEqual('Pop7','#43C1F7')) %>%
  formatStyle('Cluster' , backgroundColor = styleEqual('Pop6','#FF00F1')) %>%
  formatStyle('Cluster' , color = styleEqual('PfAlba3 and PfAlba4' , 'white'), backgroundColor = styleEqual('PfAlba3 and PfAlba4','#666666')) %>%
  formatStyle('Cluster' , color = styleEqual('PfAlba5' , 'white'), backgroundColor = styleEqual('PfAlba5','#425CB7')) %>%
  formatStyle('Cluster' , backgroundColor = styleEqual('PfAlba6','#E1B5E6')) %>%
  formatStyle('Cluster' , backgroundColor = styleEqual('Plant Alba – At2g34160 like','#FFE900')) %>%
  formatStyle('Cluster' , color = styleEqual('ThAlba' , 'white'), backgroundColor = styleEqual('ThAlba','#1B1B6B')) %>%
  formatStyle('Cluster' , backgroundColor = styleEqual('Fungi Alba1','#74F100')) %>%
  formatStyle('Cluster' , backgroundColor = styleEqual('Fungi Alba2','#FF96AC')) %>%
  formatStyle('Cluster' ,color = styleEqual('Fungi Alba3' , 'white'), backgroundColor = styleEqual('Fungi Alba3','#94006E')) -> dt


app <- shinyApp(
  ui = fluidPage(DTOutput('tbl')),
  server = function(input,output) {
    output$tbl = renderDT(
      dt, options = list(lengthChange = FALSE)
    )
  }
)

