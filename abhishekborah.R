# # download data provided by abhishek
# get that data runing in r 
# 
# run for loop that reads the data of one column going row wise
# 
# api call
# 
# save the downloaded data in a csv file paste
library(gtrendsR)
ch <- gconnect("arskyay@gmail.com", "abhishekborah")

req_data <- read.csv('a.csv')

for(i in 1:250) {
    tryCatch({
      trend <- gtrends(query = toString(req_data[i,2]), start_date = as.Date("2004-01-1"), end_date = as.Date("2017-10-15"))
      name <- paste(toString(req_data[i,2]),".csv",sep="")
      write.csv(trend[[2]], file = name)
    }, error=function(e){
      print(req_data[[2]][[i]])
      print("not found")
      print(i)
      write(toString(req_data[i,2]), file = "notFound", append = TRUE)
      write("\n", file = "notFound", append = TRUE)
    }
    )
    Sys.sleep(4)
}
