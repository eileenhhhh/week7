# Final Project - Ailin He (100914789)
# A page with tickers from Yahoo Finance: https://finance.yahoo.com/trending-tickers?.tsrc=fin-srch

# import relevant libraries
library(rvest)
library(dplyr)

# read the html into R
tickers = "https://finance.yahoo.com/trending-tickers?.tsrc=fin-srch"
fpage <- read_html(tickers)
fpage

# extract relevant information from the whole html
body_nodes <- fpage %>%
  html_node("body") %>% 
  html_children()


# read the first column: 'Symbol'
df1 <- fpage %>% 
  rvest::html_nodes('body') %>% 
  xml2::xml_find_all('//*[@id="list-res-table"]/div[1]/table/tbody/tr[*]/td[1]/a') %>%  
  rvest::html_text()

# read the second column: 'Name'
df2 <- fpage %>% 
  rvest::html_nodes('body') %>% 
  xml2::xml_find_all('//*[@id="list-res-table"]/div[1]/table/tbody/tr[*]/td[2]') %>%  
  rvest::html_text()

# read the third column: 'Last Price'
df3 <- fpage %>% 
  rvest::html_nodes('body') %>% 
  xml2::xml_find_all('//*[@id="list-res-table"]/div[1]/table/tbody/tr[*]/td[3]/fin-streamer') %>%  
  rvest::html_text()

# read the forth column: 'Market Time'
df4 <- fpage %>% 
  rvest::html_nodes('body') %>% 
  xml2::xml_find_all('//*[@id="list-res-table"]/div[1]/table/tbody/tr[*]/td[4]/span') %>%  
  rvest::html_text()

# read the fifth column: 'Change'
df5 <- fpage %>% 
  rvest::html_nodes('body') %>% 
  xml2::xml_find_all('//*[@id="list-res-table"]/div[1]/table/tbody/tr[*]/td[5]/fin-streamer') %>%  
  rvest::html_text()

# read the sixth column: 'Volume'
df6 <- fpage %>% 
  rvest::html_nodes('body') %>% 
  xml2::xml_find_all('//*[@id="list-res-table"]/div[1]/table/tbody/tr[*]/td[7]/fin-streamer') %>%  
  rvest::html_text()

# concat all the columns together into a dataframe
df <- data.frame(df1, df2, df3, df4, df5, df6)

# create column names for each column
names(df)[1] <- "Symbol"
names(df)[2] <- "Name"
names(df)[3] <- "Last Price"
names(df)[4] <- "Market Time"
names(df)[5] <- "Change"
names(df)[6] <- "Volumn"

# view the finished scraped-table!
View(df)




			


