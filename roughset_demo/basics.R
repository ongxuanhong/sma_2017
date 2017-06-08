library(RoughSets)

patients <- read.csv("patients.csv")
decision.table <- SF.asDecisionTable(dataset = patients, decision.attr = 4, indx.nominal = c(1:4))

P <- c(2,3)

####### Perform indiscernibility relation #######
IND <- BC.IND.relation.RST(decision.table, feature.set = P)

####### Perform lower and upper approximatino #####
roughset <- BC.LU.approximation.RST(decision.table, IND)

####### Determine the positive region ######
region <- BC.positive.reg.RST(decision.table, roughset) 

print("Indiscernibility Relation:")
print(IND)

print("Lower and Upper Approximations:")
print(roughset)

print("Regions:")
print(region)
