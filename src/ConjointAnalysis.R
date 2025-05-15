# Pizza delivery preferences(the combinations being picked most) using conjoint analysis
#Importance of a feature/combinations that users prefer
#calll the package - can also use require(conjoint)
library(conjoint)
#create all possible combinations
#expand grid creates a dataframe with all possible combinations
#c is a function to cretae a vector
Experiment <- expand.grid(Size = c("Small","Medium","Large"),
                          Crust = c("Thin","Medium","Large"),
                          Topping = c("Margherita","Salami","Vegtarian"),
                          Price = c("$7","$10","$13"),
                          DeliveryTime= c("20 minutes","40 minutes","60 minutes"))

Experiment

#experimental design
3*3*3*3*3
#ca encode changes ur factors like margerita into numbers 
cor(caEncodedDesign(Experiment))

#create orthogonal design becoz we cannot take a survey for 243 combos, the system gives us 13 combos that has all different attributes
par_design=caFactorialDesign(Experiment,type ="orthogonal",seed=123)
par_design

#encodes the orthogonal design
par_profile= caEncodedDesign(par_design)
par_profile

cor(par_profile)

write.csv(par_design,file = "C:/Users/A Ebrahim/Desktop/COLLEGE MATERIAL/SEM -2/Marketing analytics'/ConjointAnalysis/conjdesign.csv")
write.csv(par_profile,file = "C:/Users/A Ebrahim/Desktop/COLLEGE MATERIAL/SEM -2/Marketing analytics'/ConjointAnalysis/conjprof.csv")

install.packages("openxlsx")
install.packages("writexl")

library(openxlsx)
library(writexl)

levels=c("Small","Medium","Large","Thin","Regular","Pan","Margherita","Salami","Vegtarian","$7","$10","$13","20 minutes","40 minutes","60 minutes")
lev.df=data.frame(levels)
lev.df

#read data file
Conjoint_Data=data <- read.xlsx("C:/Users/A Ebrahim/Desktop/COLLEGE MATERIAL/SEM -2/Marketing analytics'/ConjointAnalysis/ConjointData.xlsx")

Conjoint(y=Conjoint_Data[,2:14],x=par_profile[,1:5],z=lev.df)

#run same analysis on same person
caModel(Conjoint_Data[1,2:14],par_profile[,1:5])


#part utility is utility of one single attribute
#utilities measures how much each level of a factor (attribute) is liked or preferred by the person.
caUtilities(y=Conjoint_Data[1,2:14],x=par_profile[,1:5],z=lev.df)

caImportance(Conjoint_Data[2:14],par_profile[,1:5])

caPartUtilities(y=Conjoint_Data[,2:14],x=par_profile,z=lev.df)

#total utility is combination of any attributes
importance <- caImportance(Conjoint_Data[,2:14], par_profile[,1:5])
barplot(importance, main="Feature Importance", col="lightblue", las=2)

utilities <- caPartUtilities(y=Conjoint_Data[,2:14], x=par_profile[,1:5], z=lev.df)
boxplot(utilities, main="Part-Worth Utilities", las=2)
