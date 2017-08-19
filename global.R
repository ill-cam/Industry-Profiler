library(censusapi)
library(data.table)
library(DT)
Sys.setenv(CENSUS_KEY="3f69f0703af4a0e6f71e6f885b97d1b13b083cea")
#Create a data frame that matches Census FIPS codes to state names    
states <- data.frame(State=c("02","01","05","60","04","06","08","09","11","10","12","13","66","15","19","16","17","18","20","21","22","25","24","23","26","27","29","28","30","37","38","31","33","34","35","32","36","39","40","41","42","72","44","45","46","47","48","49","51","78","50","53","55","54","56"),State_Abbrev=c("AK","AL","AR","AS","AZ","CA","CO","CT","DC","DE","FL","GA","GU","HI","IA","ID","IL","IN","KS","KY","LA","MA","MD","ME","MI","MN","MO","MS","MT","NC","ND","NE","NH","NJ","NM","NV","NY","OH","OK","OR","PA","PR","RI","SC","SD","TN","TX","UT","VA","VI","VT","WA","WI","WV","WY"))
#Download data from the Census Bureau    
cbp <- getCensus("2015/cbp",vars=c("ST","NAICS2012","ESTAB","EMP"),region="state:*")
#Combine the Census data with the data frame that has states' names    
cbpt<-merge(cbp,states,by.x = "state",by.y="State",all.x=TRUE)
#Remove redundant variables with the state FIPS codes
cbpt <- subset(cbpt, select=-c(ST,state))
#Rename columns in the data frame
setnames(cbpt,"ESTAB","No._of_Establishments")
setnames(cbpt,"EMP","Total_Employees")
setnames(cbpt,"State_Abbrev","State")
#Convert NAICS code variable to factor class    
cbpt$NAICS2012 <- as.factor(cbpt$NAICS2012)
#Convert variables to integer class to all sorting within data table    
cbpt$No._of_Establishments <- as.integer(cbpt$No._of_Establishments)
cbpt$Total_Employees <- as.integer(cbpt$Total_Employees)
#Rearrange the order of columns in the data frame
cbpt<-cbpt[,c(3,4,1,2)]
#Create factor vector comprised of NAICS codes to populate the checkbox input object
mylist <- as.factor(levels(cbpt$NAICS2012))