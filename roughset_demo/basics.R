library(RoughSets)

# get data file name argument
args <- commandArgs(TRUE)
data_name <- as.character(args[1])

# loading data to data frame
loaded_data <- read.csv(data_name)

# convert to decision table
decision.table <- SF.asDecisionTable(dataset = loaded_data, decision.attr = 5)

# choose index of features
P <- c(1,2,3,4)

## discretization:
cut.values <- D.discretize.equal.intervals.RST(decision.table, nOfIntervals = 4)
decision.table <- SF.applyDecTable(decision.table, cut.values)

####### Perform indiscernibility relation #######
IND <- BC.IND.relation.RST(decision.table, feature.set = P)

####### Perform lower and upper approximatino #####
roughset <- BC.LU.approximation.RST(decision.table, IND)

####### Determine the positive region ######
region <- BC.positive.reg.RST(decision.table, roughset) 

cat("###  Indiscernibility Relation ###\n")
print(IND)

cat("\n\n\n### Lower and Upper Approximations ###\n")
print(roughset)

cat("\n\n\n### Regions ###\n")
print(region)
