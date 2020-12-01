#Dealing with null values 
anyNA(MENTAL_HEALTH_DATASET)
colSums(is.na(MENTAL_HEALTH_DATASET))
anyNA(MENTAL_HEALTH_DATASET$comments)
MENTAL_HEALTH_DATASET$comments[MENTAL_HEALTH_DATASET$comments==NA]="NA"#replaceing NA values
colnames(MENTAL_HEALTH_DATASET)
summary(MENTAL_HEALTH_DATASET)

#Cleaning Gender Variable 
#We are trying to classify into three broad gender categories- "Male","Female" and "Other"
table(MENTAL_HEALTH_DATASET$Gender)
male= c("Cis Male","Cis male","cis male","Cis Man","M","m"," Mail","Mal","male","Male","Male-ish","Male (CIS)","Malr","msle","Man")
female= c("cis-female/femme","Cis Female","f","F","femail","Femake","female","Female"," Female (cis)","woman","Woman")
nrow(MENTAL_HEALTH_DATASET)
index=MENTAL_HEALTH_DATASET$Gender
Gender_New=c()
for (i in 1:1259){if(index[i]%in%male){Gender_New[i]="Male"}
  else if (index[i]%in%female){Gender_New[i]="Female"}
  else {Gender_New[i]="Other"}}
table(Gender_New)
#Adding Gender_new variable into the dataset
MENTAL_HEALTH_DATASET=data.frame(MENTAL_HEALTH_DATASET,Gender_New)

#Cheching for Other variables
table(MENTAL_HEALTH_DATASET$Country)
table(MENTAL_HEALTH_DATASET$state)
table(MENTAL_HEALTH_DATASET$self_employed)#NA entries are there which says not applicable
table(MENTAL_HEALTH_DATASET$family_history)
table(MENTAL_HEALTH_DATASET$family_history)
table(MENTAL_HEALTH_DATASET$treatment)
table(MENTAL_HEALTH_DATASET$work_interfere)

table(MENTAL_HEALTH_DATASET$no_employees)#there is some discrepancies in the data formatting
#by keen observation we can see that   44007 is actually the 6-25 bracket and 43835 is 1-5 bracket 
#Replacing values with the suitable one
MENTAL_HEALTH_DATASET$no_employees[MENTAL_HEALTH_DATASET$no_employees== "44007"]="6-25"
MENTAL_HEALTH_DATASET$no_employees[MENTAL_HEALTH_DATASET$no_employees== "43835"]="1-5"
table(MENTAL_HEALTH_DATASET$no_employees)

table(MENTAL_HEALTH_DATASET$remote_work)
table(MENTAL_HEALTH_DATASET$tech_company)
table(MENTAL_HEALTH_DATASET$benefits)
table(MENTAL_HEALTH_DATASET$care_options)
table(MENTAL_HEALTH_DATASET$wellness_program)
table(MENTAL_HEALTH_DATASET$seek_help)
table(MENTAL_HEALTH_DATASET$anonymity)
table(MENTAL_HEALTH_DATASET$leave)
table(MENTAL_HEALTH_DATASET$mental_health_consequence)
table(MENTAL_HEALTH_DATASET$phys_health_consequence)
table(MENTAL_HEALTH_DATASET$coworkers)
table(MENTAL_HEALTH_DATASET$supervisor)
table(MENTAL_HEALTH_DATASET$mental_health_interview)
table(MENTAL_HEALTH_DATASET$phys_health_interview)
table(MENTAL_HEALTH_DATASET$obs_consequence)
#There are no more doscripancies in the dataset
#Need to export that cleaned dataset
write.table(MENTAL_HEALTH_DATASET,file="Mental_Health_Cleaned.csv",row.names= F, sep = ",")
