# File:    extract_SHARE_data.R
# Project:  SNF NRP 74
# Author:  Lize Duminy, lize.duminy@bfh.ch
# Date:    2020-02-17


#if (!require("haven")) install.packages("haven") # Installs haven if needed
#if (!require("foreign")) install.packages("foreign") # Installs foreign if needed
if (!require("tidyverse")) install.packages("tidyverse") # Installs tidyverse if needed
#if (!require("dplyr")) install.packages("dplyr") # Installs dplyr if needed
#if (!require("corrr")) install.packages("corrr") # Installs corrr if needed
#if (!require("ggplot2")) install.packages("ggplot2") # Installs ggplot2 if needed
if (!require("data.table")) install.packages("data.table") # Installs data.table if needed


#library(magrittr)


library(haven)
library(foreign)
library(dplyr)
#library(corrr)
#library(ggplot2)
library(data.table)
#library(tidyverse)



###################hc.dta
datHC_w7<-read_dta("//bfh.ch/data/LFE/G/Research-HE/data/SHARE/rel7-0-0/sharew7_rel7-0-0/sharew7_rel7-0-0_ALL_datasets_stata/sharew7_rel7-0-0_hc.dta")
datHC_w7<-datHC_w7 %>% filter(as_factor(datHC_w7$country)=="Switzerland")
datHC_w7<-cbind.data.frame(datHC_w7[,"mergeid"],datHC_w7[,"hc602_"],datHC_w7[,"hc014_"],datHC_w7[,"hc013_"])

datHC_w6<-read_dta("//bfh.ch/data/LFE/G/Research-HE/data/SHARE/rel7-0-0/sharew6_rel7-0-0/sharew6_rel7-0-0_ALL_datasets_stata/sharew6_rel7-0-0_hc.dta")
datHC_w6<-datHC_w6 %>% filter(as_factor(datHC_w6$country)=="Switzerland")
datHC_w6<-cbind.data.frame(datHC_w6[,"mergeid"],datHC_w6[,"hc602_"],datHC_w6[,"hc014_"],datHC_w6[,"hc013_"])
###w6 and w7 ("hc602_") == w1 - w2 and w4 -w5 (hc002_)                    
datHC_w5<-read_dta("//bfh.ch/data/LFE/G/Research-HE/data/SHARE/rel7-0-0/sharew5_rel7-0-0/sharew5_rel7-0-0_ALL_datasets_stata/sharew5_rel7-0-0_hc.dta")
datHC_w5<-datHC_w5 %>% filter(as_factor(datHC_w5$country)=="Switzerland")
datHC_w5<-cbind.data.frame(datHC_w5[,"mergeid"],datHC_w5[,"hc002_"],datHC_w5[,"hc014_"],datHC_w5[,"hc013_"])

datHC_w4<-read_dta("//bfh.ch/data/LFE/G/Research-HE/data/SHARE/rel7-0-0/sharew4_rel7-0-0/sharew4_rel7-0-0_ALL_datasets_stata/sharew4_rel7-0-0_hc.dta")
datHC_w4<-datHC_w4 %>% filter(as_factor(datHC_w4$country)=="Switzerland")
datHC_w4<-cbind.data.frame(datHC_w4[,"mergeid"],datHC_w4[,"hc002_"],datHC_w4[,"hc014_"],datHC_w4[,"hc013_"])

###SHARELIFE does not have these questions
#datHC_w3<-read_dta("//bfh.ch/data/LFE/G/Research-HE/data/SHARE/rel7-0-0/sharew3_rel7-0-0/sharew3_rel7-0-0_ALL_datasets_stata/sharew3_rel7-0-0_hc.dta")
#datHC_w3<-datHC_w3 %>% filter(as_factor(datHC_w3$country)=="Switzerland")
#datHC_w3<-cbind.data.frame(datHC_w3[,"mergeid"],datHC_w3[,"hc014_"],datHC_w3[,"hc013_"])

datHC_w2<-read_dta("//bfh.ch/data/LFE/G/Research-HE/data/SHARE/rel7-0-0/sharew2_rel7-0-0/sharew2_rel7-0-0_ALL_datasets_stata/sharew2_rel7-0-0_hc.dta")
datHC_w2<-datHC_w2 %>% filter(as_factor(datHC_w2$country)=="Switzerland")
datHC_w2<-cbind.data.frame(datHC_w2[,"mergeid"],datHC_w2[,"hc002_"],datHC_w2[,"hc014_"],datHC_w2[,"hc013_"])

datHC_w1<-read_dta("//bfh.ch/data/LFE/G/Research-HE/data/SHARE/rel7-0-0/sharew1_rel7-0-0/sharew1_rel7-0-0_ALL_datasets_stata/sharew1_rel7-0-0_hc.dta")
datHC_w1<-datHC_w1 %>% filter(as_factor(datHC_w1$country)=="Switzerland")
datHC_w1<-cbind.data.frame(datHC_w1[,"mergeid"],datHC_w1[,"hc002_"],datHC_w1[,"hc014_"],datHC_w1[,"hc013_"])




###################cf.dta
datCF_w7<-read_dta("//bfh.ch/data/LFE/G/Research-HE/data/SHARE/rel7-0-0/sharew7_rel7-0-0/sharew7_rel7-0-0_ALL_datasets_stata/sharew7_rel7-0-0_cf.dta")
datCF_w7<-datCF_w7 %>% filter(as_factor(datCF_w7$country)=="Switzerland")
datCF_w7<-cbind.data.frame(datCF_w7[,"mergeid"],datCF_w7[,"cf010_"])

datCF_w6<-read_dta("//bfh.ch/data/LFE/G/Research-HE/data/SHARE/rel7-0-0/sharew6_rel7-0-0/sharew6_rel7-0-0_ALL_datasets_stata/sharew6_rel7-0-0_cf.dta")
datCF_w6<-datCF_w6 %>% filter(as_factor(datCF_w6$country)=="Switzerland")
datCF_w6<-cbind.data.frame(datCF_w6[,"mergeid"],datCF_w6[,"cf010_"])

datCF_w5<-read_dta("//bfh.ch/data/LFE/G/Research-HE/data/SHARE/rel7-0-0/sharew5_rel7-0-0/sharew5_rel7-0-0_ALL_datasets_stata/sharew5_rel7-0-0_cf.dta")
datCF_w5<-datCF_w5 %>% filter(as_factor(datCF_w5$country)=="Switzerland")
datCF_w5<-cbind.data.frame(datCF_w5[,"mergeid"],datCF_w5[,"cf010_"])

datCF_w4<-read_dta("//bfh.ch/data/LFE/G/Research-HE/data/SHARE/rel7-0-0/sharew4_rel7-0-0/sharew4_rel7-0-0_ALL_datasets_stata/sharew4_rel7-0-0_cf.dta")
datCF_w4<-datCF_w4 %>% filter(as_factor(datCF_w4$country)=="Switzerland")
datCF_w4<-cbind.data.frame(datCF_w4[,"mergeid"],datCF_w4[,"cf010_"])
###SHARELIFE does not have these questions
#datCF_w3<-read_dta("//bfh.ch/data/LFE/G/Research-HE/data/SHARE/rel7-0-0/sharew3_rel7-0-0/sharew3_rel7-0-0_ALL_datasets_stata/sharew3_rel7-0-0_cf.dta")
#datCF_w3<-datCF_w3 %>% filter(as_factor(datCF_w3$country)=="Switzerland")
#datCF_w3<-cbind.data.frame(datCF_w3[,"mergeid"],datCF_w3[,"cf010_"])

datCF_w2<-read_dta("//bfh.ch/data/LFE/G/Research-HE/data/SHARE/rel7-0-0/sharew2_rel7-0-0/sharew2_rel7-0-0_ALL_datasets_stata/sharew2_rel7-0-0_cf.dta")
datCF_w2<-datCF_w2 %>% filter(as_factor(datCF_w2$country)=="Switzerland")
datCF_w2<-cbind.data.frame(datCF_w2[,"mergeid"],datCF_w2[,"cf010_"])

datCF_w1<-read_dta("//bfh.ch/data/LFE/G/Research-HE/data/SHARE/rel7-0-0/sharew1_rel7-0-0/sharew1_rel7-0-0_ALL_datasets_stata/sharew1_rel7-0-0_cf.dta")
datCF_w1<-datCF_w1 %>% filter(as_factor(datCF_w1$country)=="Switzerland")
datCF_w1<-cbind.data.frame(datCF_w1[,"mergeid"],datCF_w1[,"cf010_"])




###################mh.dta
datMH_w7<-read_dta("//bfh.ch/data/LFE/G/Research-HE/data/SHARE/rel7-0-0/sharew7_rel7-0-0/sharew7_rel7-0-0_ALL_datasets_stata/sharew7_rel7-0-0_mh.dta")
datMH_w7<-datMH_w7 %>% filter(as_factor(datMH_w7$country)=="Switzerland")
datMH_w7<-cbind.data.frame(datMH_w7[,"mergeid"],datMH_w7[,"mh002_"])

datMH_w6<-read_dta("//bfh.ch/data/LFE/G/Research-HE/data/SHARE/rel7-0-0/sharew6_rel7-0-0/sharew6_rel7-0-0_ALL_datasets_stata/sharew6_rel7-0-0_mh.dta")
datMH_w6<-datMH_w6 %>% filter(as_factor(datMH_w6$country)=="Switzerland")
datMH_w6<-cbind.data.frame(datMH_w6[,"mergeid"],datMH_w6[,"mh002_"])

datMH_w5<-read_dta("//bfh.ch/data/LFE/G/Research-HE/data/SHARE/rel7-0-0/sharew5_rel7-0-0/sharew5_rel7-0-0_ALL_datasets_stata/sharew5_rel7-0-0_mh.dta")
datMH_w5<-datMH_w5 %>% filter(as_factor(datMH_w5$country)=="Switzerland")
datMH_w5<-cbind.data.frame(datMH_w5[,"mergeid"],datMH_w5[,"mh002_"])

datMH_w4<-read_dta("//bfh.ch/data/LFE/G/Research-HE/data/SHARE/rel7-0-0/sharew4_rel7-0-0/sharew4_rel7-0-0_ALL_datasets_stata/sharew4_rel7-0-0_mh.dta")
datMH_w4<-datMH_w4 %>% filter(as_factor(datMH_w4$country)=="Switzerland")
datMH_w4<-cbind.data.frame(datMH_w4[,"mergeid"],datMH_w4[,"mh002_"])
###SHARELIFE does not have these questions
#datMH_w3<-read_dta("//bfh.ch/data/LFE/G/Research-HE/data/SHARE/rel7-0-0/sharew3_rel7-0-0/sharew3_rel7-0-0_ALL_datasets_stata/sharew3_rel7-0-0_mh.dta")
#datMH_w3<-datMH_w3 %>% filter(as_factor(datMH_w3$country)=="Switzerland")
#datMH_w3<-cbind.data.frame(datMH_w3[,"mergeid"],datMH_w3[,"mh002_"])

datMH_w2<-read_dta("//bfh.ch/data/LFE/G/Research-HE/data/SHARE/rel7-0-0/sharew2_rel7-0-0/sharew2_rel7-0-0_ALL_datasets_stata/sharew2_rel7-0-0_mh.dta")
datMH_w2<-datMH_w2 %>% filter(as_factor(datMH_w2$country)=="Switzerland")
datMH_w2<-cbind.data.frame(datMH_w2[,"mergeid"],datMH_w2[,"mh002_"])

datMH_w1<-read_dta("//bfh.ch/data/LFE/G/Research-HE/data/SHARE/rel7-0-0/sharew1_rel7-0-0/sharew1_rel7-0-0_ALL_datasets_stata/sharew1_rel7-0-0_mh.dta")
datMH_w1<-datMH_w1 %>% filter(as_factor(datMH_w1$country)=="Switzerland")
datMH_w1<-cbind.data.frame(datMH_w1[,"mergeid"],datMH_w1[,"mh002_"])





###################br.dta
datBR_w7<-read_dta("//bfh.ch/data/LFE/G/Research-HE/data/SHARE/rel7-0-0/sharew7_rel7-0-0/sharew7_rel7-0-0_ALL_datasets_stata/sharew7_rel7-0-0_br.dta")
datBR_w7<-datBR_w7 %>% filter(as_factor(datBR_w7$country)=="Switzerland")
datBR_w7<-cbind.data.frame(datBR_w7[,"mergeid"],datBR_w7[,"br015_"],datBR_w7[,"br016_"])

datBR_w6<-read_dta("//bfh.ch/data/LFE/G/Research-HE/data/SHARE/rel7-0-0/sharew6_rel7-0-0/sharew6_rel7-0-0_ALL_datasets_stata/sharew6_rel7-0-0_br.dta")
datBR_w6<-datBR_w6 %>% filter(as_factor(datBR_w6$country)=="Switzerland")
datBR_w6<-cbind.data.frame(datBR_w6[,"mergeid"],datBR_w6[,"br015_"],datBR_w6[,"br016_"])

datBR_w5<-read_dta("//bfh.ch/data/LFE/G/Research-HE/data/SHARE/rel7-0-0/sharew5_rel7-0-0/sharew5_rel7-0-0_ALL_datasets_stata/sharew5_rel7-0-0_br.dta")
datBR_w5<-datBR_w5 %>% filter(as_factor(datBR_w5$country)=="Switzerland")
datBR_w5<-cbind.data.frame(datBR_w5[,"mergeid"],datBR_w5[,"br015_"],datBR_w5[,"br016_"])

datBR_w4<-read_dta("//bfh.ch/data/LFE/G/Research-HE/data/SHARE/rel7-0-0/sharew4_rel7-0-0/sharew4_rel7-0-0_ALL_datasets_stata/sharew4_rel7-0-0_br.dta")
datBR_w4<-datBR_w4 %>% filter(as_factor(datBR_w4$country)=="Switzerland")
datBR_w4<-cbind.data.frame(datBR_w4[,"mergeid"],datBR_w4[,"br015_"],datBR_w4[,"br016_"])
###SHARELIFE does not have these questions
#datBR_w3<-read_dta("//bfh.ch/data/LFE/G/Research-HE/data/SHARE/rel7-0-0/sharew3_rel7-0-0/sharew3_rel7-0-0_ALL_datasets_stata/sharew3_rel7-0-0_br.dta")
#datBR_w3<-datBR_w3 %>% filter(as_factor(datBR_w3$country)=="Switzerland")
#datBR_w3<-cbind.data.frame(datBR_w3[,"mergeid"],datBR_w3[,"br015_"],datBR_w3[,"br016_"])

datBR_w2<-read_dta("//bfh.ch/data/LFE/G/Research-HE/data/SHARE/rel7-0-0/sharew2_rel7-0-0/sharew2_rel7-0-0_ALL_datasets_stata/sharew2_rel7-0-0_br.dta")
datBR_w2<-datBR_w2 %>% filter(as_factor(datBR_w2$country)=="Switzerland")
datBR_w2<-cbind.data.frame(datBR_w2[,"mergeid"],datBR_w2[,"br015_"],datBR_w2[,"br016_"])

datBR_w1<-read_dta("//bfh.ch/data/LFE/G/Research-HE/data/SHARE/rel7-0-0/sharew1_rel7-0-0/sharew1_rel7-0-0_ALL_datasets_stata/sharew1_rel7-0-0_br.dta")
datBR_w1<-datBR_w1 %>% filter(as_factor(datBR_w1$country)=="Switzerland")
datBR_w1<-cbind.data.frame(datBR_w1[,"mergeid"],datBR_w1[,"br015_"],datBR_w1[,"br016_"])





###################gs.dta
datGS_w7<-read_dta("//bfh.ch/data/LFE/G/Research-HE/data/SHARE/rel7-0-0/sharew7_rel7-0-0/sharew7_rel7-0-0_ALL_datasets_stata/sharew7_rel7-0-0_gs.dta")
datGS_w7<-datGS_w7 %>% filter(as_factor(datGS_w7$country)=="Switzerland")
datGS_w7<-cbind.data.frame(datGS_w7[,"mergeid"],datGS_w7[,"gs004_"],datGS_w7[,"gs006_"],datGS_w7[,"gs007_"],datGS_w7[,"gs008_"],datGS_w7[,"gs009_"])

datGS_w6<-read_dta("//bfh.ch/data/LFE/G/Research-HE/data/SHARE/rel7-0-0/sharew6_rel7-0-0/sharew6_rel7-0-0_ALL_datasets_stata/sharew6_rel7-0-0_gs.dta")
datGS_w6<-datGS_w6 %>% filter(as_factor(datGS_w6$country)=="Switzerland")
datGS_w6<-cbind.data.frame(datGS_w6[,"mergeid"],datGS_w6[,"gs004_"],datGS_w6[,"gs006_"],datGS_w6[,"gs007_"],datGS_w6[,"gs008_"],datGS_w6[,"gs009_"])

datGS_w5<-read_dta("//bfh.ch/data/LFE/G/Research-HE/data/SHARE/rel7-0-0/sharew5_rel7-0-0/sharew5_rel7-0-0_ALL_datasets_stata/sharew5_rel7-0-0_gs.dta")
datGS_w5<-datGS_w5 %>% filter(as_factor(datGS_w5$country)=="Switzerland")
datGS_w5<-cbind.data.frame(datGS_w5[,"mergeid"],datGS_w5[,"gs004_"],datGS_w5[,"gs006_"],datGS_w5[,"gs007_"],datGS_w5[,"gs008_"],datGS_w5[,"gs009_"])

datGS_w4<-read_dta("//bfh.ch/data/LFE/G/Research-HE/data/SHARE/rel7-0-0/sharew4_rel7-0-0/sharew4_rel7-0-0_ALL_datasets_stata/sharew4_rel7-0-0_gs.dta")
datGS_w4<-datGS_w4 %>% filter(as_factor(datGS_w4$country)=="Switzerland")
datGS_w4<-cbind.data.frame(datGS_w4[,"mergeid"],datGS_w4[,"gs004_"],datGS_w4[,"gs006_"],datGS_w4[,"gs007_"],datGS_w4[,"gs008_"],datGS_w4[,"gs009_"])
###SHARELIFE does not have these questions
#datGS_w3<-read_dta("//bfh.ch/data/LFE/G/Research-HE/data/SHARE/rel7-0-0/sharew3_rel7-0-0/sharew3_rel7-0-0_ALL_datasets_stata/sharew3_rel7-0-0_gs.dta")
#datGS_w3<-datGS_w3 %>% filter(as_factor(datGS_w3$country)=="Switzerland")
#datGS_w3<-cbind.data.frame(datGS_w3[,"mergeid"],datGS_w3[,"gs004_"],datGS_w3[,"gs006_"],datGS_w3[,"gs007_"],datGS_w3[,"gs008_"],datGS_w3[,"gs009_"])

datGS_w2<-read_dta("//bfh.ch/data/LFE/G/Research-HE/data/SHARE/rel7-0-0/sharew2_rel7-0-0/sharew2_rel7-0-0_ALL_datasets_stata/sharew2_rel7-0-0_gs.dta")
datGS_w2<-datGS_w2 %>% filter(as_factor(datGS_w2$country)=="Switzerland")
datGS_w2<-cbind.data.frame(datGS_w2[,"mergeid"],datGS_w2[,"gs004_"],datGS_w2[,"gs006_"],datGS_w2[,"gs007_"],datGS_w2[,"gs008_"],datGS_w2[,"gs009_"])

datGS_w1<-read_dta("//bfh.ch/data/LFE/G/Research-HE/data/SHARE/rel7-0-0/sharew1_rel7-0-0/sharew1_rel7-0-0_ALL_datasets_stata/sharew1_rel7-0-0_gs.dta")
datGS_w1<-datGS_w1 %>% filter(as_factor(datGS_w1$country)=="Switzerland")
datGS_w1<-cbind.data.frame(datGS_w1[,"mergeid"],datGS_w1[,"gs004_"],datGS_w1[,"gs006_"],datGS_w1[,"gs007_"],datGS_w1[,"gs008_"],datGS_w1[,"gs009_"])







###################ph.dta
######Note: the list of chronic diseases asked about becomes more extensive over time. This segmentation includes the newly added chronic diseases over time for a more accurate segmentation.
######Note: the amount of weight lost is not recorded between w2 and w4 (ph095_)
######Note: no information about recent weight loss recorded in w1
######Note: ph010_d7 (w1-w4) is the same as ph089d1 (w5-w7) (asks about falls)
datPH_w7<-read_dta("//bfh.ch/data/LFE/G/Research-HE/data/SHARE/rel7-0-0/sharew7_rel7-0-0/sharew7_rel7-0-0_ALL_datasets_stata/sharew7_rel7-0-0_ph.dta")
datPH_w7<-datPH_w7 %>% filter(as_factor(datPH_w7$country)=="Switzerland")
datPH_w7<-cbind.data.frame(datPH_w7[,"mergeid"],datPH_w7[,"ph003_"],datPH_w7[,"ph006d1"],datPH_w7[,"ph006d2"],datPH_w7[,"ph006d3"],datPH_w7[,"ph006d4"],datPH_w7[,"ph006d5"],datPH_w7[,"ph006d6"],datPH_w7[,"ph006d10"],datPH_w7[,"ph006d11"],datPH_w7[,"ph006d12"],datPH_w7[,"ph006d13"],datPH_w7[,"ph006d14"],datPH_w7[,"ph006d15"],datPH_w7[,"ph006d16"],datPH_w7[,"ph006d18"],datPH_w7[,"ph006d19"],datPH_w7[,"ph006d20"],datPH_w7[,"ph006d21"],datPH_w7[,"ph065_"],datPH_w7[,"ph095_"],datPH_w7[,"ph066_"],datPH_w7[,"ph089d1"],datPH_w7[,"ph005_"])

datPH_w6<-read_dta("//bfh.ch/data/LFE/G/Research-HE/data/SHARE/rel7-0-0/sharew6_rel7-0-0/sharew6_rel7-0-0_ALL_datasets_stata/sharew6_rel7-0-0_ph.dta")
datPH_w6<-datPH_w6 %>% filter(as_factor(datPH_w6$country)=="Switzerland")
datPH_w6<-cbind.data.frame(datPH_w6[,"mergeid"],datPH_w6[,"ph003_"],datPH_w6[,"ph006d1"],datPH_w6[,"ph006d2"],datPH_w6[,"ph006d3"],datPH_w6[,"ph006d4"],datPH_w6[,"ph006d5"],datPH_w6[,"ph006d6"],datPH_w6[,"ph006d10"],datPH_w6[,"ph006d11"],datPH_w6[,"ph006d12"],datPH_w6[,"ph006d13"],datPH_w6[,"ph006d14"],datPH_w6[,"ph006d15"],datPH_w6[,"ph006d16"],datPH_w6[,"ph006d18"],datPH_w6[,"ph006d19"],datPH_w6[,"ph006d20"],datPH_w6[,"ph006d21"],datPH_w6[,"ph065_"],datPH_w6[,"ph095_"],datPH_w6[,"ph066_"],datPH_w6[,"ph089d1"],datPH_w6[,"ph005_"])

#Not available: datPH_w5[,"ph006d21"] (chronic diseases)
datPH_w5<-read_dta("//bfh.ch/data/LFE/G/Research-HE/data/SHARE/rel7-0-0/sharew5_rel7-0-0/sharew5_rel7-0-0_ALL_datasets_stata/sharew5_rel7-0-0_ph.dta")
datPH_w5<-datPH_w5 %>% filter(as_factor(datPH_w5$country)=="Switzerland")
datPH_w5<-cbind.data.frame(datPH_w5[,"mergeid"],datPH_w5[,"ph003_"],datPH_w5[,"ph006d1"],datPH_w5[,"ph006d2"],datPH_w5[,"ph006d3"],datPH_w5[,"ph006d4"],datPH_w5[,"ph006d5"],datPH_w5[,"ph006d6"],datPH_w5[,"ph006d10"],datPH_w5[,"ph006d11"],datPH_w5[,"ph006d12"],datPH_w5[,"ph006d13"],datPH_w5[,"ph006d14"],datPH_w5[,"ph006d15"],datPH_w5[,"ph006d16"],datPH_w5[,"ph006d18"],datPH_w5[,"ph006d19"],datPH_w5[,"ph006d20"],datPH_w5[,"ph065_"],datPH_w5[,"ph095_"],datPH_w5[,"ph066_"],datPH_w5[,"ph089d1"],datPH_w5[,"ph005_"])

#Not available: datPH_w4[,"ph006d18"],datPH_w4[,"ph006d19"],datPH_w4[,"ph006d20"],datPH_w4[,"ph006d21"] (chronic diseases)
#not available: datPH_w4[,"ph095_"] (asks how much weight a participant lost)
#Note: ph010_d7 (w1-w4) is the same as ph089d1 (w5-w7) (asks about falls)
datPH_w4<-read_dta("//bfh.ch/data/LFE/G/Research-HE/data/SHARE/rel7-0-0/sharew4_rel7-0-0/sharew4_rel7-0-0_ALL_datasets_stata/sharew4_rel7-0-0_ph.dta")
datPH_w4<-datPH_w4 %>% filter(as_factor(datPH_w4$country)=="Switzerland")
datPH_w4<-cbind.data.frame(datPH_w4[,"mergeid"],datPH_w4[,"ph003_"],datPH_w4[,"ph006d1"],datPH_w4[,"ph006d2"],datPH_w4[,"ph006d3"],datPH_w4[,"ph006d4"],datPH_w4[,"ph006d5"],datPH_w4[,"ph006d6"],datPH_w4[,"ph006d10"],datPH_w4[,"ph006d11"],datPH_w4[,"ph006d12"],datPH_w4[,"ph006d13"],datPH_w4[,"ph006d14"],datPH_w4[,"ph006d15"],datPH_w4[,"ph006d16"],datPH_w4[,"ph065_"],datPH_w4[,"ph066_"],datPH_w4[,"ph010d7"],datPH_w4[,"ph005_"])

###Ommit SHARELIFE
#datPH_w3<-read_dta("//bfh.ch/data/LFE/G/Research-HE/data/SHARE/rel7-0-0/sharew3_rel7-0-0/sharew3_rel7-0-0_ALL_datasets_stata/sharew3_rel7-0-0_ph.dta")
#datPH_w3<-datPH_w3 %>% filter(as_factor(datPH_w3$country)=="Switzerland")
#datPH_w3<-cbind.data.frame(datPH_w3[,"mergeid"],datPH_w3[,"ph003_"],datPH_w3[,"ph006d1"],datPH_w3[,"ph006d2"],datPH_w3[,"ph006d3"],datPH_w3[,"ph006d4"],datPH_w3[,"ph006d5"],datPH_w3[,"ph006d6"],datPH_w3[,"ph006d10"],datPH_w3[,"ph006d11"],datPH_w3[,"ph006d12"],datPH_w3[,"ph006d13"],datPH_w3[,"ph006d14"],datPH_w3[,"ph006d15"],datPH_w3[,"ph006d16"],datPH_w3[,"ph006d18"],datPH_w3[,"ph006d19"],datPH_w3[,"ph006d20"],datPH_w3[,"ph006d21"],datPH_w3[,"ph065_"],datPH_w3[,"ph095_"],datPH_w3[,"ph066_"],datPH_w3[,"ph089d1"],datPH_w3[,"ph005_"])
#Not available: datPH_w2[,"ph006d18"],datPH_w2[,"ph006d19"],datPH_w2[,"ph006d20"],datPH_w2[,"ph006d21"] (chronic diseases)
#Not available: datPH_w2[,"ph095_"] (asks how much weight a participant lost)
#Note: ph010_d7 (w1-w4) is the same as ph089d1 (w5-w7) (asks about falls)
datPH_w2<-read_dta("//bfh.ch/data/LFE/G/Research-HE/data/SHARE/rel7-0-0/sharew2_rel7-0-0/sharew2_rel7-0-0_ALL_datasets_stata/sharew2_rel7-0-0_ph.dta")
datPH_w2<-datPH_w2 %>% filter(as_factor(datPH_w2$country)=="Switzerland")
datPH_w2<-cbind.data.frame(datPH_w2[,"mergeid"],datPH_w2[,"ph003_"],datPH_w2[,"ph006d1"],datPH_w2[,"ph006d2"],datPH_w2[,"ph006d3"],datPH_w2[,"ph006d4"],datPH_w2[,"ph006d5"],datPH_w2[,"ph006d6"],datPH_w2[,"ph006d10"],datPH_w2[,"ph006d11"],datPH_w2[,"ph006d12"],datPH_w2[,"ph006d13"],datPH_w2[,"ph006d14"],datPH_w2[,"ph006d15"],datPH_w2[,"ph006d16"],datPH_w2[,"ph065_"],datPH_w2[,"ph066_"],datPH_w2[,"ph010d7"],datPH_w2[,"ph005_"])

#Not available: datPH_w1[,"ph006d15"],datPH_w1[,"ph006d16"],datPH_w1[,"ph006d18"],datPH_w1[,"ph006d19"],datPH_w1[,"ph006d20"],datPH_w1[,"ph006d21"] (chronic diseases)
#Not available: datPH_w1[,"ph065_"],datPH_w1[,"ph066_"] (if participant had lost weight recently)
#Not available: datPH_w1[,"ph095_"] (asks how much weight a participant lost)
#Note: ph010_d7 (w1-w4) is the same as ph089d1 (w5-w7) (asks about falls)
datPH_w1<-read_dta("//bfh.ch/data/LFE/G/Research-HE/data/SHARE/rel7-0-0/sharew1_rel7-0-0/sharew1_rel7-0-0_ALL_datasets_stata/sharew1_rel7-0-0_ph.dta")
datPH_w1<-datPH_w1 %>% filter(as_factor(datPH_w1$country)=="Switzerland")
datPH_w1<-cbind.data.frame(datPH_w1[,"mergeid"],datPH_w1[,"ph003_"],datPH_w1[,"ph006d1"],datPH_w1[,"ph006d2"],datPH_w1[,"ph006d3"],datPH_w1[,"ph006d4"],datPH_w1[,"ph006d5"],datPH_w1[,"ph006d6"],datPH_w1[,"ph006d10"],datPH_w1[,"ph006d11"],datPH_w1[,"ph006d12"],datPH_w1[,"ph006d13"],datPH_w1[,"ph006d14"],datPH_w1[,"ph010d7"],datPH_w1[,"ph005_"])





###################ph.dta
datCV_w7<-read_dta("//bfh.ch/data/LFE/G/Research-HE/data/SHARE/rel7-0-0/sharew7_rel7-0-0/sharew7_rel7-0-0_ALL_datasets_stata/sharew7_rel7-0-0_cv_r.dta")
datCV_w7<-datCV_w7 %>% filter(as_factor(datCV_w7$country)=="Switzerland")
datCV_w7<-rbind.data.frame(datCV_w7[datCV_w7$interview==1,],datCV_w7[datCV_w7$interview==2,])#Keep only correspondants of current wave as well as people confirmed as deceased between previous wave and this wave

datCV_w6<-read_dta("//bfh.ch/data/LFE/G/Research-HE/data/SHARE/rel7-0-0/sharew6_rel7-0-0/sharew6_rel7-0-0_ALL_datasets_stata/sharew6_rel7-0-0_cv_r.dta")
datCV_w6<-datCV_w6 %>% filter(as_factor(datCV_w6$country)=="Switzerland")
datCV_w6<-rbind.data.frame(datCV_w6[datCV_w6$interview==1,],datCV_w6[datCV_w6$interview==2,])#Keep only correspondants of current wave as well as people confirmed as deceased between previous wave and this wave

datCV_w5<-read_dta("//bfh.ch/data/LFE/G/Research-HE/data/SHARE/rel7-0-0/sharew5_rel7-0-0/sharew5_rel7-0-0_ALL_datasets_stata/sharew5_rel7-0-0_cv_r.dta")
datCV_w5<-datCV_w5 %>% filter(as_factor(datCV_w5$country)=="Switzerland")
datCV_w5<-rbind.data.frame(datCV_w5[datCV_w5$interview==1,],datCV_w5[datCV_w5$interview==2,])#Keep only correspondants of current wave as well as people confirmed as deceased between previous wave and this wave

datCV_w4<-read_dta("//bfh.ch/data/LFE/G/Research-HE/data/SHARE/rel7-0-0/sharew4_rel7-0-0/sharew4_rel7-0-0_ALL_datasets_stata/sharew4_rel7-0-0_cv_r.dta")
datCV_w4<-datCV_w4 %>% filter(as_factor(datCV_w4$country)=="Switzerland")
datCV_w4<-rbind.data.frame(datCV_w4[datCV_w4$interview==1,],datCV_w4[datCV_w4$interview==2,])#Keep only correspondants of current wave as well as people confirmed as deceased between previous wave and this wave

###Ommit SHARELIFE
#datCV_w3<-read_dta("//bfh.ch/data/LFE/G/Research-HE/data/SHARE/rel7-0-0/sharew3_rel7-0-0/sharew3_rel7-0-0_ALL_datasets_stata/sharew3_rel7-0-0_cv_r.dta")
#datCV_w3<-datCV_w3 %>% filter(as_factor(datCV_w3$country)=="Switzerland")
#datCV_w3<-rbind.data.frame(datCV_w3[datCV_w3$interview==1,],datCV_w3[datCV_w3$interview==2,])#Keep only correspondants of current wave as well as people confirmed as deceased between previous wave and this wave

datCV_w2<-read_dta("//bfh.ch/data/LFE/G/Research-HE/data/SHARE/rel7-0-0/sharew2_rel7-0-0/sharew2_rel7-0-0_ALL_datasets_stata/sharew2_rel7-0-0_cv_r.dta")
datCV_w2<-datCV_w2 %>% filter(as_factor(datCV_w2$country)=="Switzerland")
datCV_w2<-rbind.data.frame(datCV_w2[datCV_w2$interview==1,],datCV_w2[datCV_w2$interview==2,])#Keep only correspondants of current wave as well as people confirmed as deceased between previous wave and this wave

datCV_w1<-read_dta("//bfh.ch/data/LFE/G/Research-HE/data/SHARE/rel7-0-0/sharew1_rel7-0-0/sharew1_rel7-0-0_ALL_datasets_stata/sharew1_rel7-0-0_cv_r.dta")
datCV_w1<-datCV_w1 %>% filter(as_factor(datCV_w1$country)=="Switzerland")
datCV_w1<-rbind.data.frame(datCV_w1[datCV_w1$interview==1,],datCV_w1[datCV_w1$interview==2,])#Keep only correspondants of current wave as well as people confirmed as deceased between previous wave and this wave










#Construct working database for wave 7
dat_SHARE_ld_w7<-merge(datCF_w7, datHC_w7, by="mergeid",all=TRUE)
dat_SHARE_ld_w7<-merge(datMH_w7,dat_SHARE_ld_w7,by="mergeid",all=TRUE)
dat_SHARE_ld_w7<-merge(datBR_w7,dat_SHARE_ld_w7,by="mergeid",all=TRUE)
dat_SHARE_ld_w7<-merge(datGS_w7,dat_SHARE_ld_w7,by="mergeid",all=TRUE)
dat_SHARE_ld_w7<-merge(datPH_w7,dat_SHARE_ld_w7,by="mergeid",all=TRUE)
dat_SHARE_ld_w7<-merge(datCV_w7,dat_SHARE_ld_w7,by="mergeid",all=TRUE)

#Construct working database for wave 6
dat_SHARE_ld_w6<-merge(datCF_w6, datHC_w6, by="mergeid",all=TRUE)
dat_SHARE_ld_w6<-merge(datMH_w6,dat_SHARE_ld_w6,by="mergeid",all=TRUE)
dat_SHARE_ld_w6<-merge(datBR_w6,dat_SHARE_ld_w6,by="mergeid",all=TRUE)
dat_SHARE_ld_w6<-merge(datGS_w6,dat_SHARE_ld_w6,by="mergeid",all=TRUE)
dat_SHARE_ld_w6<-merge(datPH_w6,dat_SHARE_ld_w6,by="mergeid",all=TRUE)
dat_SHARE_ld_w6<-merge(datCV_w6,dat_SHARE_ld_w6,by="mergeid",all=TRUE)

#Construct working database for wave 5
dat_SHARE_ld_w5<-merge(datCF_w5, datHC_w5, by="mergeid",all=TRUE)
dat_SHARE_ld_w5<-merge(datMH_w5,dat_SHARE_ld_w5,by="mergeid",all=TRUE)
dat_SHARE_ld_w5<-merge(datBR_w5,dat_SHARE_ld_w5,by="mergeid",all=TRUE)
dat_SHARE_ld_w5<-merge(datGS_w5,dat_SHARE_ld_w5,by="mergeid",all=TRUE)
dat_SHARE_ld_w5<-merge(datPH_w5,dat_SHARE_ld_w5,by="mergeid",all=TRUE)
dat_SHARE_ld_w5<-merge(datCV_w5,dat_SHARE_ld_w5,by="mergeid",all=TRUE)

#Construct working database for wave 4
dat_SHARE_ld_w4<-merge(datCF_w4, datHC_w4, by="mergeid",all=TRUE)
dat_SHARE_ld_w4<-merge(datMH_w4,dat_SHARE_ld_w4,by="mergeid",all=TRUE)
dat_SHARE_ld_w4<-merge(datBR_w4,dat_SHARE_ld_w4,by="mergeid",all=TRUE)
dat_SHARE_ld_w4<-merge(datGS_w4,dat_SHARE_ld_w4,by="mergeid",all=TRUE)
dat_SHARE_ld_w4<-merge(datPH_w4,dat_SHARE_ld_w4,by="mergeid",all=TRUE)
dat_SHARE_ld_w4<-merge(datCV_w4,dat_SHARE_ld_w4,by="mergeid",all=TRUE)

#Ommit SHARELIFE
#dat_SHARE_ld_w3<-merge(datCF, datHC, by="mergeid",all=TRUE)
#dat_SHARE_ld_w3<-merge(datMH,dat_SHARE_ld_w3,by="mergeid",all=TRUE)
#dat_SHARE_ld_w3<-merge(datBR,dat_SHARE_ld_w3,by="mergeid",all=TRUE)
#dat_SHARE_ld_w3<-merge(datGS,dat_SHARE_ld_w3,by="mergeid",all=TRUE)
#dat_SHARE_ld_w3<-merge(datPH,dat_SHARE_ld_w3,by="mergeid",all=TRUE)
#dat_SHARE_ld_w3<-merge(datCV,dat_SHARE_ld_w3,by="mergeid",all=TRUE)

#Construct working database for wave 2
dat_SHARE_ld_w2<-merge(datCF_w2, datHC_w2, by="mergeid",all=TRUE)
dat_SHARE_ld_w2<-merge(datMH_w2,dat_SHARE_ld_w2,by="mergeid",all=TRUE)
dat_SHARE_ld_w2<-merge(datBR_w2,dat_SHARE_ld_w2,by="mergeid",all=TRUE)
dat_SHARE_ld_w2<-merge(datGS_w2,dat_SHARE_ld_w2,by="mergeid",all=TRUE)
dat_SHARE_ld_w2<-merge(datPH_w2,dat_SHARE_ld_w2,by="mergeid",all=TRUE)
dat_SHARE_ld_w2<-merge(datCV_w2,dat_SHARE_ld_w2,by="mergeid",all=TRUE)

#Construct working database for wave 1
dat_SHARE_ld_w1<-merge(datCF_w1, datHC_w1, by="mergeid",all=TRUE)
dat_SHARE_ld_w1<-merge(datMH_w1,dat_SHARE_ld_w1,by="mergeid",all=TRUE)
dat_SHARE_ld_w1<-merge(datBR_w1,dat_SHARE_ld_w1,by="mergeid",all=TRUE)
dat_SHARE_ld_w1<-merge(datGS_w1,dat_SHARE_ld_w1,by="mergeid",all=TRUE)
dat_SHARE_ld_w1<-merge(datPH_w1,dat_SHARE_ld_w1,by="mergeid",all=TRUE)
dat_SHARE_ld_w1<-merge(datCV_w1,dat_SHARE_ld_w1,by="mergeid",all=TRUE)

#Construct working database for all waves (excluding SHARELIFE)
l<-list(dat_SHARE_ld_w7,dat_SHARE_ld_w6,dat_SHARE_ld_w5,dat_SHARE_ld_w4,dat_SHARE_ld_w2,dat_SHARE_ld_w1)
dat_SHARE<-rbindlist(l, use.names=TRUE, fill=TRUE)
save(dat_SHARE, file = "dat_SHARE.RData")

detach()
rm(list = ls(all.names = TRUE)) #will clear all objects includes hidden objects.
gc() #free up memrory and report the memory usage.