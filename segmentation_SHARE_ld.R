# File:    segmentation_SHARE_ld.R
# Project:  SNF NRP 74
# Author:  Lize Duminy, lize.duminy@bfh.ch
# Date:    2020-02-10


if (!require("haven")) install.packages("haven") # Installs haven if needed
#if (!require("foreign")) install.packages("foreign") # Installs foreign if needed
if (!require("tidyverse")) install.packages("tidyverse") # Installs tidyverse if needed
#if (!require("dplyr")) install.packages("dplyr") # Installs dplyr if needed
#if (!require("corrr")) install.packages("corrr") # Installs corrr if needed
#if (!require("ggplot2")) install.packages("ggplot2") # Installs ggplot2 if needed
if (!require("data.table")) install.packages("data.table") # Installs data.table if needed


#library(magrittr)


library(haven)
library(foreign)
#library(dplyr)
#library(corrr)
#library(ggplot2)
#library(data.table)
library(tidyverse)


datHC<-read_dta("//bfh.ch/data/LFE/G/Research-HE/data/SHARE/rel7-0-0/sharew7_rel7-0-0/sharew7_rel7-0-0_ALL_datasets_stata/sharew7_rel7-0-0_hc.dta")
datCF<-read_dta("//bfh.ch/data/LFE/G/Research-HE/data/SHARE/rel7-0-0/sharew7_rel7-0-0/sharew7_rel7-0-0_ALL_datasets_stata/sharew7_rel7-0-0_cf.dta")
datMH<-read_dta("//bfh.ch/data/LFE/G/Research-HE/data/SHARE/rel7-0-0/sharew7_rel7-0-0/sharew7_rel7-0-0_ALL_datasets_stata/sharew7_rel7-0-0_mh.dta")
datBR<-read_dta("//bfh.ch/data/LFE/G/Research-HE/data/SHARE/rel7-0-0/sharew7_rel7-0-0/sharew7_rel7-0-0_ALL_datasets_stata/sharew7_rel7-0-0_br.dta")
datGS<-read_dta("//bfh.ch/data/LFE/G/Research-HE/data/SHARE/rel7-0-0/sharew7_rel7-0-0/sharew7_rel7-0-0_ALL_datasets_stata/sharew7_rel7-0-0_gs.dta")
datPH<-read_dta("//bfh.ch/data/LFE/G/Research-HE/data/SHARE/rel7-0-0/sharew7_rel7-0-0/sharew7_rel7-0-0_ALL_datasets_stata/sharew7_rel7-0-0_ph.dta")
datCV<-read_dta("//bfh.ch/data/LFE/G/Research-HE/data/SHARE/rel7-0-0/sharew7_rel7-0-0/sharew7_rel7-0-0_ALL_datasets_stata/sharew7_rel7-0-0_cv_r.dta")


dat_hand_grip<-read_csv("//bfh.ch/data/LFE/Users/dil4/health_states/health_states/HandGrip_Swiss.csv")


#Filter Swiss observations
datHC<-datHC %>% filter(as_factor(datHC$country)=="Switzerland")
datCF<-datCF %>% filter(as_factor(datCF$country)=="Switzerland")
datMH<-datMH %>% filter(as_factor(datMH$country)=="Switzerland")
datBR<-datBR %>% filter(as_factor(datBR$country)=="Switzerland")
datGS<-datGS %>% filter(as_factor(datGS$country)=="Switzerland")
datPH<-datPH %>% filter(as_factor(datPH$country)=="Switzerland")
datCV<-datCV %>% filter(as_factor(datCV$country)=="Switzerland")

#Keep only correspondants of current wave as well as deceased correspondants
datCV<-rbind(datCV[datCV$deceased==1,],datCV[datCV$age_int!=-9,])


#Remove variables that are duplicated accross datasets
#datHC2<-cbind(datHC[,1],datHC[,8:71])
#datCF2<-cbind(datCF[,1],datCF[,7:37])
#datMH2<-cbind(datMH[,1],datMH[,7:27])
#datBR2<-cbind(datBR[,1],datBR[,7:25])
#datGS2<-cbind(datGS[,1],datGS[,7:23])
#datPH2<-cbind(datPH[,1],datPH[,7:196])
#datDN2<-cbind(datDN[,1],datDN[,7:95])



#Construct working database
dat_SHARE_ld<-merge(cbind(datCF[,1],datCF[,7:37]), cbind(datHC[,1],datHC[,8:71]), by="mergeid",all=TRUE)
dat_SHARE_ld<-merge(cbind(datMH[,1],datMH[,7:27]),dat_SHARE_ld,by="mergeid",all=TRUE)
dat_SHARE_ld<-merge(cbind(datBR[,1],datBR[,7:25]),dat_SHARE_ld,by="mergeid",all=TRUE)
dat_SHARE_ld<-merge(cbind(datGS[,1],datGS[,7:23]),dat_SHARE_ld,by="mergeid",all=TRUE)
dat_SHARE_ld<-merge(cbind(datPH[,1],datPH[,7:196]),dat_SHARE_ld,by="mergeid",all=TRUE)
dat_SHARE_ld<-merge(datCV,dat_SHARE_ld,by="mergeid",all=TRUE)





##############Survey questions used for segmentation#####################

#########################################################################
#a#############PH065_CheckLossWeight
#Haben Sie in den letzten 12 Monaten abgenommen?
#Have you lost weight in the last 12 months?
#list(dat_SHARE_ld$ph065_)
#VALUE      LABEL
#     -2    Refusal
#     -1    Don't know
#     1     Yes
#     5     No

#table(dat_SHARE_ld$ph065_)
#TABLE
#-2   -1    1     5 
#1    6     503   1886

dat_SHARE_ld$a<-ifelse(dat_SHARE_ld$ph065_==5, 1,0)
#table(dat_SHARE_ld$a)
#a=1  No weight loss
#a=0  Weight loss
#     & Don't know + Refusal

########################################################################
#b#############PH095_HowMuchLostWeight
#Wie viel Gewicht haben Sie abgenommen?
#How much weight have you lost?

list(dat_SHARE_ld$ph095_)
#VALUE      LABEL
#   -2      Refusal
#   -1      Don't know

#table(dat_SHARE_ld$ph095_)
#TABLE
#-1  1  2  3  4  5  6  7  8  9 10 12 13 14 15 16 18 20 21 23 24 26 30 35 50 
#2  32 92 91 63 74 31 19 27  7 29 12  1  2  3  2  2  5  1  1  1  1  3  1  1

dat_SHARE_ld$b<-ifelse(dat_SHARE_ld$ph095_<5,1,0)
#table(dat_SHARE_ld$b)
#b=1  Less than 5kg weight loss
#b=0  5 or more kg weight loss
#     & Don't know + Refusal 



########################################################################
#c#############PH066_ReasonLostWeight
#Warum haben Sie abgenommen?
#Why did you lose weight?

#list(dat_SHARE_ld$ph066_)
# value                                   label
#-2                                     Refusal
#-1                                   Don't know
#1                               Due to illness
#2                      Followed a special diet
#3    Due to illness and followed a special diet
#97               Other reasons for weight loss

#table(dat_SHARE_ld$ph066_)
#TABLE
#  1   2   3  97 
# 91 143  23 246

dat_SHARE_ld$c<-ifelse((dat_SHARE_ld$ph066_==2|dat_SHARE_ld$ph066_==3),1,0)
#table(dat_SHARE_ld$c)
#c=1  If weightloss can be explained by a change in diet
#c=0  Weightloss explained by illness or other
#     & Don't know + Refusal






########################################################################
#d#############PH089_Frailty_Symptoms
#Bitte schauen Sie sich Karte 33 an. 
#Haben Sie während den letzten sechs Monaten (oder länger) eines von den aufgelisteten gesundheitlichen
#Problemen gehabt? Bitte sagen Sie mir die entsprechende(n) Ziffer(n).

#Please take a look at map 33.
#Have you had any of the listed health problems in the last six months (or longer)?
#Any problems? Please tell me the appropriate number(s).

#list(dat_SHARE_ld$ph089d1)
#  value  label
#-2      Refusal
#-1   Don't know
# 0 Not selected
# 1     Selected

#table(dat_SHARE_ld$ph089d1)
#TABLE
#    -2   -1    0    1 
#     2    2 2243  143

dat_SHARE_ld$d<-ifelse(dat_SHARE_ld$ph089d1==1,1,0)
#table(dat_SHARE_ld$d)
#d=1  Fell in the last six months
#     & Don't know + Refusal
#d=0  Did not fall in the last six months




########################################################################
#e#############PH006_DocCond
#Bitte schauen Sie sich Karte 32 an.
#[@ Hat Ihnen ein Arzt jemals gesagt, dass Sie/@ Ist es so, dass Sie zurzeit] unter einer von den Krankheiten leiden,
#wo dort aufgeführt sind? [@ Damit ist gemeint, dass Ihnen ein Arzt die Diagnose gestellt hat und dass Sie zurzeit
#entsprechend behandelt werden oder von der Krankheit beeinträchtigt sind.] Bitte nennen Sie mir die
#entsprechende(n) Ziffer(n).

#Please take a look at map 32.
#[@ Has any doctor ever told you that you/@ Are you currently] suffering from any of the diseases
#where it is listed? @ This means that a doctor has diagnosed you and that you are currently
#are treated accordingly or are affected by the disease]. Please name the
#corresponding figure(s).

#list(dat_SHARE_ld$ph006d1:ph006d21)
#  value  label
#-2      Refusal
#-1   Don't know
# 0 Not selected
# 1     Selected


####Joël, please double-check the chronic illnesses specified. The numbers are not the same as your pdf. 
#If you change something, please be consistent and change it in both functions here.

dat_SHARE_ld$e<-ifelse( (dat_SHARE_ld$ph006d1==1
                         |dat_SHARE_ld$ph006d2==1
                         |dat_SHARE_ld$ph006d3==1
                         |dat_SHARE_ld$ph006d4==1
                         |dat_SHARE_ld$ph006d5==1
                         |dat_SHARE_ld$ph006d6==1
                         |dat_SHARE_ld$ph006d10==1
                         |dat_SHARE_ld$ph006d11==1
                         |dat_SHARE_ld$ph006d13==1
                         |dat_SHARE_ld$ph006d14==1
                         |dat_SHARE_ld$ph006d15==1
                         |dat_SHARE_ld$ph006d16==1
                         |dat_SHARE_ld$ph006d19==1
                         |dat_SHARE_ld$ph006d20==1)
                        ,1,0)



dat_SHARE_ld$e_num<-(replace(dat_SHARE_ld$ph006d1, dat_SHARE_ld$ph006d1 < 0, 0)
                     +replace(dat_SHARE_ld$ph006d2, dat_SHARE_ld$ph006d2 < 0, 0)
                     +replace(dat_SHARE_ld$ph006d3, dat_SHARE_ld$ph006d3 < 0, 0)
                     +replace(dat_SHARE_ld$ph006d4, dat_SHARE_ld$ph006d4 < 0, 0)
                     +replace(dat_SHARE_ld$ph006d5, dat_SHARE_ld$ph006d5 < 0, 0)
                     +replace(dat_SHARE_ld$ph006d6, dat_SHARE_ld$ph006d6 < 0, 0)
                     +replace(dat_SHARE_ld$ph006d10, dat_SHARE_ld$ph006d10 < 0, 0)
                     +replace(dat_SHARE_ld$ph006d11, dat_SHARE_ld$ph006d11 < 0, 0)
                     +replace(dat_SHARE_ld$ph006d13, dat_SHARE_ld$ph006d13 < 0, 0)
                     +replace(dat_SHARE_ld$ph006d14, dat_SHARE_ld$ph006d14 < 0, 0)
                     +replace(dat_SHARE_ld$ph006d15, dat_SHARE_ld$ph006d15 < 0, 0)
                     +replace(dat_SHARE_ld$ph006d16, dat_SHARE_ld$ph006d16 < 0, 0)
                     +replace(dat_SHARE_ld$ph006d19, dat_SHARE_ld$ph006d19 < 0, 0)
                     +replace(dat_SHARE_ld$ph006d20, dat_SHARE_ld$ph006d20 < 0, 0)                          
)


table(dat_SHARE_ld$e)                                  
#e=1  Diagnosed with one or more chronic disease
#e=0  No chronic disease diagnosis
#     & Don't know + Refusal

#table(dat_SHARE_ld$e_num) #frequency table of number of chronic diseses per person 

dat_SHARE_ld$f<-ifelse(is.na(dat_SHARE_ld$e),0,1)
#f=1  Response regarding chronic diseases recorded 
#f=0  No record of chronic disease response

dat_SHARE_ld$f2<-ifelse(is.na(dat_SHARE_ld$e)&dat_SHARE_ld$deceased==1,1,0)
#f2=1  No record of chronic disease response because person is dead 
#f2=0  Else

table(dat_SHARE_ld$f2)








########################################################################
#g#############PH005_LimAct
#In welchem Ausmass sind Sie während der letzten sechs Monate (oder länger) wegen einem gesundheitlichen
#Problem bei alltäglichen Aktivitäten eingeschränkt gewesen?

#To what extent have you been restricted in your daily activities during the last six months (or longer) 
#due to a health problem?

#list(dat_SHARE_ld$ph005_)
#  value  label
#-2                   Refusal
#-1                Don't know
# 1          Severely limited
# 2 Limited, but not severely
# 3               Not limited

#table(dat_SHARE_ld$ph005_)
#TABLE
#    -2   -1    0    1 
#     2    2 2243  143

dat_SHARE_ld$g<-ifelse(dat_SHARE_ld$ph005_==3,1,0)
#table(dat_SHARE_ld$g)
#g=1  No limitations in daily activities
#g=0  Severely or not severely limited daily activities
#     & Don't know + Refusal



########################################################################
#h#############HC602_STtoMDoctor
#Denken Sie jetzt bitte an die letzten 12 Monate. Seit {FLLastYearMonth}, wie oft haben Sie insgesamt mit einem Arzt
#oder einer qualifizierten Krankenschwester über Ihre Gesundheit gesprochen? Bitte zählen Sie Zahnarztbesuche und
#stationäre Spitalaufenthalte nicht mit, berücksichtigen Sie aber Behandlungen auf der Notfallstation oder ambulante
#Spitalbesuche.

#Now please think of the last 12 months. Since {FLLastYearMonth}, how many times in total have you spoken 
#to a doctor or qualified nurse about your health? Please do not count visits to the dentist or in-patient 
#hospitalization, but consider treatment in the emergency room or out-patient hospitalization.

#list(dat_SHARE_ld$hc602_)
#  value  label
#-2    Refusal
#-1 Don't know

#table(dat_SHARE_ld$hc602_)
#TABLE
#-2  -1   0   1   2   3   4   5   6   7   8   9  10  11  12  13  14  15  16  17  18  20  21  22  24  25  26  28  30  32  36  38  40 
#2  17 288 410 383 256 241 143 126  33  66  13 108   5 136   3   7  43   3   2   5  32   1   1  15   7   2   1  10   1   2   1   8 

#48  50  54  55  60  70  80 100 120 180 365 366 
#3   4   1   1   3   1   1   4   1   1   1   4

dat_SHARE_ld$h<-ifelse(dat_SHARE_ld$hc602_>=6,1,0)

table(dat_SHARE_ld$h)
#h=1  Spoken the doctor or nurse practitioner 6 or more than times per year
#h=0  Spoken to see the doctor or nurse practitioner less than 6 times in the past year
#     & Don't know + Refusal











########################################################################
#i#############HC014_TotNightsinPT
#Wie viele Nächte haben Sie in den letzten 12 Monaten insgesamt im Spital verbracht?

#How many nights in total have you spent in hospital in the last 12 months?

#list(dat_SHARE_ld$hc014_)
#  value  label
#-2    Refusal
#-1 Don't know

#table(dat_SHARE_ld$hc014_)
#TABLE
#-1   1   2   3   4   5   6   7   8   9  10  11  12  13  14  15  16  18  20  21  22  25  28  30  31  35  36  38  40  42  45  50  55 
# 1  59  57  41  34  27  20  44  12  11  31   5   8   2  14   4   3   4   6   6   1   1   1   8   2   3   1   2   2   2   1   1   1 

#56  63  70 100 175 
# 1   1   1   2   1 

dat_SHARE_ld$i<-ifelse(dat_SHARE_ld$hc014_>=6,1,0)


table(dat_SHARE_ld$i)
#i=1  Went to see the doctor 6 or more times per year
#i=0  Went to see the doctor less than 6 times in the past year
#     & Don't know + Refusal



#j#############HC013_TiminHos
#Wie oft sind Sie während den letzten 12 Monaten für mindestens eine Nacht im Spital gewesen?

#How often have you spent at least one night in hospital during the last 12 months?

#list(dat_SHARE_ld$hc013_)
#  value  label
#-2    Refusal
#-1 Don't know

#table(dat_SHARE_ld$hc013_)
#TABLE
#  0   1   2   3   4   5   7   8   9  10 
#  3 284  64  25   6   9   8   3   1  18 

dat_SHARE_ld$j<-ifelse(dat_SHARE_ld$hc013_>=6,1,0)


table(dat_SHARE_ld$j)
#j=1  Spent at least one night in the hospital 6 or less times per year
#j=0  Spent at least one night in the hospital less than 6 times in the past year
#     & Don't know + Refusal






#DN042_Gender
#Bitte Geschlecht der befragten Person angeben (falls unsicher, nachfragen)

#Please enter the sex of the person interviewed (if uncertain, ask)

#list(dat_SHARE_ld$dn042_)
#value      label
#   -2    Refusal
#   -1 Don't know
#     1       Male
#     2     Female

#table(dat_SHARE_ld$dn042_)
#1    2 
#1085 1317


########################################################################
#j#############Frailty Indicators

#Frailty was defined as a clinical syndrome in which three or more of the following criteria were present: 
#unintentional weight loss (10 lbs in past year), 
#self-reported exhaustion, 
#weakness (grip strength), 
#slow walking speed, 
#and low physical activity.

#Fried, L.P., Tangen, C.M., Walston, J., Newman, A.B., Hirsch, C., Gottdiener, J., Seeman, T., Tracy, R., 
#Kop, W.J., Burke, G. and McBurnie, M.A., 2001. 
#Frailty in older adults: evidence for a phenotype. 
#The Journals of Gerontology Series A: Biological Sciences and Medical Sciences, 56(3), pp.M146-M157.


###Cognitive function <- Differences in cognitive performance and cognitive decline across European regions: a population-based prospective cohort study

########################################################################
#j1############Hand Grip Strength

#Participant is deemed to have low hand grip strength if the average measurement for both the dominant hand 
#as well as the average measurement for the non-dominant hand is less or equal to one standard deviation 
#less than the average normative age-sex-dominance-specific values for the Swiss population as determined by:
#Werle, S., Goldhahn, J., Drerup, S., Simmen, B.R., Sprott, H. and Herren, D.B., 2009. Age-and gender-specific 
#normative data of grip and pinch strength in a healthy adult Swiss population. Journal of Hand Surgery 
#(European Volume), 34(1), pp.76-84.

####Left hand average
dat_SHARE_ld$r_ave<-(dat_SHARE_ld$gs008_+dat_SHARE_ld$gs009_)/2
####Right hand average
dat_SHARE_ld$l_ave<-(dat_SHARE_ld$gs006_+dat_SHARE_ld$gs007_)/2


####Dominant hand
dat_SHARE_ld$d_ave<-isTRUE(dat_SHARE_ld$gs004_==2)*dat_SHARE_ld$l_ave+(1-isTRUE(dat_SHARE_ld$gs004_==2))*dat_SHARE_ld$r_ave
#label(d_ave) <- "Average handgrip dominant hand"


###Assign people with only one hand measurement to "dominant-hand"
###Identify the hand-measurement of people who only have one hand-measurement
hands_tested<-2-1*(is.na(dat_SHARE_ld$r_ave)==TRUE)-1*(is.na(dat_SHARE_ld$l_ave)==TRUE)
one_hand<-which(hands_tested==1) ###rows with people who have only one hand-measurement
###people who's one hand measurement is the left hand
one_hand_l<-one_hand[!is.na(dat_SHARE_ld[one_hand,"l_ave"]>0)]
dat_SHARE_ld[one_hand_l,"d_ave"]<-dat_SHARE_ld[one_hand_l,"l_ave"]
###people who's one hand measurement is the right hand
one_hand_r<-one_hand[!is.na(dat_SHARE_ld[one_hand,"r_ave"]>0)]
dat_SHARE_ld[one_hand_r,"d_ave"]<-dat_SHARE_ld[one_hand_r,"r_ave"]


for (i in 1:nrow(dat_SHARE_ld))
{if(dat_SHARE_ld[i,"age_int"]<0){dat_SHARE_ld[i,"d_grip_test_threshhold"]<-NA}
  else
  {mean_hand_grip<-dat_hand_grip[(which((dat_hand_grip$Gender==dat_SHARE_ld[i,"gender"]&dat_hand_grip$Age_min<=dat_SHARE_ld[i,"age_int"]&dat_hand_grip$Age_max>=dat_SHARE_ld[i,"age_int"]&dat_hand_grip$Hand=="D")==TRUE)),"Mean"]
  std_hand_grip<-dat_hand_grip[(which((dat_hand_grip$Gender==dat_SHARE_ld[i,"gender"]&dat_hand_grip$Age_min<=dat_SHARE_ld[i,"age_int"]&dat_hand_grip$Age_max>=dat_SHARE_ld[i,"age_int"]&dat_hand_grip$Hand=="D")==TRUE)),"SD_AbsoluteVal"] 
  dat_SHARE_ld[i,"d_grip_test_threshhold"]<-mean_hand_grip-std_hand_grip}
}
mean_hand_grip<-NULL
std_hand_grip<-NULL
#table(dat_SHARE_ld$d_grip_test_threshhold)

#d_grip_strength = 1 if dominant hand strong enough
#d_grip_strength = 0 if dominant hand not strong enough
dat_SHARE_ld$d_grip_strength<-(dat_SHARE_ld$d_ave>dat_SHARE_ld$d_grip_test_threshhold)*1+(1-(dat_SHARE_ld$d_ave>dat_SHARE_ld$d_grip_test_threshhold))*0

####Non-dominant hand
dat_SHARE_ld$nd_ave<-isTRUE(dat_SHARE_ld$gs004_==2)*dat_SHARE_ld$r_ave+(1-isTRUE(dat_SHARE_ld$gs004_==2))*dat_SHARE_ld$l_ave
#label(nd_ave) <- "Average handgrip non-dominant hand"

for (i in 1:nrow(dat_SHARE_ld))
{if(dat_SHARE_ld[i,"age_int"]<0){dat_SHARE_ld[i,"nd_grip_test_threshhold"]<-NA}
  else
  {mean_hand_grip<-dat_hand_grip[(which((dat_hand_grip$Gender==dat_SHARE_ld[i,"gender"]&dat_hand_grip$Age_min<=dat_SHARE_ld[i,"age_int"]&dat_hand_grip$Age_max>=dat_SHARE_ld[i,"age_int"]&dat_hand_grip$Hand=="ND")==TRUE)),"Mean"]
  std_hand_grip<-dat_hand_grip[(which((dat_hand_grip$Gender==dat_SHARE_ld[i,"gender"]&dat_hand_grip$Age_min<=dat_SHARE_ld[i,"age_int"]&dat_hand_grip$Age_max>=dat_SHARE_ld[i,"age_int"]&dat_hand_grip$Hand=="ND")==TRUE)),"SD_AbsoluteVal"] 
  dat_SHARE_ld[i,"nd_grip_test_threshhold"]<-mean_hand_grip-std_hand_grip}
}
mean_hand_grip<-NULL
std_hand_grip<-NULL
#table(dat_SHARE_ld$d_grip_test_threshhold)

#nd_grip_strength = 1 if non-dominant hand strong enough
#nd_grip_strength = 0 if non-dominant hand not strong enough
dat_SHARE_ld$nd_grip_strength<-(dat_SHARE_ld$nd_ave>dat_SHARE_ld$nd_grip_test_threshhold)*1+(1-(dat_SHARE_ld$nd_ave>dat_SHARE_ld$nd_grip_test_threshhold))*0


dat_SHARE_ld$j1<-1*(dat_SHARE_ld$d_grip_strength==0&dat_SHARE_ld$nd_grip_strength==0)
#j1=1 no hand passed the grip strength test
#j1=0 at Least one hand passed grip strength test

table(dat_SHARE_ld$j1)
which(dat_SHARE_ld$j1==1)

lize<-dat_SHARE_ld[which(dat_SHARE_ld$j1==1),"health_state"]
table(lize)
table(dat_SHARE_ld$health_state)



########################################################################
#j2############PH003_HealthGen2
#Würden Sie sagen, Ihr Gesundheitszustand ist...

#Would you say that your health is...


#list(dat_SHARE_ld$ph003_)
#value      label
#-2    Refusal
#-1 Don't know
# 1  Excellent
# 2  Very good
# 3       Good
# 4       Fair
# 5       Poor

#table(dat_SHARE_ld$ph003_)
#TABLE
#-2   -1    1    2    3    4    5 
# 1    4  230  609 1024  416  111 

dat_SHARE_ld$j2<-ifelse(dat_SHARE_ld$ph003_==5,1,0)


#table(dat_SHARE_ld$j2)
#j2=1  self-assessed health rated as poor
#j2=0  self-assessed health rated as not poor
#      & Don't know + Refusal



########################################################################
#j3############PH003_HealthGen2
#Würden Sie sagen, Ihr Gesundheitszustand ist...

#Would you say that your health is...


#list(dat_SHARE_ld$ph003_)
#value      label
#-2    Refusal
#-1 Don't know
# 1  Excellent
# 2  Very good
# 3       Good
# 4       Fair
# 5       Poor

#table(dat_SHARE_ld$ph003_)
#TABLE
#-2   -1    1    2    3    4    5 
# 1    4  230  609 1024  416  111 

dat_SHARE_ld$j2<-ifelse(dat_SHARE_ld$ph003_==5,1,0)


#table(dat_SHARE_ld$j2)
#j2=1  self-assessed health rated as poor
#j2=0  self-assessed health rated as not poor
#      & Don't know + Refusal




########################################################################
#k#############deceased


dat_SHARE_ld$k<-dat_SHARE_ld$deceased==0



table(dat_SHARE_ld$k)
#k=FALSE  Participant dead
#k=TRUE  Participant's death not recorded




##############################################################################
##########SEGMENTATION########################################################


dat_SHARE_ld$health_state<- 
  ifelse(
    dat_SHARE_ld$k==F,
    "Dead",
    ifelse(
      (dat_SHARE_ld$f==1&dat_SHARE_ld$e==0&dat_SHARE_ld$d==0)&(dat_SHARE_ld$a==1|dat_SHARE_ld$b==1|dat_SHARE_ld$c==1),
      "Healthy",
      ifelse(
        (dat_SHARE_ld$f==0&dat_SHARE_ld$e==0&dat_SHARE_ld$d==0)&(dat_SHARE_ld$a==1|dat_SHARE_ld$b==1|dat_SHARE_ld$c==1),
        "not dead_1",
        ifelse(
          ((dat_SHARE_ld$g==1&dat_SHARE_ld$e==1&dat_SHARE_ld$d==0)&(dat_SHARE_ld$a==1|dat_SHARE_ld$b==1|dat_SHARE_ld$c==1))|((dat_SHARE_ld$g==1&dat_SHARE_ld$d==1)&(dat_SHARE_ld$a==1|dat_SHARE_ld$b==1|dat_SHARE_ld$c==1))|((dat_SHARE_ld$g==1)&(dat_SHARE_ld$a==0&dat_SHARE_ld$b==0&dat_SHARE_ld$c==0)),
          "Chronic Asymptomatic",
          ifelse(
            (dat_SHARE_ld$h==1),
            "1 Long Course of Decline",
            ifelse(
              (dat_SHARE_ld$i==1),
              "2 Long Course of Decline",
              ifelse(
                (dat_SHARE_ld$j==1),
                "3 Long Course of Decline",
                ifelse(
                  (dat_SHARE_ld$j==0&dat_SHARE_ld$i==0&dat_SHARE_ld$h==0&dat_SHARE_ld$g!=1&dat_SHARE_ld$e!=0),
                  "Chronic Stable",
                  "lost"
                )
              )  
            )
          )
        )
      )
    )
  )


table(dat_SHARE_ld$health_state)


lize<-dat_SHARE_ld[which(dat_SHARE_ld$health_state=="lost"),]


detach()
rm(list = ls(all.names = TRUE)) #will clear all objects includes hidden objects.
gc() #free up memrory and report the memory usage.