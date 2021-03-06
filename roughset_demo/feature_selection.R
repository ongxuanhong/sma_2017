library(RoughSets)

# get data file name argument
args <- commandArgs(TRUE)
data_name <- as.character(args[1])

# loading data to data frame
loaded_data <- read.csv(data_name)

# convert to decision table
decision.table <- SF.asDecisionTable(dataset = loaded_data, decision.attr = 5)

## build the decision-relation discernibility matrix
res.2 <- BC.discernibility.mat.RST(decision.table, range.object = NULL)

## generate all reducts
reduct <- FS.all.reducts.computation(res.2)
reduct

## generate new decision table
new.decTable <- SF.applyDecTable(decision.table, reduct)
new.decTable
