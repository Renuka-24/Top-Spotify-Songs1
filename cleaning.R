#Top Songs Analysis

#importing dataset top10s and copying it to test data
data = top10s
View(data)

#Data Cleaning

#checking the ranges for all columns
sapply(data, range)

#Adding column Rank which will denote rank of a song based on it popularity. 
# popularity from 90 - 100 is Rank 10 and so on
for(x in 1:length(data$pop)){
  if(data[x,15] < 100 && data[x,15] > 80){
    data[x,16] = 5
    }else if(data[x,15] < 80 && data[x,15] > 60){
      data[x,16] = 4
      }else if(data[x,15] < 60 && data[x,15] > 40){
        data[x,16] = 3
        }else if(data[x,15] < 40 && data[x,15] > 20){
          data[x,16] = 2
          }else if(data[x,15] < 20 && data[x,15] > 0){
            data[x,16] = 1
          }
}
data$pop <- NULL

#removing values with 0 BPM and duration as 0 seconds
which(data$bpm == 0)
which(data$dur == 0)
data_clean <- data[-c(433),]

#checking the ranges for all columns
sapply(data_clean, range)
View(data_clean)