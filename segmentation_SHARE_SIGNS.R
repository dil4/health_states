# File:    segmentation_SHARE_ChinSwee_NoUtilisation.R
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
#library(foreign)
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



#Construct working database
dat_SHARE_SIGNS<-merge(cbind(datCF[,1],datCF[,7:37]), cbind(datHC[,1],datHC[,8:71]), by="mergeid",all=TRUE)
dat_SHARE_SIGNS<-merge(cbind(datMH[,1],datMH[,7:27]),dat_SHARE_SIGNS,by="mergeid",all=TRUE)
dat_SHARE_SIGNS<-merge(cbind(datBR[,1],datBR[,7:25]),dat_SHARE_SIGNS,by="mergeid",all=TRUE)
dat_SHARE_SIGNS<-merge(cbind(datGS[,1],datGS[,7:23]),dat_SHARE_SIGNS,by="mergeid",all=TRUE)
dat_SHARE_SIGNS<-merge(cbind(datPH[,1],datPH[,7:196]),dat_SHARE_SIGNS,by="mergeid",all=TRUE)
dat_SHARE_ld<-merge(datCV,dat_SHARE_ld,by="mergeid",all=TRUE)



##############Survey questions used for segmentation#####################

#########################################################################


#a#############PH006_DocCond
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

#list(dat_SHARE_SIGNS$ph006d1:ph006d21)
#  value  label
#-2      Refusal
#-1   Don't know
# 0 Not selected
# 1     Selected



dat_SHARE_SIGNS$a<-ifelse( (dat_SHARE_SIGNS$ph006d1==1
                            |dat_SHARE_SIGNS$ph006d2==1
                            |dat_SHARE_SIGNS$ph006d3==1
                            |dat_SHARE_SIGNS$ph006d4==1
                            |dat_SHARE_SIGNS$ph006d5==1
                            |dat_SHARE_SIGNS$ph006d6==1
                            |dat_SHARE_SIGNS$ph006d10==1
                            |dat_SHARE_SIGNS$ph006d11==1
                            |dat_SHARE_SIGNS$ph006d13==1
                            |dat_SHARE_SIGNS$ph006d14==1
                            |dat_SHARE_SIGNS$ph006d15==1
                            |dat_SHARE_SIGNS$ph006d16==1
                            |dat_SHARE_SIGNS$ph006d19==1
                            |dat_SHARE_SIGNS$ph006d20==1)
                           ,1,0)



dat_SHARE_SIGNS$a_num<-(replace(dat_SHARE_SIGNS$ph006d1, dat_SHARE_SIGNS$ph006d1 < 0, 0)
                        +replace(dat_SHARE_SIGNS$ph006d2, dat_SHARE_SIGNS$ph006d2 < 0, 0)
                        +replace(dat_SHARE_SIGNS$ph006d3, dat_SHARE_SIGNS$ph006d3 < 0, 0)
                        +replace(dat_SHARE_SIGNS$ph006d4, dat_SHARE_SIGNS$ph006d4 < 0, 0)
                        +replace(dat_SHARE_SIGNS$ph006d5, dat_SHARE_SIGNS$ph006d5 < 0, 0)
                        +replace(dat_SHARE_SIGNS$ph006d6, dat_SHARE_SIGNS$ph006d6 < 0, 0)
                        +replace(dat_SHARE_SIGNS$ph006d10, dat_SHARE_SIGNS$ph006d10 < 0, 0)
                        +replace(dat_SHARE_SIGNS$ph006d11, dat_SHARE_SIGNS$ph006d11 < 0, 0)
                        +replace(dat_SHARE_SIGNS$ph006d13, dat_SHARE_SIGNS$ph006d13 < 0, 0)
                        +replace(dat_SHARE_SIGNS$ph006d14, dat_SHARE_SIGNS$ph006d14 < 0, 0)
                        +replace(dat_SHARE_SIGNS$ph006d15, dat_SHARE_SIGNS$ph006d15 < 0, 0)
                        +replace(dat_SHARE_SIGNS$ph006d16, dat_SHARE_SIGNS$ph006d16 < 0, 0)
                        +replace(dat_SHARE_SIGNS$ph006d19, dat_SHARE_SIGNS$ph006d19 < 0, 0)
                        +replace(dat_SHARE_SIGNS$ph006d20, dat_SHARE_SIGNS$ph006d20 < 0, 0)                          
)


table(dat_SHARE_SIGNS$a)                                  
#a=1  Diagnosed with one or more chronic disease
#a=0  No chronic disease diagnosis
#     & Don't know + Refusal

#table(dat_SHARE_SIGNS$a_num) #frequency table of number of chronic diseses per person 

dat_SHARE_SIGNS$f<-ifelse(is.na(dat_SHARE_SIGNS$a),0,1)
#f=1  Response regarding chronic diseases recorded 
#f=0  No record of chronic disease response

dat_SHARE_SIGNS$f2<-ifelse(is.na(dat_SHARE_SIGNS$a)&dat_SHARE_SIGNS$deceased==1,1,0)
#f2=1  No record of chronic disease response because person is dead 
#f2=0  Else







dat_SHARE_SIGNS$a<-ifelse((dat_SHARE_SIGNS$ph006d1=="Selected"|dat_SHARE_SIGNS$ph006d2=="Selected"|dat_SHARE_SIGNS$ph006d3=="Selected"|dat_SHARE_SIGNS$ph006d4=="Selected"|dat_SHARE_SIGNS$ph006d5=="Selected"|dat_SHARE_SIGNS$ph006d6=="Selected"|dat_SHARE_SIGNS$ph006d10=="Selected"|dat_SHARE_SIGNS$ph006d11=="Selected"|dat_SHARE_SIGNS$ph006d13=="Selected"|dat_SHARE_SIGNS$ph006d14=="Selected"|dat_SHARE_SIGNS$ph006d15=="Selected"|dat_SHARE_SIGNS$ph006d16=="Selected"|dat_SHARE_SIGNS$ph006d19=="Selected"|dat_SHARE_SIGNS$ph006d20=="Selected"),1,0)
dat_SHARE_SIGNS$j <- ifelse(is.na(dat_SHARE_SIGNS$a),0,1)
dat_SHARE_SIGNS$k <- ifelse(dat_SHARE_SIGNS$f2<-ifelse(is.na(dat_SHARE_SIGNS$e)&dat_SHARE_SIGNS$deceased==0,1,0))
dat_SHARE_SIGNS$b <- ifelse(
  dat_SHARE_SIGNS$hc602_==1,1,
  ifelse(dat_SHARE_SIGNS$hc602_>1,2
         ,0))





dat_SHARE_SIGNS$d<-ifelse((dat_SHARE_SIGNS$cf001=="Fair"|dat_SHARE_SIGNS$cf001=="Poor"),0,1)
dat_SHARE_SIGNS$e<-ifelse(dat_SHARE_SIGNS$hc013_>=2,1,0)
dat_SHARE_SIGNS$f<-ifelse(dat_SHARE_SIGNS$mh002_=="Yes",1,0)


View(dat_SHARE_SIGNS$cf012)
levels(dat_SHARE_SIGNS$mh002_)

dat_SHARE_SIGNS$g<-ifelse(dat_SHARE_SIGNS$ph003=="Poor",1,0)

dat_SHARE_SIGNS$hands<-(dat_SHARE_SIGNS$gs006_+dat_SHARE_SIGNS$gs008)/2
dat_SHARE_SIGNS$h<-ifelse(dat_SHARE_SIGNS$hands<30.38,1,0)

dat_SHARE_SIGNS$i<-ifelse(dat_SHARE_SIGNS$ph095_>5,1,0)
dat_SHARE_SIGNS$j<-ifelse((dat_SHARE_SIGNS$br016=="Once a week"|dat_SHARE_SIGNS$br016=="One to three times a month"|dat_SHARE_SIGNS$br016=="More than once a week"),0,1)


dat_SHARE_SIGNS$k <- ifelse(sum(dat_SHARE_SIGNS$g,dat_SHARE_SIGNS$h,dat_SHARE_SIGNS$i,dat_SHARE_SIGNS$j, na.rm=T)>=3,1,0)

View(dat_SHARE_SIGNS$h)

# levels(dat_SHARE_SIGNS$ph003)
# levels(dat_SHARE_SIGNS$gs700)
# levels(dat_SHARE_SIGNS$ph095)
# levels(dat_SHARE_SIGNS$br016)



nrow(filter(dat_SHARE_SIGNS, k>=1))



rm(list = ls(all.names = TRUE)) #will clear all objects includes hidden objects.
gc() #free up memrory and report the memory usage.