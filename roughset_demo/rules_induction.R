library(RoughSets)

# get data file name argument
args <- commandArgs(TRUE)
data_name <- as.character(args[1])

# loading data to data frame
loaded_data <- read.csv(data_name)
loaded_data <- loaded_data[,-c(1)]
loaded_data <-SF.asDecisionTable(loaded_data, decision.attr = 5, indx.nominal = c(1:5))

rules <- RI.LEM2Rules.RST(loaded_data)
rules
