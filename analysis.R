library(readr)
library(plyr)
library(dplyr)
library(tidyverse)

setwd("~/github/elu_extinct/joy_division/experiment/run_exp/experiment1d/data")

#change to fit data directory
dataset <- ldply(list.files(), read.csv, header=FALSE)

dataset <- dataset[-1,]

dataset<- dataset%>%
 rename(rt= V1,
       trial_type= V3,
       key_press= V7)

relevantdata <- dataset%>%
  select(rt, trial_type, key_press) 

blue <- relevantdata %>% 
  filter(trial_type == 'blue_memory')
yellow <- relevantdata %>% 
  filter(trial_type == 'yellow_memory')
orange <- relevantdata %>% 
  filter(trial_type == 'orange_memory')
pink <- relevantdata %>% 
  filter(trial_type == 'pink_memory')
purple <- relevantdata %>% 
  filter(trial_type == 'purple_memory')
green <- relevantdata %>% 
  filter(trial_type == 'green_memory')

#########################loading trial type groups################################

#types sorted per room
blueOutOfSequence <- blue[c(3,4,14,15,29,30), ] 
yellowOutOfSequence <- yellow[c(9,10,19,20,29,30,40,41), ]
orangeOutOfSequence <- orange[c(5,6,12,13,32,33), ]
pinkOutOfSequence <- pink[c(10,11,21,22,31,32,41,42), ]
purpleOutOfSequence <-purple[c(9,10,20,21,31,32,35,36), ]
greenOutOfSequence <- green[c(2,3,13,14,24,25,32,33), ]

blueHRPE<- blue[c(10,11,21,22,26,27,38,39), ]
yellowHRPE <-yellow [c(2,3,13,14,22,23,33,34), ]
pinkHRPE <-pink [c(7,8,18,19,28,29,35,36), ]
purpleHRPE <-purple [c(6,7,13,14,24,25,41,42), ]
orangeHRPE <-orange [c(2,3,13,14,22,23,33,34), ]
greenHRPE <- green[c(9,10,17,18,26,27,36,37), ]

blueLRPE<- blue[c(6,7,18,19,24,25,32,33,35,36), ] 
yellowLRPE <- yellow[c(6,7,16,17,25,26,36,37), ]
orangeLRPE <- orange[c(6,7,16,17,25,26,36,37), ]
pinkLRPE <- pink[c(4,5,13,14,24,25,38,39), ]
purpleLRPE <- purple[c(3,4,17,18,27,28,38,39), ]
greenLRPE <- green[c(5,6,20,21,29,30,39,40), ]

pinkSingleLRPE <- pink[c(34,40), ]
blueSingleLRPE <- blue[c(8,17), ]
yellowSingleLRPE <- yellow[c(1,12), ]
orangeSingleLRPE <- orange[c(), ]
purpleSingleLRPE <- purple[c(15,23), ]
greenSingleLRPE <-green [c(35,16), ]

yellowSingleHRPE <- yellow[c(27,38), ]
blueSingleHRPE <- blue[c(1,40), ]
orangeSingleHRPE <-orange [c(), ]
pinkSingleHRPE <- pink[c(2,17), ]
purpleSingleHRPE <- purple[c(1,34), ]
greenSingleHRPE <-green [c(11,42), ]

#pairs per room for RT
blueOutOfSequence2 <- blue[c(3,4,14,15,29,30), ] 
yellowOutOfSequence2 <- yellow[c(9,10,19,20,29,30,40,41), ]
orangeOutOfSequence2 <- orange[c(5,6,12,13,32,33), ]
pinkOutOfSequence2 <- pink[c(10,11,21,22,31,32,41,42), ]
purpleOutOfSequence2 <-purple[c(9,10,20,21,31,32,35,36), ]
greenOutOfSequence2 <- green[c(2,3,13,14,24,25,32,33), ]

blueHRPE2<- blue[c(10,11,21,22,26,27,38,39), ]
yellowHRPE2 <-yellow [c(2,3,13,14,22,23,33,34), ]
pinkHRPE2 <-pink [c(7,8,18,19,28,29,35,36), ]
purpleHRPE2 <-purple [c(6,7,13,14,24,25,41,42), ]
orangeHRPE2 <-orange [c(2,3,13,14,22,23,33,34), ]
greenHRPE2 <- green[c(9,10,17,18,26,27,36,37), ]

blueLRPE2<- blue[c(6,7,18,19,24,25,32,33,35,36), ] 
yellowLRPE2 <- yellow[c(6,7,16,17,25,26,36,37), ]
orangeLRPE2 <- orange[c(6,7,16,17,25,26,36,37), ]
pinkLRPE2 <- pink[c(4,5,13,14,24,25,38,39), ]
purpleLRPE2 <- purple[c(3,4,17,18,27,28,38,39), ]
greenLRPE2 <- green[c(5,6,20,21,29,30,39,40), ]

pinkSingleLRPE2 <- pink[c(34,40), ]
blueSingleLRPE2 <- blue[c(8,17), ]
yellowSingleLRPE2 <- yellow[c(1,12), ]
orangeSingleLRPE2 <- orange[c(), ]
purpleSingleLRPE2 <- purple[c(15,23), ]
greenSingleLRPE2 <-green [c(35,16), ]

yellowSingleHRPE2 <- yellow[c(27,38), ]
blueSingleHRPE2 <- blue[c(1,40), ]
orangeSingleHRPE2 <-orange [c(), ]
pinkSingleHRPE2 <- pink[c(2,17), ]
purpleSingleHRPE2 <- purple[c(1,34), ]
greenSingleHRPE2 <-green [c(11,42), ]

#all images per room
CollectivebluePairs <- blue[c(3,4,14,15,29,30,10,11,21,22,26,27,38,39, 6,7,18,19,24,25,32,33,35,36), ] 
CollectiveblueSingles <- blue[c(8,17,1,40), ]

CollectiveyellowPairs <- yellow[c(9,10,19,20,29,30,40,41,2,3,13,14,22,23,33,34,6,7,16,17,25,26,36,37), ]
CollectiveyellowSingles <- yellow[c(1,12,27,38), ]

CollectiveorangePairs <- orange[c(5,6,12,13,32,33,2,3,13,14,22,23,33,34,6,7,16,17,25,26,36,37), ]
CollectiveorangeSingles <- orange[c(7,22,28,38), ] #check placements and if repeating nums to remove

CollectivepinkPairs <- pink[c(10,11,21,22,31,32,41,42,7,8,18,19,28,29,35,36,4,5,13,14,24,25,38,39), ]
CollectivepinkSingles <-pink [c(2,17,34,40), ]

CollectivepurplePairs <-purple[c(9,10,20,21,31,32,35,36,6,7,13,14,24,25,41,42,3,4,17,18,27,28,38,39), ]
CollectivepurpleSingles <-purple [c(1,34,15,23), ]

CollectivegreenPairs <- green[c(2,3,13,14,24,25,32,33,9,10,17,18,26,27,36,37,5,6,20,21,29,30,39,40), ]
CollectivegreenSingles <- green[c(11,42,35,16), ]

#grouped by image type, all rooms
AllOutOfSequence <- rbind(blueOutOfSequence, yellowOutOfSequence,orangeOutOfSequence,pinkOutOfSequence,purpleOutOfSequence,greenOutOfSequence)

AllHRPE <- rbind(blueHRPE, yellowHRPE, pinkHRPE, purpleHRPE, orangeHRPE, greenHRPE)

AllLRPE <- rbind(blueLRPE, yellowLRPE,orangeLRPE,pinkLRPE, purpleLRPE, greenLRPE)

AllSingleLRPE <- rbind(pinkSingleLRPE,blueSingleLRPE,yellowSingleLRPE,orangeSingleLRPE,purpleSingleLRPE,greenSingleLRPE)

AllSingleHRPE <- rbind(pinkSingleHRPE,blueSingleHRPE,yellowSingleHRPE,orangeSingleHRPE,purpleSingleHRPE,greenSingleHRPE)

#################ALL ROOMS AND IMAGE TYPES: HIT RATES#####################

AllMemTrialPairs <- rbind(CollectiveyellowPairs, CollectiveorangePairs, CollectivebluePairs, CollectivepinkPairs, CollectivepurplePairs, CollectivegreenPairs)

#hit rates
AllMemTrialPairs[AllMemTrialPairs == '78'] <- "NA"  

AllMemTrialPairsOdds <- AllMemTrialPairs%>%
  filter(row_number() %% 2 == 1) 
AllMemTrialPairsOdds <- AllMemTrialPairsOdds %>% #prime
  dplyr::mutate(id = row_number())

AllMemTrialPairsEvens <- AllMemTrialPairs%>%
  filter(row_number() %% 2 == 0) 
AllMemTrialPairsEvens <- AllMemTrialPairsEvens %>% #primed
  dplyr:: mutate(id = row_number())

AllMemTrialPairsAll <-merge(AllMemTrialPairsOdds, AllMemTrialPairsEvens, by ="id")
AllMemTrialPairsAll <- AllMemTrialPairsAll %>%
  filter(key_press.x == '79') #prime correctly identified

AllMemTrialPairsPrime <- AllMemTrialPairsAll %>%
  select(rt.x, trial_type.x, key_press.x) 

AllMemTrialPairsPrimed <- AllMemTrialPairsAll %>% 
  select(rt.y, trial_type.y, key_press.y)

AllMemTrialPairsTotal <- nrow(AllMemTrialPairsPrimed)
AllMemTrialPairsPrimedHits<-AllMemTrialPairsPrimed[(AllMemTrialPairsPrimed$key_press=="79"),] 
AllMemTrialPairsNumHits <- nrow(AllMemTrialPairsPrimedHits) 
AllMemTrialPairsHitRate <- AllMemTrialPairsNumHits/AllMemTrialPairsTotal
AllMemTrialPairsNumMiss <- AllMemTrialPairsTotal - AllMemTrialPairsNumHits
AllMemTrialPairsMissRate <- AllMemTrialPairsNumMiss/AllMemTrialPairsTotal

AllMemTrialSingles <- rbind(CollectiveyellowSingles, CollectiveorangeSingles, CollectiveblueSingles, CollectivepinkSingles, CollectivepurpleSingles, CollectivegreenSingles)
AllMemTrialSingles[AllMemTrialSingles == '78'] <- "NA" 
AllMemTrialSinglesTotal <- nrow(AllMemTrialSingles)
AllMemTrialSinglesHits<-AllMemTrialSingles[(AllMemTrialSingles$key_press=="79"),] 
AllMemTrialSinglesNumHits <- nrow(AllMemTrialSinglesHits) 
AllMemTrialSinglesHitRate <- AllMemTrialSinglesNumHits/AllMemTrialSinglesTotal
AllMemTrialSinglesNumMiss <- AllMemTrialSinglesTotal - AllMemTrialSinglesNumHits
AllMemTrialSinglesMissRate <- AllMemTrialSinglesNumMiss/AllMemTrialSinglesTotal

AllMemTrialSinglesAndPrimedTotal <- AllMemTrialPairsTotal+AllMemTrialSinglesTotal
AllMemTrialSinglesAndPrimedNumHits <-  AllMemTrialPairsNumHits+AllMemTrialSinglesNumHits
AllMemTrialSinglesAndPrimedHitRate <- AllMemTrialSinglesAndPrimedNumHits/AllMemTrialSinglesAndPrimedTotal
AllMemTrialSinglesAndPrimedNumMiss <- AllMemTrialSinglesAndPrimedTotal - AllMemTrialSinglesAndPrimedNumHits
AllMemTrialSinglesAndPrimedMissRate <- AllMemTrialSinglesAndPrimedNumMiss/AllMemTrialSinglesAndPrimedTotal

AllMemTrialNoCriteriaPairsTotal<- nrow(AllMemTrialPairs) 
AllMemTrialNoCriteriaPairsHits<-AllMemTrialPairs[(AllMemTrialPairs$key_press=="79"),] 
AllMemTrialNoCriteriaPairsNumHits<- nrow(AllMemTrialNoCriteriaPairsHits)
AllMemTrialNoCriteriaPairsHitRate<- AllMemTrialNoCriteriaPairsNumHits/AllMemTrialNoCriteriaPairsTotal

AllMemTrialNoCriteriaTotal<- AllMemTrialNoCriteriaPairsTotal + AllMemTrialSinglesTotal
AllMemTrialNoCriteriaNumHits<-AllMemTrialNoCriteriaPairsNumHits+AllMemTrialSinglesNumHits
AllMemTrialNoCriteriaHitRate<- AllMemTrialNoCriteriaNumHits/AllMemTrialNoCriteriaTotal

#
#RT
#

AllMemTrialPairsRTOdds <- AllMemTrialPairs%>%#CRITERIA 
  filter(row_number() %% 2 == 1) 
AllMemTrialPairsOdds <- AllMemTrialPairsOdds %>% #prime
  dplyr::  mutate(id = row_number())

AllMemTrialPairsEvens <- AllMemTrialPairs%>%
  filter(row_number() %% 2 == 0) 
AllMemTrialPairsEvens <- AllMemTrialPairsEvens %>% #primed
  dplyr::  mutate(id = row_number())

AllMemTrialPairsAll <- merge(AllMemTrialPairsOdds, AllMemTrialPairsEvens, by = 'id')

AllMemTrialPairsAll <- AllMemTrialPairsAll %>%  
  filter(key_press.x == '79',
         key_press.y == '79') 

AllMemTrialPairsPrime2 <- AllMemTrialPairsAll%>%
  select(rt.x, trial_type.x, key_press.x) 
AllMemTrialPairsPrime2 <- AllMemTrialPairsPrime2%>%
  rename( rt = rt.x,
          trial_type =trial_type.x, 
          key_press=key_press.x)

AllMemTrialPairsPrimeRT <- as.numeric(AllMemTrialPairsPrime2$rt)
AllMemTrialPairsPrimeRT <- log(AllMemTrialPairsPrimeRT)

AllMemTrialPairsPrimed2 <- AllMemTrialPairsAll %>% 
  select(rt.y, trial_type.y, key_press.y)
AllMemTrialPairsPrimed2 <- AllMemTrialPairsPrimed2%>%
  rename( rt = rt.y,
          trial_type =trial_type.y, 
          key_press=key_press.y)

AllMemTrialPairsPrimedRT <- as.numeric(AllMemTrialPairsPrimed2$rt)
AllMemTrialPairsPrimedRT <- log(AllMemTrialPairsPrimedRT)

AllMemTrialPairsPrimedRTZscore <-(AllMemTrialPairsPrimedRT-OverallRTMean)/OverallRTsd

AllMemTrialSingles2 <- AllMemTrialSingles%>%
  filter( key_press== '79') 
AllMemTrialSinglesRT <- as.numeric(AllMemTrialSingles2$rt)
AllMemTrialSinglesRT <- log(AllMemTrialSinglesRT)



#no criteria
AllMemTrialNoCriteriaPairsAndSinglesRT<- rbind(AllMemTrialSingles2, AllMemTrialPairs)
AllMemTrialNoCriteriaPairsAndSinglesRT <- AllMemTrialNoCriteriaPairsAndSinglesRT %>%
  filter(key_press == '79')
AllMemTrialNoCriteriaPairsAndSinglesRTTotal <- nrow(AllMemTrialNoCriteriaPairsAndSinglesRT)
AllMemTrialNoCriteriaPairsAndSinglesRT <- as.numeric(AllMemTrialNoCriteriaPairsAndSinglesRT$rt)
AllMemTrialNoCriteriaPairsAndSinglesRT <- log( AllMemTrialNoCriteriaPairsAndSinglesRT)

OverallRTMean <- mean(AllMemTrialNoCriteriaPairsAndSinglesRT)
OverallRTsd <- sd(AllMemTrialNoCriteriaPairsAndSinglesRT)

AllMemTrialPairsPrimeRTZscore <-(AllMemTrialPairsPrimeRT-OverallRTMean)/OverallRTsd
AllMemTrialPairsPrimedRTZscore <-(AllMemTrialPairsPrimedRT-OverallRTMean)/OverallRTsd

AllMemTrialSinglesRTZscore <-(AllMemTrialSinglesRT-OverallRTMean)/OverallRTsd

AllMemTrialNoCriteriaPairsAndSinglesRTZscore <-(AllMemTrialNoCriteriaPairsAndSinglesRT-OverallRTMean)/OverallRTsd

##################GROUPED BY TYPES, ALL ROOMS INCLUDED##################

#AllOutOfSequence

AllOutOfSequence[AllOutOfSequence == '78'] <- "NA"  

AllOutOfSequenceOdds <- AllOutOfSequence%>%
  filter(row_number() %% 2 == 1) 
AllOutOfSequenceOdds <- AllMemTrialPairsOdds %>% #prime
  dplyr::  mutate(id = row_number())

AllOutOfSequenceEvens <- AllOutOfSequence%>%
  filter(row_number() %% 2 == 0) 
AllOutOfSequenceEvens <- AllOutOfSequenceEvens %>% #primed
  dplyr::mutate(id = row_number())

AllOutOfSequenceAll <- merge(AllOutOfSequenceOdds, AllOutOfSequenceEvens, by = 'id')

AllOutOfSequenceAllfiltered <- AllOutOfSequenceAll %>%
  filter(key_press.x == '79') 

AllOutOfSequencePrime <- AllOutOfSequenceAllfiltered %>%
  select(rt.x, trial_type.x, key_press.x) 

AllOutOfSequencePrimed <- AllOutOfSequenceAllfiltered %>% 
  select(rt.y, trial_type.y, key_press.y)

AllOutOfSequenceTotal <- nrow(AllOutOfSequencePrimed)
AllOutOfSequencePrimedHits<-AllOutOfSequencePrimed[(AllOutOfSequencePrimed$key_press.y=="79"),] 
AllOutOfSequenceNumHits <- nrow(AllOutOfSequencePrimedHits) 
AllOutOfSequenceHitRate <- AllOutOfSequenceNumHits/AllOutOfSequenceTotal
AllOutOfSequenceNumMiss <- AllOutOfSequenceTotal - AllOutOfSequenceNumHits
AllOutOfSequenceMissRate <- AllOutOfSequenceNumMiss/AllOutOfSequenceTotal


#AllHRPE

AllHRPE[AllHRPE == '78'] <- "NA"  

AllHRPEOdds <- AllHRPE%>%
  filter(row_number() %% 2 == 1) 
AllHRPEOdds <- AllHRPEOdds %>% #prime
  dplyr::  mutate(id = row_number())

AllHRPEEvens <- AllHRPE%>%
  filter(row_number() %% 2 == 0) 
AllHRPEEvens <- AllHRPEEvens %>% #primed
  dplyr::  mutate(id = row_number())

AllHRPEAll <- merge(AllHRPEOdds, AllHRPEEvens, by ="id")

AllHRPEAll <- AllHRPEAll %>%
  filter(key_press.x == '79') 

AllHRPEPrime <- AllHRPEAll %>%
  select(rt.x, trial_type.x, key_press.x) 

AllHRPEPrimed <- AllHRPEAll %>% 
  select(rt.y, trial_type.y, key_press.y)

AllHRPETotal <- nrow(AllHRPEPrimed)
AllHRPEPrimedHits<-AllHRPEPrimed[(AllHRPEPrimed$key_press.y=="79"),] 
AllHRPENumHits <- nrow(AllHRPEPrimedHits) 
AllHRPEHitRate <- AllHRPENumHits/AllHRPETotal
AllHRPENumMiss <- AllHRPETotal - AllHRPENumHits
AllHRPEMissRate <- AllHRPENumMiss/AllHRPETotal

#AllLRPE

AllLRPE[AllLRPE == '78'] <- "NA"  

AllLRPEOdds <- AllLRPE%>%
  filter(row_number() %% 2 == 1) 
AllLRPEOdds <- AllLRPEOdds %>% #prime
  dplyr::  mutate(id = row_number())

AllLRPEEvens <- AllLRPE%>%
  filter(row_number() %% 2 == 0) 
AllLRPEEvens <- AllLRPEEvens %>% #primed
  dplyr::  mutate(id = row_number())

AllLRPEAll <- merge(AllLRPEOdds, AllLRPEEvens, by ="id")
AllLRPEAll <- AllLRPEAll %>%
  filter(key_press.x == '79') 

AllLRPEPrime <- AllLRPEAll %>%
  select(rt.x, trial_type.x, key_press.x) 

AllLRPEPrimed <- AllLRPEAll %>% 
  select(rt.y, trial_type.y, key_press.y)

AllLRPETotal <- nrow(AllLRPEPrimed)
AllLRPEPrimedHits<-AllLRPEPrimed[(AllLRPEPrimed$key_press.y=="79"),] 
AllLRPENumHits <- nrow(AllLRPEPrimedHits) 
AllLRPEHitRate <- AllLRPENumHits/AllLRPETotal
AllLRPENumMiss <- AllLRPETotal - AllLRPENumHits
AllLRPEMissRate <- AllLRPENumMiss/AllLRPETotal

#AllSingleLRPE

AllSingleLRPE[AllSingleLRPE == '78'] <- "NA" 
AllSingleLRPETotal <- nrow(AllSingleLRPE)
AllSingleLRPEHits<-AllSingleLRPE[(AllSingleLRPE$key_press=="79"),] 
AllSingleLRPENumHits <- nrow(AllSingleLRPEHits) 
AllSingleLRPEHitRate <- AllSingleLRPENumHits/AllSingleLRPETotal
AllSingleLRPENumMiss <- AllSingleLRPETotal - AllSingleLRPENumHits
AllSingleLRPEMissRate <- AllSingleLRPENumMiss/AllSingleLRPETotal

#AllSingleHRPE

AllSingleHRPE[AllSingleHRPE == '78'] <- "NA" 
AllSingleHRPETotal <- nrow(AllSingleHRPE)
AllSingleHRPEHits<-AllSingleHRPE[(AllSingleHRPE$key_press=="79"),] 
AllSingleHRPENumHits <- nrow(AllSingleHRPEHits) 
AllSingleHRPEHitRate <- AllSingleHRPENumHits/AllSingleHRPETotal
AllSingleHRPENumMiss <- AllSingleHRPETotal - AllSingleHRPENumHits
AllSingleHRPEMissRate <- AllSingleHRPENumMiss/AllSingleHRPETotal

#################ALL ROOMS AND IMAGE TYPES: RTs#####################
#Out of sequence
AllOutOfSequenceCorrectPrimeAndPrimed <- AllOutOfSequenceAll %>%
  filter(key_press.x == '79',
         key_press.y == '79') 

AllOutOfSequencePrime2<- AllOutOfSequenceCorrectPrimeAndPrimed %>%
  select(rt.x, trial_type.x, key_press.x) 
AllOutOfSequencePrimeRT <- as.numeric(AllOutOfSequencePrime2$rt.x)
AllOutOfSequencePrimeRT <- log(AllOutOfSequencePrimeRT)

AllOutOfSequencePrimed2 <- AllOutOfSequenceCorrectPrimeAndPrimed %>% 
  select(rt.y, trial_type.y, key_press.y)
AllOutOfSequencePrimedRT <- as.numeric(AllOutOfSequencePrimed2$rt.y)
AllOutOfSequencePrimedRT <- log(AllOutOfSequencePrimedRT)

AllOutOfSequencePrimeRTZscore <- (AllOutOfSequencePrimeRT-OverallRTMean)/OverallRTsd

AllOutOfSequencePrimedRTZscore <- (AllOutOfSequencePrimedRT-OverallRTMean)/OverallRTsd

#All HRPE

AllHRPECorrectPrimeAndPrimed <- AllHRPEAll %>%
  filter(key_press.x == '79',
         key_press.y == '79') 

AllHRPEPrime2<- AllHRPECorrectPrimeAndPrimed %>%
  select(rt.x, trial_type.x, key_press.x) 
AllHRPEPrimeRT <- as.numeric(AllHRPEPrime2$rt.x)
AllHRPEPrimeRT <- log(AllHRPEPrimeRT)

AllHRPEPrimed2 <- AllHRPECorrectPrimeAndPrimed %>% 
  select(rt.y, trial_type.y, key_press.y)
AllHRPEPrimedRT <- as.numeric(AllHRPEPrimed2$rt.y)
AllHRPEPrimedRT <- log(AllHRPEPrimedRT)

AllHRPEPrimedRTZscore <- (AllHRPEPrimedRT-OverallRTMean)/OverallRTsd
AllHRPEPrimeRTZscore <- (AllHRPEPrimeRT-OverallRTMean)/OverallRTsd

#LRPE
AllLRPECorrectPrimeAndPrimed <- AllLRPEAll %>%
  filter(key_press.x == '79',
         key_press.y =='79') 

AllLRPEPrime2<- AllLRPECorrectPrimeAndPrimed %>%
  select(rt.x, trial_type.x, key_press.x) 
AllLRPEPrimeRT <- as.numeric(AllLRPEPrime2$rt.x)
AllLRPEPrimeRT <- log(AllLRPEPrimeRT)

AllLRPEPrimed2 <- AllLRPECorrectPrimeAndPrimed %>% 
  select(rt.y, trial_type.y, key_press.y)
AllLRPEPrimedRT <- as.numeric(AllLRPEPrimed2$rt.y)
AllLRPEPrimedRT <- log(AllLRPEPrimedRT)

AllLRPEPrimedRTZscore <- (AllLRPEPrimedRT-OverallRTMean)/OverallRTsd
AllLRPEPrimeRTZscore <- (AllLRPEPrimeRT-OverallRTMean)/OverallRTsd

#Lrpe single RT

AllSingleLRPEHits <- AllSingleLRPE%>%
  filter(key_press == '79')
AllSingleLRPEHitsRT <- as.numeric(AllSingleLRPEHits$rt)
AllSingleLRPEHitsRT <- log( AllSingleLRPEHitsRT)
AllSingleLRPEHitsRTZscore <- (AllSingleLRPEHitsRT-OverallRTMean)/OverallRTsd

#Hrpe single
AllSingleHRPEHits <- AllSingleHRPE%>%
  filter(key_press == '79')
AllSingleHRPEHitsRT <- as.numeric(AllSingleHRPEHits$rt)
AllSingleHRPEHitsRT <- log(AllSingleHRPEHitsRT)
AllSingleHRPEHitsRTZscore <- (AllSingleHRPEHitsRT-OverallRTMean)/OverallRTsd

##################ROOM/TYPE SPECIFIC HR AND RT: BLUE####################

#hit rates

blueLRPE[blueLRPE == '78'] <- "NA" #LRPE HIT RATES

blueLRPEOdds <- blueLRPE%>%
  filter(row_number() %% 2 == 1) 
blueLRPEOdds <- blueLRPEOdds %>% 
  dplyr:: mutate(id = row_number())

blueLRPEEvens <- blueLRPE%>%
  filter(row_number() %% 2 == 0) 
blueLRPEEvens <- blueLRPEEvens %>% 
  dplyr::  mutate(id = row_number())

blueLRPEAll <- merge(blueLRPEOdds, blueLRPEEvens, by ="id")
blueLRPEAll <- blueLRPEAll %>%
  filter(key_press.x == '79')

blueLRPEPrime <- blueLRPEAll %>%
  select(rt.x, trial_type.x, key_press.x) 

blueLRPEPrimed <- blueLRPEAll %>% 
  select(rt.y, trial_type.y, key_press.y)

blueLRPETotal <- nrow(blueLRPEPrimed) 
blueLRPEPrimedHits<-blueLRPEPrimed[(blueLRPEPrimed$key_press.y=="79"),] 
blueLRPENumHits <- nrow(blueLRPEPrimedHits) 
blueLRPEHitRate <- blueLRPENumHits/blueLRPETotal
blueLRPENumMiss <- blueLRPETotal - blueLRPENumHits
blueLRPEMissRate <- blueLRPENumMiss/blueLRPETotal

blueHRPE[blueHRPE == '78'] <- "NA" #HRPE hit rates

blueHRPEOdds <- blueHRPE%>%
  filter(row_number() %% 2 == 1) 
blueHRPEOdds <- blueHRPEOdds %>% 
  dplyr::  mutate(id = row_number())

blueHRPEEvens <- blueHRPE%>%
  filter(row_number() %% 2 == 0)  
blueHRPEEvens <- blueHRPEEvens %>% 
  dplyr::  mutate(id = row_number())

blueHRPEAll <-merge(blueHRPEOdds, blueHRPEEvens, by ="id")
blueHRPEAll <- blueHRPEAll %>%
  filter(key_press.x == '79')

blueHRPEPrime <- blueHRPEAll %>%
  select(rt.x, trial_type.x, key_press.x) 

blueHRPEPrimed <- blueHRPEAll %>% 
  select(rt.y, trial_type.y, key_press.y)

blueHRPETotal <- nrow(blueHRPEPrimed)
blueHRPEPrimedHits<-blueHRPEPrimed[(blueHRPEPrimed$key_press.y=="79"),] 
blueHRPENumHits <- nrow(blueHRPEPrimedHits) 
blueHRPEHitRate <- blueHRPENumHits/blueHRPETotal
blueHRPENumMiss <- blueHRPETotal - blueHRPENumHits
blueHRPEMissRate <- blueHRPENumMiss/blueHRPETotal

blueOutOfSequence[blueOutOfSequence == '78'] <- "NA" #out of sequence hit rates

blueOutOfSequenceOdds <- blueOutOfSequence%>%
  filter(row_number() %% 2 == 1) 
blueOutOfSequenceOdds <- blueOutOfSequenceOdds %>% 
  dplyr::  mutate(id = row_number())

blueOutOfSequenceEvens <- blueOutOfSequence%>%
  filter(row_number() %% 2 == 0) 
blueOutOfSequenceEvens <- blueOutOfSequenceEvens %>% 
  dplyr::  mutate(id = row_number())

blueOutOfSequenceAll <- merge(blueOutOfSequenceOdds, blueOutOfSequenceEvens, by ="id")
blueOutOfSequenceAll <- blueOutOfSequenceAll %>%
  filter(key_press.x == '79')

blueOutOfSequencePrime <- blueOutOfSequenceAll %>%
  select(rt.x, trial_type.x, key_press.x) 

blueOutOfSequencePrimed <- blueOutOfSequenceAll %>% 
  select(rt.y, trial_type.y, key_press.y)

blueOutOfSequenceTotal <- nrow(blueOutOfSequencePrimed)
blueOutOfSequencePrimedHits<-blueOutOfSequencePrimed[(blueOutOfSequencePrimed$key_press.y=="79"),] 
blueOutOfSequenceNumHits <- nrow(blueOutOfSequencePrimedHits) 
blueOutOfSequenceHitRate <- blueOutOfSequenceNumHits/blueOutOfSequenceTotal
blueOutOfSequenceNumMiss <- blueOutOfSequenceTotal - blueOutOfSequenceNumHits
blueOutOfSequenceMissRate <- blueOutOfSequenceNumMiss/blueOutOfSequenceTotal

blueSingleLRPE[blueSingleLRPE == '78'] <- "NA" #single lrpe Hit Rates
blueSingleLRPETotal <- nrow(blueSingleLRPE)
blueSingleLRPEHits<-blueSingleLRPE[(blueSingleLRPE$key_press=="79"),] 
blueSingleLRPENumHits <- nrow(blueSingleLRPEHits) 
blueSingleLRPEHitRate <- blueSingleLRPENumHits/blueSingleLRPETotal
blueSingleLRPENumMiss <- blueSingleLRPETotal - blueSingleLRPENumHits
blueSingleLRPEMissRate <- blueSingleLRPENumMiss/blueSingleLRPETotal

blueSingleHRPE[blueSingleHRPE == '78'] <- "NA" #single hrpe hit rates
blueSingleHRPETotal <- nrow(blueSingleHRPE)
blueSingleHRPEHits<-blueSingleHRPE[(blueSingleHRPE$key_press=="79"),] 
blueSingleHRPENumHits <- nrow(blueSingleHRPEHits) 
blueSingleHRPEHitRate <- blueSingleHRPENumHits/blueSingleHRPETotal
blueSingleHRPENumMiss <- blueSingleHRPETotal - blueSingleHRPENumHits
blueSingleHRPEMissRate <- blueSingleHRPENumMiss/blueSingleHRPETotal
#        
#RT
#
blueLRPE2[blueLRPE2 == '78'] <- "NA"   #LRPE RTs

blueLRPEOdds2 <- blueLRPE2%>%
  filter(row_number() %% 2 == 1) 
blueLRPEOdds2 <- blueLRPEOdds2 %>% 
  dplyr::  mutate(id = row_number())

blueLRPEEvens2 <- blueLRPE2%>%
  filter(row_number() %% 2 == 0) 
blueLRPEEvens2 <- blueLRPEEvens2 %>% 
  dplyr::  mutate(id = row_number())

blueLRPEAll2 <- merge(blueLRPEOdds2, blueLRPEEvens2, by ="id")

blueLRPEAll2 <- blueLRPEAll2 %>%
  filter(key_press.x == '79', 
         key_press.y == '79')

blueLRPEPrime2 <- blueLRPEAll2 %>%
  select(rt.x, trial_type.x, key_press.x) 

blueLRPEPrimeRT <- as.numeric(blueLRPEPrime2$rt.x)
blueLRPEPrimeRT <- log( blueLRPEPrimeRT)

blueLRPEPrimed2 <- blueLRPEAll2 %>% 
  select(rt.y, trial_type.y, key_press.y)

blueLRPEPrimedRT <- as.numeric(blueLRPEPrimed2$rt.y) 
blueLRPEPrimedRT <- log( blueLRPEPrimedRT) 

blueLRPERTZscore <- (blueLRPEPrimedRT-OverallRTMean)/OverallRTsd  

blueHRPE2[blueHRPE2 == '78'] <- "NA"   #HRPE RTs

blueHRPEOdds2 <- blueHRPE2%>%
  filter(row_number() %% 2 == 1) 
blueHRPEOdds2 <- blueHRPEOdds2 %>% 
  dplyr::  mutate(id = row_number())

blueHRPEEvens2 <- blueHRPE2%>%
  filter(row_number() %% 2 == 0) 
blueHRPEEvens2 <- blueHRPEEvens2 %>% 
  dplyr::  mutate(id = row_number())

blueHRPEAll2 <- merge(blueHRPEOdds2, blueHRPEEvens2, by ="id")

blueHRPEAll2 <- blueHRPEAll2 %>%
  filter(key_press.x == '79', 
         key_press.y == '79')

blueHRPEPrime2 <- blueHRPEAll2 %>%
  select(rt.x, trial_type.x, key_press.x) 

blueHRPEPrimeRT <- as.numeric(blueHRPEPrime2$rt.x)
blueHRPEPrimeRT <- log(blueHRPEPrimeRT)

blueHRPEPrimed2 <- blueHRPEAll2 %>% 
  select(rt.y, trial_type.y, key_press.y)

blueHRPEPrimedRT <- as.numeric(blueHRPEPrimed2$rt.y) 
blueHRPEPrimedRT <- log(blueHRPEPrimedRT) 

blueHRPERTZscore <- (blueHRPEPrimedRT-OverallRTMean)/OverallRTsd  

blueOutOfSequence2[blueOutOfSequence2 == '78'] <- "NA"   #OutOfSequence RTs

blueOutOfSequenceOdds2 <- blueOutOfSequence2%>%
  filter(row_number() %% 2 == 1) 
blueOutOfSequenceOdds2 <- blueOutOfSequenceOdds2 %>% 
  dplyr::  mutate(id = row_number())

blueOutOfSequenceEvens2 <- blueOutOfSequence2%>%
  filter(row_number() %% 2 == 0) 
blueOutOfSequenceEvens2 <- blueOutOfSequenceEvens2 %>% 
  dplyr::  mutate(id = row_number())

blueOutOfSequenceAll2 <- merge(blueOutOfSequenceOdds2, blueOutOfSequenceEvens2, by ="id")
blueOutOfSequenceAll2 <- blueOutOfSequenceAll2 %>%
  filter(key_press.x == '79', 
         key_press.y == '79')

blueOutOfSequencePrime2 <- blueOutOfSequenceAll2 %>%
  select(rt.x, trial_type.x, key_press.x) 

blueOutOfSequencePrimeRT <- as.numeric(blueOutOfSequencePrime2$rt.x)
blueOutOfSequencePrimeRT <- log( blueOutOfSequencePrimeRT)

blueOutOfSequencePrimed2 <- blueOutOfSequenceAll2 %>% 
  select(rt.y, trial_type.y, key_press.y)

blueOutOfSequencePrimedRT <- as.numeric(blueOutOfSequencePrimed2$rt.y)
blueOutOfSequencePrimedRT <- log( blueOutOfSequencePrimedRT) 

blueOutOfSequenceRTZscore <- (blueOutOfSequencePrimedRT-OverallRTMean)/OverallRTsd  

blueSingleLRPE2[blueSingleLRPE2 == '78'] <- "NA"   #SingleLRPE RTs
blueSingleLRPEAll2 <- blueSingleLRPE2 %>%
  filter(key_press == '79')
blueSingleLRPERT <- as.numeric(blueSingleLRPEAll2$rt)
blueSingleLRPERT <- log(blueSingleLRPERT)

blueSingleLRPERTZscore <- (blueSingleLRPERT-OverallRTMean)/OverallRTsd  

blueSingleHRPE2[blueSingleHRPE2 == '78'] <- "NA"   #SingleHRPE RTs
blueSingleHRPEAll2 <- blueSingleHRPE2 %>%
  filter(key_press == '79')
blueSingleHRPERT <- as.numeric(blueSingleHRPEAll2$rt)
blueSingleHRPERT <- log( blueSingleHRPERT)

blueSingleHRPERTZscore <- (blueSingleHRPERT-OverallRTMean)/OverallRTsd  

##################ROOM/TYPE SPECIFIC HR AND RT: yellow####################

#hit rates

yellowLRPE[yellowLRPE == '78'] <- "NA" #LRPE HIT RATES

yellowLRPEOdds <- yellowLRPE%>%
  filter(row_number() %% 2 == 1) 
yellowLRPEOdds <- yellowLRPEOdds %>% 
  dplyr::  mutate(id = row_number())

yellowLRPEEvens <- yellowLRPE%>%
  filter(row_number() %% 2 == 0) 
yellowLRPEEvens <- yellowLRPEEvens %>% 
  dplyr::  mutate(id = row_number())

yellowLRPEAll <- merge(yellowLRPEOdds, yellowLRPEEvens, by ="id")
yellowLRPEAll <- yellowLRPEAll %>%
  filter(key_press.x == '79')

yellowLRPEPrime <- yellowLRPEAll %>%
  select(rt.x, trial_type.x, key_press.x) 

yellowLRPEPrimed <- yellowLRPEAll %>% 
  select(rt.y, trial_type.y, key_press.y)

yellowLRPETotal <- nrow(yellowLRPEPrimed) 
yellowLRPEPrimedHits<-yellowLRPEPrimed[(yellowLRPEPrimed$key_press.y=="79"),] 
yellowLRPENumHits <- nrow(yellowLRPEPrimedHits) 
yellowLRPEHitRate <- yellowLRPENumHits/yellowLRPETotal
yellowLRPENumMiss <- yellowLRPETotal - yellowLRPENumHits
yellowLRPEMissRate <- yellowLRPENumMiss/yellowLRPETotal

yellowHRPE[yellowHRPE == '78'] <- "NA" #HRPE hit rates

yellowHRPEOdds <- yellowHRPE%>%
  filter(row_number() %% 2 == 1) 
yellowHRPEOdds <- yellowHRPEOdds %>% 
  dplyr::  mutate(id = row_number())

yellowHRPEEvens <- yellowHRPE%>%
  filter(row_number() %% 2 == 0)  
yellowHRPEEvens <- yellowHRPEEvens %>% 
  dplyr::  mutate(id = row_number())

yellowHRPEAll <- merge(yellowHRPEOdds, yellowHRPEEvens, by ="id")
yellowHRPEAll <- yellowHRPEAll %>%
  filter(key_press.x == '79')

yellowHRPEPrime <- yellowHRPEAll %>%
  select(rt.x, trial_type.x, key_press.x) 

yellowHRPEPrimed <- yellowHRPEAll %>% 
  select(rt.y, trial_type.y, key_press.y)

yellowHRPETotal <- nrow(yellowHRPEPrimed)
yellowHRPEPrimedHits<-yellowHRPEPrimed[(yellowHRPEPrimed$key_press.y=="79"),] 
yellowHRPENumHits <- nrow(yellowHRPEPrimedHits) 
yellowHRPEHitRate <- yellowHRPENumHits/yellowHRPETotal
yellowHRPENumMiss <- yellowHRPETotal - yellowHRPENumHits
yellowHRPEMissRate <- yellowHRPENumMiss/yellowHRPETotal

yellowOutOfSequence[yellowOutOfSequence == '78'] <- "NA" #out of sequence hit rates

yellowOutOfSequenceOdds <- yellowOutOfSequence%>%
  filter(row_number() %% 2 == 1) 
yellowOutOfSequenceOdds <- yellowOutOfSequenceOdds %>% 
  dplyr::  mutate(id = row_number())

yellowOutOfSequenceEvens <- yellowOutOfSequence%>%
  filter(row_number() %% 2 == 0) 
yellowOutOfSequenceEvens <- yellowOutOfSequenceEvens %>% 
  dplyr::  mutate(id = row_number())

yellowOutOfSequenceAll <- merge(yellowOutOfSequenceOdds, yellowOutOfSequenceEvens, by ="id")
yellowOutOfSequenceAll <- yellowOutOfSequenceAll %>%
  filter(key_press.x == '79')

yellowOutOfSequencePrime <- yellowOutOfSequenceAll %>%
  select(rt.x, trial_type.x, key_press.x) 

yellowOutOfSequencePrimed <- yellowOutOfSequenceAll %>% 
  select(rt.y, trial_type.y, key_press.y)

yellowOutOfSequenceTotal <- nrow(yellowOutOfSequencePrimed)
yellowOutOfSequencePrimedHits<-yellowOutOfSequencePrimed[(yellowOutOfSequencePrimed$key_press.y=="79"),] 
yellowOutOfSequenceNumHits <- nrow(yellowOutOfSequencePrimedHits) 
yellowOutOfSequenceHitRate <- yellowOutOfSequenceNumHits/yellowOutOfSequenceTotal
yellowOutOfSequenceNumMiss <- yellowOutOfSequenceTotal - yellowOutOfSequenceNumHits
yellowOutOfSequenceMissRate <- yellowOutOfSequenceNumMiss/yellowOutOfSequenceTotal

yellowSingleLRPE[yellowSingleLRPE == '78'] <- "NA" #single lrpe Hit Rates
yellowSingleLRPETotal <- nrow(yellowSingleLRPE)
yellowSingleLRPEHits<-yellowSingleLRPE[(yellowSingleLRPE$key_press=="79"),] 
yellowSingleLRPENumHits <- nrow(yellowSingleLRPEHits) 
yellowSingleLRPEHitRate <- yellowSingleLRPENumHits/yellowSingleLRPETotal
yellowSingleLRPENumMiss <- yellowSingleLRPETotal - yellowSingleLRPENumHits
yellowSingleLRPEMissRate <- yellowSingleLRPENumMiss/yellowSingleLRPETotal

yellowSingleHRPE[yellowSingleHRPE == '78'] <- "NA" #single hrpe hit rates
yellowSingleHRPETotal <- nrow(yellowSingleHRPE)
yellowSingleHRPEHits<-yellowSingleHRPE[(yellowSingleHRPE$key_press=="79"),] 
yellowSingleHRPENumHits <- nrow(yellowSingleHRPEHits) 
yellowSingleHRPEHitRate <- yellowSingleHRPENumHits/yellowSingleHRPETotal
yellowSingleHRPENumMiss <- yellowSingleHRPETotal - yellowSingleHRPENumHits
yellowSingleHRPEMissRate <- yellowSingleHRPENumMiss/yellowSingleHRPETotal
#
#RT
#
yellowLRPE2[yellowLRPE2 == '78'] <- "NA"   #LRPE RTs

yellowLRPEOdds2 <- yellowLRPE2%>%
  filter(row_number() %% 2 == 1) 
yellowLRPEOdds2 <- yellowLRPEOdds2 %>% 
  dplyr::  mutate(id = row_number())

yellowLRPEEvens2 <- yellowLRPE2%>%
  filter(row_number() %% 2 == 0) 
yellowLRPEEvens2 <- yellowLRPEEvens2 %>% 
  dplyr::  mutate(id = row_number())

yellowLRPEAll2 <-merge(yellowLRPEOdds2, yellowLRPEEvens2, by ="id")

yellowLRPEAll2 <- yellowLRPEAll2 %>%
  filter(key_press.x == '79', 
         key_press.y == '79')

yellowLRPEPrime2 <- yellowLRPEAll2 %>%
  select(rt.x, trial_type.x, key_press.x) 

yellowLRPEPrimeRT <- as.numeric(yellowLRPEPrime2$rt.x)
yellowLRPEPrimeRT <- log( yellowLRPEPrimeRT)

yellowLRPEPrimed2 <- yellowLRPEAll2 %>% 
  select(rt.y, trial_type.y, key_press.y)

yellowLRPEPrimedRT <- as.numeric(yellowLRPEPrimed2$rt.y) 
yellowLRPEPrimedRT <- log( yellowLRPEPrimedRT) 

yellowLRPERTZscore <- (yellowLRPEPrimedRT-OverallRTMean)/OverallRTsd  

yellowHRPE2[yellowHRPE2 == '78'] <- "NA"   #HRPE RTs

yellowHRPEOdds2 <- yellowHRPE2%>%
  filter(row_number() %% 2 == 1) 
yellowHRPEOdds2 <- yellowHRPEOdds2 %>% 
  dplyr::  mutate(id = row_number())

yellowHRPEEvens2 <- yellowHRPE2%>%
  filter(row_number() %% 2 == 0) 
yellowHRPEEvens2 <- yellowHRPEEvens2 %>% 
  dplyr::  mutate(id = row_number())

yellowHRPEAll2 <- merge(yellowHRPEOdds2, yellowHRPEEvens2, by ="id")

yellowHRPEAll2 <- yellowHRPEAll2 %>%
  filter(key_press.x == '79', 
         key_press.y == '79')

yellowHRPEPrime2 <- yellowHRPEAll2 %>%
  select(rt.x, trial_type.x, key_press.x) 

yellowHRPEPrimeRT <- as.numeric(yellowHRPEPrime2$rt.x)
yellowHRPEPrimeRT <- log(yellowHRPEPrimeRT)

yellowHRPEPrimed2 <- yellowHRPEAll2 %>% 
  select(rt.y, trial_type.y, key_press.y)

yellowHRPEPrimedRT <- as.numeric(yellowHRPEPrimed2$rt.y) 
yellowHRPEPrimedRT <- log(yellowHRPEPrimedRT) 

yellowHRPERTZscore <- (yellowHRPEPrimedRT-OverallRTMean)/OverallRTsd  

yellowOutOfSequence2[yellowOutOfSequence2 == '78'] <- "NA"   #OutOfSequence RTs

yellowOutOfSequenceOdds2 <- yellowOutOfSequence2%>%
  filter(row_number() %% 2 == 1) 
yellowOutOfSequenceOdds2 <- yellowOutOfSequenceOdds2 %>% 
  dplyr::  mutate(id = row_number())

yellowOutOfSequenceEvens2 <- yellowOutOfSequence2%>%
  filter(row_number() %% 2 == 0) 
yellowOutOfSequenceEvens2 <- yellowOutOfSequenceEvens2 %>% 
  dplyr::  mutate(id = row_number())

yellowOutOfSequenceAll2 <- merge(yellowOutOfSequenceOdds2, yellowOutOfSequenceEvens2, by ="id")
yellowOutOfSequenceAll2 <- yellowOutOfSequenceAll2 %>%
  filter(key_press.x == '79', 
         key_press.y == '79')

yellowOutOfSequencePrime2 <- yellowOutOfSequenceAll2 %>%
  select(rt.x, trial_type.x, key_press.x) 

yellowOutOfSequencePrimeRT <- as.numeric(yellowOutOfSequencePrime2$rt.x)
yellowOutOfSequencePrimeRT <- log( yellowOutOfSequencePrimeRT)

yellowOutOfSequencePrimed2 <- yellowOutOfSequenceAll2 %>% 
  select(rt.y, trial_type.y, key_press.y)

yellowOutOfSequencePrimedRT <- as.numeric(yellowOutOfSequencePrimed2$rt.y)
yellowOutOfSequencePrimedRT <- log( yellowOutOfSequencePrimedRT) 

yellowOutOfSequenceRTZscore <- (yellowOutOfSequencePrimedRT-OverallRTMean)/OverallRTsd  

yellowSingleLRPE2[yellowSingleLRPE2 == '78'] <- "NA"   #SingleLRPE RTs
yellowSingleLRPEAll2 <- yellowSingleLRPE2 %>%
  filter(key_press == '79')
yellowSingleLRPERT <- as.numeric(yellowSingleLRPEAll2$rt)
yellowSingleLRPERT <- log(yellowSingleLRPERT)

yellowSingleLRPERTZscore <- (yellowSingleLRPERT-OverallRTMean)/OverallRTsd  

yellowSingleHRPE2[yellowSingleHRPE2 == '78'] <- "NA"   #SingleHRPE RTs
yellowSingleHRPEAll2 <- yellowSingleHRPE2 %>%
  filter(key_press == '79')
yellowSingleHRPERT <- as.numeric(yellowSingleHRPEAll2$rt)
yellowSingleHRPERT <- log( yellowSingleHRPERT)

yellowSingleHRPERTZscore <- (yellowSingleHRPERT-OverallRTMean)/OverallRTsd  

##################ROOM/TYPE SPECIFIC HR AND RT: orange####################

#hit rates

orangeLRPE[orangeLRPE == '78'] <- "NA" #LRPE HIT RATES

orangeLRPEOdds <- orangeLRPE%>%
  filter(row_number() %% 2 == 1) 
orangeLRPEOdds <- orangeLRPEOdds %>% 
  dplyr::  mutate(id = row_number())

orangeLRPEEvens <- orangeLRPE%>%
  filter(row_number() %% 2 == 0) 
orangeLRPEEvens <- orangeLRPEEvens %>% 
  dplyr:: mutate(id = row_number())

orangeLRPEAll <-merge(orangeLRPEOdds, orangeLRPEEvens, by ="id")
orangeLRPEAll <- orangeLRPEAll %>%
  filter(key_press.x == '79')

orangeLRPEPrime <- orangeLRPEAll %>%
  select(rt.x, trial_type.x, key_press.x) 

orangeLRPEPrimed <- orangeLRPEAll %>% 
  select(rt.y, trial_type.y, key_press.y)

orangeLRPETotal <- nrow(orangeLRPEPrimed) 
orangeLRPEPrimedHits<-orangeLRPEPrimed[(orangeLRPEPrimed$key_press.y=="79"),] 
orangeLRPENumHits <- nrow(orangeLRPEPrimedHits) 
orangeLRPEHitRate <- orangeLRPENumHits/orangeLRPETotal
orangeLRPENumMiss <- orangeLRPETotal - orangeLRPENumHits
orangeLRPEMissRate <- orangeLRPENumMiss/orangeLRPETotal

orangeHRPE[orangeHRPE == '78'] <- "NA" #HRPE hit rates

orangeHRPEOdds <- orangeHRPE%>%
  filter(row_number() %% 2 == 1) 
orangeHRPEOdds <- orangeHRPEOdds %>% 
  dplyr::  mutate(id = row_number())

orangeHRPEEvens <- orangeHRPE%>%
  filter(row_number() %% 2 == 0)  
orangeHRPEEvens <- orangeHRPEEvens %>% 
  dplyr:: mutate(id = row_number())

orangeHRPEAll <- merge(orangeHRPEOdds, orangeHRPEEvens, by ="id")
orangeHRPEAll <- orangeHRPEAll %>%
  filter(key_press.x == '79')

orangeHRPEPrime <- orangeHRPEAll %>%
  select(rt.x, trial_type.x, key_press.x) 

orangeHRPEPrimed <- orangeHRPEAll %>% 
  select(rt.y, trial_type.y, key_press.y)

orangeHRPETotal <- nrow(orangeHRPEPrimed)
orangeHRPEPrimedHits<-orangeHRPEPrimed[(orangeHRPEPrimed$key_press.y=="79"),] 
orangeHRPENumHits <- nrow(orangeHRPEPrimedHits) 
orangeHRPEHitRate <- orangeHRPENumHits/orangeHRPETotal
orangeHRPENumMiss <- orangeHRPETotal - orangeHRPENumHits
orangeHRPEMissRate <- orangeHRPENumMiss/orangeHRPETotal

orangeOutOfSequence[orangeOutOfSequence == '78'] <- "NA" #out of sequence hit rates

orangeOutOfSequenceOdds <- orangeOutOfSequence%>%
  filter(row_number() %% 2 == 1) 
orangeOutOfSequenceOdds <- orangeOutOfSequenceOdds %>% 
  dplyr:: mutate(id = row_number())

orangeOutOfSequenceEvens <- orangeOutOfSequence%>%
  filter(row_number() %% 2 == 0) 
orangeOutOfSequenceEvens <- orangeOutOfSequenceEvens %>% 
  dplyr::  mutate(id = row_number())

orangeOutOfSequenceAll <- merge(orangeOutOfSequenceOdds, orangeOutOfSequenceEvens, by ="id")
orangeOutOfSequenceAll <- orangeOutOfSequenceAll %>%
  filter(key_press.x == '79')

orangeOutOfSequencePrime <- orangeOutOfSequenceAll %>%
  select(rt.x, trial_type.x, key_press.x) 

orangeOutOfSequencePrimed <- orangeOutOfSequenceAll %>% 
  select(rt.y, trial_type.y, key_press.y)

orangeOutOfSequenceTotal <- nrow(orangeOutOfSequencePrimed)
orangeOutOfSequencePrimedHits<-orangeOutOfSequencePrimed[(orangeOutOfSequencePrimed$key_press.y=="79"),] 
orangeOutOfSequenceNumHits <- nrow(orangeOutOfSequencePrimedHits) 
orangeOutOfSequenceHitRate <- orangeOutOfSequenceNumHits/orangeOutOfSequenceTotal
orangeOutOfSequenceNumMiss <- orangeOutOfSequenceTotal - orangeOutOfSequenceNumHits
orangeOutOfSequenceMissRate <- orangeOutOfSequenceNumMiss/orangeOutOfSequenceTotal

orangeSingleLRPE[orangeSingleLRPE == '78'] <- "NA" #single lrpe Hit Rates
orangeSingleLRPETotal <- nrow(orangeSingleLRPE)
orangeSingleLRPEHits<-orangeSingleLRPE[(orangeSingleLRPE$key_press=="79"),] 
orangeSingleLRPENumHits <- nrow(orangeSingleLRPEHits) 
orangeSingleLRPEHitRate <- orangeSingleLRPENumHits/orangeSingleLRPETotal
orangeSingleLRPENumMiss <- orangeSingleLRPETotal - orangeSingleLRPENumHits
orangeSingleLRPEMissRate <- orangeSingleLRPENumMiss/orangeSingleLRPETotal

orangeSingleHRPE[orangeSingleHRPE == '78'] <- "NA" #single hrpe hit rates
orangeSingleHRPETotal <- nrow(orangeSingleHRPE)
orangeSingleHRPEHits<-orangeSingleHRPE[(orangeSingleHRPE$key_press=="79"),] 
orangeSingleHRPENumHits <- nrow(orangeSingleHRPEHits) 
orangeSingleHRPEHitRate <- orangeSingleHRPENumHits/orangeSingleHRPETotal
orangeSingleHRPENumMiss <- orangeSingleHRPETotal - orangeSingleHRPENumHits
orangeSingleHRPEMissRate <- orangeSingleHRPENumMiss/orangeSingleHRPETotal
#
#RT
#
orangeLRPE2[orangeLRPE2 == '78'] <- "NA"   #LRPE RTs

orangeLRPEOdds2 <- orangeLRPE2%>%
  filter(row_number() %% 2 == 1) 
orangeLRPEOdds2 <- orangeLRPEOdds2 %>% 
  dplyr::  mutate(id = row_number())

orangeLRPEEvens2 <- orangeLRPE2%>%
  filter(row_number() %% 2 == 0) 
orangeLRPEEvens2 <- orangeLRPEEvens2 %>% 
  dplyr::  mutate(id = row_number())

orangeLRPEAll2 <- merge(orangeLRPEOdds2, orangeLRPEEvens2, by ="id")

orangeLRPEAll2 <- orangeLRPEAll2 %>%
  filter(key_press.x == '79', 
         key_press.y == '79')

orangeLRPEPrime2 <- orangeLRPEAll2 %>%
  select(rt.x, trial_type.x, key_press.x) 

orangeLRPEPrimeRT <- as.numeric(orangeLRPEPrime2$rt.x)
orangeLRPEPrimeRT <- log( orangeLRPEPrimeRT)

orangeLRPEPrimed2 <- orangeLRPEAll2 %>% 
  select(rt.y, trial_type.y, key_press.y)

orangeLRPEPrimedRT <- as.numeric(orangeLRPEPrimed2$rt.y) 
orangeLRPEPrimedRT <- log( orangeLRPEPrimedRT) 

orangeLRPERTZscore <- (orangeLRPEPrimedRT-OverallRTMean)/OverallRTsd  

orangeHRPE2[orangeHRPE2 == '78'] <- "NA"   #HRPE RTs

orangeHRPEOdds2 <- orangeHRPE2%>%
  filter(row_number() %% 2 == 1) 
orangeHRPEOdds2 <- orangeHRPEOdds2 %>% 
  dplyr::  mutate(id = row_number())

orangeHRPEEvens2 <- orangeHRPE2%>%
  filter(row_number() %% 2 == 0) 
orangeHRPEEvens2 <- orangeHRPEEvens2 %>% 
  dplyr::  mutate(id = row_number())

orangeHRPEAll2 <- merge(orangeHRPEOdds2, orangeHRPEEvens2, by ="id")

orangeHRPEAll2 <- orangeHRPEAll2 %>%
  filter(key_press.x == '79', 
         key_press.y == '79')

orangeHRPEPrime2 <- orangeHRPEAll2 %>%
  select(rt.x, trial_type.x, key_press.x) 

orangeHRPEPrimeRT <- as.numeric(orangeHRPEPrime2$rt.x)
orangeHRPEPrimeRT <- log(orangeHRPEPrimeRT)

orangeHRPEPrimed2 <- orangeHRPEAll2 %>% 
  select(rt.y, trial_type.y, key_press.y)

orangeHRPEPrimedRT <- as.numeric(orangeHRPEPrimed2$rt.y) 
orangeHRPEPrimedRT <- log( orangeHRPEPrimedRT) 

orangeHRPERTZscore <- (orangeHRPEPrimedRT-OverallRTMean)/OverallRTsd  

orangeOutOfSequence2[orangeOutOfSequence2 == '78'] <- "NA"   #OutOfSequence RTs

orangeOutOfSequenceOdds2 <- orangeOutOfSequence2%>%
  filter(row_number() %% 2 == 1) 
orangeOutOfSequenceOdds2 <- orangeOutOfSequenceOdds2 %>% 
  dplyr::  mutate(id = row_number())

orangeOutOfSequenceEvens2 <- orangeOutOfSequence2%>%
  filter(row_number() %% 2 == 0) 
orangeOutOfSequenceEvens2 <- orangeOutOfSequenceEvens2 %>% 
  dplyr::  mutate(id = row_number())

orangeOutOfSequenceAll2 <- merge(orangeOutOfSequenceOdds2, orangeOutOfSequenceEvens2, by ="id")
orangeOutOfSequenceAll2 <- orangeOutOfSequenceAll2 %>%
  filter(key_press.x == '79', 
         key_press.y == '79')

orangeOutOfSequencePrime2 <- orangeOutOfSequenceAll2 %>%
  select(rt.x, trial_type.x, key_press.x) 

orangeOutOfSequencePrimeRT <- as.numeric(orangeOutOfSequencePrime2$rt.x)
orangeOutOfSequencePrimeRT <- log( orangeOutOfSequencePrimeRT)

orangeOutOfSequencePrimed2 <- orangeOutOfSequenceAll2 %>% 
  select(rt.y, trial_type.y, key_press.y)

orangeOutOfSequencePrimedRT <- as.numeric(orangeOutOfSequencePrimed2$rt.y)
orangeOutOfSequencePrimedRT <- log( orangeOutOfSequencePrimedRT) 

orangeOutOfSequenceRTZscore <- (orangeOutOfSequencePrimedRT-OverallRTMean)/OverallRTsd  

orangeSingleLRPE2[orangeSingleLRPE2 == '78'] <- "NA"   #SingleLRPE RTs
orangeSingleLRPEAll2 <- orangeSingleLRPE2 %>%
  filter(key_press == '79')
orangeSingleLRPERT <- as.numeric(orangeSingleLRPEAll2$rt)
orangeSingleLRPERT <- log(orangeSingleLRPERT)

orangeSingleLRPERTZscore <- (orangeSingleLRPERT-OverallRTMean)/OverallRTsd  

orangeSingleHRPE2[orangeSingleHRPE2 == '78'] <- "NA"   #SingleHRPE RTs
orangeSingleHRPEAll2 <- orangeSingleHRPE2 %>%
  filter(key_press == '79')
orangeSingleHRPERT <- as.numeric(orangeSingleHRPEAll2$rt)
orangeSingleHRPERT <- log( orangeSingleHRPERT)

orangeSingleHRPERTZscore <- (orangeSingleHRPERT-OverallRTMean)/OverallRTsd  

##################ROOM/TYPE SPECIFIC HR AND RT: pink####################

#hit rates

pinkLRPE[pinkLRPE == '78'] <- "NA" #LRPE HIT RATES

pinkLRPEOdds <- pinkLRPE%>%
  filter(row_number() %% 2 == 1) 
pinkLRPEOdds <- pinkLRPEOdds %>% 
  dplyr::  mutate(id = row_number())

pinkLRPEEvens <- pinkLRPE%>%
  filter(row_number() %% 2 == 0) 
pinkLRPEEvens <- pinkLRPEEvens %>% 
  dplyr::  mutate(id = row_number())

pinkLRPEAll <-merge(pinkLRPEOdds, pinkLRPEEvens, by ="id")
pinkLRPEAll <- pinkLRPEAll %>%
  filter(key_press.x == '79')

pinkLRPEPrime <- pinkLRPEAll %>%
  select(rt.x, trial_type.x, key_press.x) 

pinkLRPEPrimed <- pinkLRPEAll %>% 
  select(rt.y, trial_type.y, key_press.y)

pinkLRPETotal <- nrow(pinkLRPEPrimed) 
pinkLRPEPrimedHits<-pinkLRPEPrimed[(pinkLRPEPrimed$key_press.y=="79"),] 
pinkLRPENumHits <- nrow(pinkLRPEPrimedHits) 
pinkLRPEHitRate <- pinkLRPENumHits/pinkLRPETotal
pinkLRPENumMiss <- pinkLRPETotal - pinkLRPENumHits
pinkLRPEMissRate <- pinkLRPENumMiss/pinkLRPETotal

pinkHRPE[pinkHRPE == '78'] <- "NA" #HRPE hit rates

pinkHRPEOdds <- pinkHRPE%>%
  filter(row_number() %% 2 == 1) 
pinkHRPEOdds <- pinkHRPEOdds %>% 
  dplyr::  mutate(id = row_number())

pinkHRPEEvens <- pinkHRPE%>%
  filter(row_number() %% 2 == 0)  
pinkHRPEEvens <- pinkHRPEEvens %>% 
  dplyr::  mutate(id = row_number())

pinkHRPEAll <- merge(pinkHRPEOdds, pinkHRPEEvens, by ="id")
pinkHRPEAll <- pinkHRPEAll %>%
  filter(key_press.x == '79')

pinkHRPEPrime <- pinkHRPEAll %>%
  select(rt.x, trial_type.x, key_press.x) 

pinkHRPEPrimed <- pinkHRPEAll %>% 
  select(rt.y, trial_type.y, key_press.y)

pinkHRPETotal <- nrow(pinkHRPEPrimed)
pinkHRPEPrimedHits<-pinkHRPEPrimed[(pinkHRPEPrimed$key_press.y=="79"),] 
pinkHRPENumHits <- nrow(pinkHRPEPrimedHits) 
pinkHRPEHitRate <- pinkHRPENumHits/pinkHRPETotal
pinkHRPENumMiss <- pinkHRPETotal - pinkHRPENumHits
pinkHRPEMissRate <- pinkHRPENumMiss/pinkHRPETotal

pinkOutOfSequence[pinkOutOfSequence == '78'] <- "NA" #out of sequence hit rates

pinkOutOfSequenceOdds <- pinkOutOfSequence%>%
  filter(row_number() %% 2 == 1) 
pinkOutOfSequenceOdds <- pinkOutOfSequenceOdds %>% 
  dplyr::  mutate(id = row_number())

pinkOutOfSequenceEvens <- pinkOutOfSequence%>%
  filter(row_number() %% 2 == 0) 
pinkOutOfSequenceEvens <- pinkOutOfSequenceEvens %>% 
  dplyr::  mutate(id = row_number())

pinkOutOfSequenceAll <- merge(pinkOutOfSequenceOdds, pinkOutOfSequenceEvens, by ="id")
pinkOutOfSequenceAll <- pinkOutOfSequenceAll %>%
  filter(key_press.x == '79')

pinkOutOfSequencePrime <- pinkOutOfSequenceAll %>%
  select(rt.x, trial_type.x, key_press.x) 

pinkOutOfSequencePrimed <- pinkOutOfSequenceAll %>% 
  select(rt.y, trial_type.y, key_press.y)

pinkOutOfSequenceTotal <- nrow(pinkOutOfSequencePrimed)
pinkOutOfSequencePrimedHits<-pinkOutOfSequencePrimed[(pinkOutOfSequencePrimed$key_press.y=="79"),] 
pinkOutOfSequenceNumHits <- nrow(pinkOutOfSequencePrimedHits) 
pinkOutOfSequenceHitRate <- pinkOutOfSequenceNumHits/pinkOutOfSequenceTotal
pinkOutOfSequenceNumMiss <- pinkOutOfSequenceTotal - pinkOutOfSequenceNumHits
pinkOutOfSequenceMissRate <- pinkOutOfSequenceNumMiss/pinkOutOfSequenceTotal

pinkSingleLRPE[pinkSingleLRPE == '78'] <- "NA" #single lrpe Hit Rates
pinkSingleLRPETotal <- nrow(pinkSingleLRPE)
pinkSingleLRPEHits<-pinkSingleLRPE[(pinkSingleLRPE$key_press=="79"),] 
pinkSingleLRPENumHits <- nrow(pinkSingleLRPEHits) 
pinkSingleLRPEHitRate <- pinkSingleLRPENumHits/pinkSingleLRPETotal
pinkSingleLRPENumMiss <- pinkSingleLRPETotal - pinkSingleLRPENumHits
pinkSingleLRPEMissRate <- pinkSingleLRPENumMiss/pinkSingleLRPETotal

pinkSingleHRPE[pinkSingleHRPE == '78'] <- "NA" #single hrpe hit rates
pinkSingleHRPETotal <- nrow(pinkSingleHRPE)
pinkSingleHRPEHits<-pinkSingleHRPE[(pinkSingleHRPE$key_press=="79"),] 
pinkSingleHRPENumHits <- nrow(pinkSingleHRPEHits) 
pinkSingleHRPEHitRate <- pinkSingleHRPENumHits/pinkSingleHRPETotal
pinkSingleHRPENumMiss <- pinkSingleHRPETotal - pinkSingleHRPENumHits
pinkSingleHRPEMissRate <- pinkSingleHRPENumMiss/pinkSingleHRPETotal
#
#RT
#
pinkLRPE2[pinkLRPE2 == '78'] <- "NA"   #LRPE RTs

pinkLRPEOdds2 <- pinkLRPE2%>%
  filter(row_number() %% 2 == 1) 
pinkLRPEOdds2 <- pinkLRPEOdds2 %>% 
  dplyr::  mutate(id = row_number())

pinkLRPEEvens2 <- pinkLRPE2%>%
  filter(row_number() %% 2 == 0) 
pinkLRPEEvens2 <- pinkLRPEEvens2 %>% 
  dplyr::  mutate(id = row_number())

pinkLRPEAll2 <-merge(pinkLRPEOdds2, pinkLRPEEvens2, by ="id")

pinkLRPEAll2 <- pinkLRPEAll2 %>%
  filter(key_press.x == '79', 
         key_press.y == '79')

pinkLRPEPrime2 <- pinkLRPEAll2 %>%
  select(rt.x, trial_type.x, key_press.x) 

pinkLRPEPrimeRT <- as.numeric(pinkLRPEPrime2$rt.x)
pinkLRPEPrimeRT <- log( pinkLRPEPrimeRT)

pinkLRPEPrimed2 <- pinkLRPEAll2 %>% 
  select(rt.y, trial_type.y, key_press.y)

pinkLRPEPrimedRT <- as.numeric(pinkLRPEPrimed2$rt.y) 
pinkLRPEPrimedRT <- log( pinkLRPEPrimedRT) 

pinkLRPERTZscore <- (pinkLRPEPrimedRT-OverallRTMean)/OverallRTsd  

pinkHRPE2[pinkHRPE2 == '78'] <- "NA"   #HRPE RTs

pinkHRPEOdds2 <- pinkHRPE2%>%
  filter(row_number() %% 2 == 1) 
pinkHRPEOdds2 <- pinkHRPEOdds2 %>% 
  dplyr::  mutate(id = row_number())

pinkHRPEEvens2 <- pinkHRPE2%>%
  filter(row_number() %% 2 == 0) 
pinkHRPEEvens2 <- pinkHRPEEvens2 %>% 
  dplyr::  mutate(id = row_number())

pinkHRPEAll2 <- merge(pinkHRPEOdds2, pinkHRPEEvens2, by ="id")

pinkHRPEAll2 <- pinkHRPEAll2 %>%
  filter(key_press.x == '79', 
         key_press.y == '79')

pinkHRPEPrime2 <- pinkHRPEAll2 %>%
  select(rt.x, trial_type.x, key_press.x) 

pinkHRPEPrimeRT <- as.numeric(pinkHRPEPrime2$rt.x)
pinkHRPEPrimeRT <- log(pinkHRPEPrimeRT)

pinkHRPEPrimed2 <- pinkHRPEAll2 %>% 
  select(rt.y, trial_type.y, key_press.y)

pinkHRPEPrimedRT <- as.numeric(pinkHRPEPrimed2$rt.y) 
pinkHRPEPrimedRT <- log( pinkHRPEPrimedRT) 

pinkHRPERTZscore <- (pinkHRPEPrimedRT-OverallRTMean)/OverallRTsd  

pinkOutOfSequence2[pinkOutOfSequence2 == '78'] <- "NA"   #OutOfSequence RTs

pinkOutOfSequenceOdds2 <- pinkOutOfSequence2%>%
  filter(row_number() %% 2 == 1) 
pinkOutOfSequenceOdds2 <- pinkOutOfSequenceOdds2 %>% 
  dplyr::  mutate(id = row_number())

pinkOutOfSequenceEvens2 <- pinkOutOfSequence2%>%
  filter(row_number() %% 2 == 0) 
pinkOutOfSequenceEvens2 <- pinkOutOfSequenceEvens2 %>% 
  dplyr::  mutate(id = row_number())

pinkOutOfSequenceAll2 <- merge(pinkOutOfSequenceOdds2, pinkOutOfSequenceEvens2, by ="id")
pinkOutOfSequenceAll2 <- pinkOutOfSequenceAll2 %>%
  filter(key_press.x == '79', 
         key_press.y == '79')

pinkOutOfSequencePrime2 <- pinkOutOfSequenceAll2 %>%
  select(rt.x, trial_type.x, key_press.x) 

pinkOutOfSequencePrimeRT <- as.numeric(pinkOutOfSequencePrime2$rt.x)
pinkOutOfSequencePrimeRT <- log( pinkOutOfSequencePrimeRT)

pinkOutOfSequencePrimed2 <- pinkOutOfSequenceAll2 %>% 
  select(rt.y, trial_type.y, key_press.y)

pinkOutOfSequencePrimedRT <- as.numeric(pinkOutOfSequencePrimed2$rt.y)
pinkOutOfSequencePrimedRT <- log( pinkOutOfSequencePrimedRT) 

pinkOutOfSequenceRTZscore <- (pinkOutOfSequencePrimedRT-OverallRTMean)/OverallRTsd  

pinkSingleLRPE2[pinkSingleLRPE2 == '78'] <- "NA"   #SingleLRPE RTs
pinkSingleLRPEAll2 <- pinkSingleLRPE2 %>%
  filter(key_press == '79')
pinkSingleLRPERT <- as.numeric(pinkSingleLRPEAll2$rt)
pinkSingleLRPERT <- log(pinkSingleLRPERT)

pinkSingleLRPERTZscore <- (pinkSingleLRPERT-OverallRTMean)/OverallRTsd  

pinkSingleHRPE2[pinkSingleHRPE2 == '78'] <- "NA"   #SingleHRPE RTs
pinkSingleHRPEAll2 <- pinkSingleHRPE2 %>%
  filter(key_press == '79')
pinkSingleHRPERT <- as.numeric(pinkSingleHRPEAll2$rt)
pinkSingleHRPERT <- log( pinkSingleHRPERT)

pinkSingleHRPERTZscore <- (pinkSingleHRPERT-OverallRTMean)/OverallRTsd 


##################ROOM/TYPE SPECIFIC HR AND RT: purple####################

#hit rates

purpleLRPE[purpleLRPE == '78'] <- "NA" #LRPE HIT RATES

purpleLRPEOdds <- purpleLRPE%>%
  filter(row_number() %% 2 == 1) 
purpleLRPEOdds <- purpleLRPEOdds %>% 
  dplyr::  mutate(id = row_number())

purpleLRPEEvens <- purpleLRPE%>%
  filter(row_number() %% 2 == 0) 
purpleLRPEEvens <- purpleLRPEEvens %>% 
  dplyr::  mutate(id = row_number())

purpleLRPEAll <- merge(purpleLRPEOdds, purpleLRPEEvens, by ="id")
purpleLRPEAll <- purpleLRPEAll %>%
  filter(key_press.x == '79')

purpleLRPEPrime <- purpleLRPEAll %>%
  select(rt.x, trial_type.x, key_press.x) 

purpleLRPEPrimed <- purpleLRPEAll %>% 
  select(rt.y, trial_type.y, key_press.y)

purpleLRPETotal <- nrow(purpleLRPEPrimed) 
purpleLRPEPrimedHits<-purpleLRPEPrimed[(purpleLRPEPrimed$key_press.y=="79"),] 
purpleLRPENumHits <- nrow(purpleLRPEPrimedHits) 
purpleLRPEHitRate <- purpleLRPENumHits/purpleLRPETotal
purpleLRPENumMiss <- purpleLRPETotal - purpleLRPENumHits
purpleLRPEMissRate <- purpleLRPENumMiss/purpleLRPETotal

purpleHRPE[purpleHRPE == '78'] <- "NA" #HRPE hit rates

purpleHRPEOdds <- purpleHRPE%>%
  filter(row_number() %% 2 == 1) 
purpleHRPEOdds <- purpleHRPEOdds %>% 
  dplyr::  mutate(id = row_number())

purpleHRPEEvens <- purpleHRPE%>%
  filter(row_number() %% 2 == 0)  
purpleHRPEEvens <- purpleHRPEEvens %>% 
  dplyr::  mutate(id = row_number())

purpleHRPEAll <- merge(purpleHRPEOdds, purpleHRPEEvens, by ="id")
purpleHRPEAll <- purpleHRPEAll %>%
  filter(key_press.x == '79')

purpleHRPEPrime <- purpleHRPEAll %>%
  select(rt.x, trial_type.x, key_press.x) 

purpleHRPEPrimed <- purpleHRPEAll %>% 
  select(rt.y, trial_type.y, key_press.y)

purpleHRPETotal <- nrow(purpleHRPEPrimed)
purpleHRPEPrimedHits<-purpleHRPEPrimed[(purpleHRPEPrimed$key_press.y=="79"),] 
purpleHRPENumHits <- nrow(purpleHRPEPrimedHits) 
purpleHRPEHitRate <- purpleHRPENumHits/purpleHRPETotal
purpleHRPENumMiss <- purpleHRPETotal - purpleHRPENumHits
purpleHRPEMissRate <- purpleHRPENumMiss/purpleHRPETotal

purpleOutOfSequence[purpleOutOfSequence == '78'] <- "NA" #out of sequence hit rates

purpleOutOfSequenceOdds <- purpleOutOfSequence%>%
  filter(row_number() %% 2 == 1) 
purpleOutOfSequenceOdds <- purpleOutOfSequenceOdds %>% 
  dplyr::  mutate(id = row_number())

purpleOutOfSequenceEvens <- purpleOutOfSequence%>%
  filter(row_number() %% 2 == 0) 
purpleOutOfSequenceEvens <- purpleOutOfSequenceEvens %>% 
  dplyr::  mutate(id = row_number())

purpleOutOfSequenceAll <- merge(purpleOutOfSequenceOdds, purpleOutOfSequenceEvens, by ="id")
purpleOutOfSequenceAll <- purpleOutOfSequenceAll %>%
  filter(key_press.x == '79')

purpleOutOfSequencePrime <- purpleOutOfSequenceAll %>%
  select(rt.x, trial_type.x, key_press.x) 

purpleOutOfSequencePrimed <- purpleOutOfSequenceAll %>% 
  select(rt.y, trial_type.y, key_press.y)

purpleOutOfSequenceTotal <- nrow(purpleOutOfSequencePrimed)
purpleOutOfSequencePrimedHits<-purpleOutOfSequencePrimed[(purpleOutOfSequencePrimed$key_press.y=="79"),] 
purpleOutOfSequenceNumHits <- nrow(purpleOutOfSequencePrimedHits) 
purpleOutOfSequenceHitRate <- purpleOutOfSequenceNumHits/purpleOutOfSequenceTotal
purpleOutOfSequenceNumMiss <- purpleOutOfSequenceTotal - purpleOutOfSequenceNumHits
purpleOutOfSequenceMissRate <- purpleOutOfSequenceNumMiss/purpleOutOfSequenceTotal

purpleSingleLRPE[purpleSingleLRPE == '78'] <- "NA" #single lrpe Hit Rates
purpleSingleLRPETotal <- nrow(purpleSingleLRPE)
purpleSingleLRPEHits<-purpleSingleLRPE[(purpleSingleLRPE$key_press=="79"),] 
purpleSingleLRPENumHits <- nrow(purpleSingleLRPEHits) 
purpleSingleLRPEHitRate <- purpleSingleLRPENumHits/purpleSingleLRPETotal
purpleSingleLRPENumMiss <- purpleSingleLRPETotal - purpleSingleLRPENumHits
purpleSingleLRPEMissRate <- purpleSingleLRPENumMiss/purpleSingleLRPETotal

purpleSingleHRPE[purpleSingleHRPE == '78'] <- "NA" #single hrpe hit rates
purpleSingleHRPETotal <- nrow(purpleSingleHRPE)
purpleSingleHRPEHits<-purpleSingleHRPE[(purpleSingleHRPE$key_press=="79"),] 
purpleSingleHRPENumHits <- nrow(purpleSingleHRPEHits) 
purpleSingleHRPEHitRate <- purpleSingleHRPENumHits/purpleSingleHRPETotal
purpleSingleHRPENumMiss <- purpleSingleHRPETotal - purpleSingleHRPENumHits
purpleSingleHRPEMissRate <- purpleSingleHRPENumMiss/purpleSingleHRPETotal
#
#RT
#
purpleLRPE2[purpleLRPE2 == '78'] <- "NA"   #LRPE RTs

purpleLRPEOdds2 <- purpleLRPE2%>%
  filter(row_number() %% 2 == 1) 
purpleLRPEOdds2 <- purpleLRPEOdds2 %>% 
  dplyr::  mutate(id = row_number())

purpleLRPEEvens2 <- purpleLRPE2%>%
  filter(row_number() %% 2 == 0) 
purpleLRPEEvens2 <- purpleLRPEEvens2 %>% 
  dplyr::  mutate(id = row_number())

purpleLRPEAll2 <- merge(purpleLRPEOdds2, purpleLRPEEvens2, by ="id")

purpleLRPEAll2 <- purpleLRPEAll2 %>%
  filter(key_press.x == '79', 
         key_press.y == '79')

purpleLRPEPrime2 <- purpleLRPEAll2 %>%
  select(rt.x, trial_type.x, key_press.x) 

purpleLRPEPrimeRT <- as.numeric(purpleLRPEPrime2$rt.x)
purpleLRPEPrimeRT <- log( purpleLRPEPrimeRT)

purpleLRPEPrimed2 <- purpleLRPEAll2 %>% 
  select(rt.y, trial_type.y, key_press.y)

purpleLRPEPrimedRT <- as.numeric(purpleLRPEPrimed2$rt.y) 
purpleLRPEPrimedRT <- log( purpleLRPEPrimedRT) 

purpleLRPERTZscore <- (purpleLRPEPrimedRT-OverallRTMean)/OverallRTsd  

purpleHRPE2[purpleHRPE2 == '78'] <- "NA"   #HRPE RTs

purpleHRPEOdds2 <- purpleHRPE2%>%
  filter(row_number() %% 2 == 1) 
purpleHRPEOdds2 <- purpleHRPEOdds2 %>% 
  dplyr::  mutate(id = row_number())

purpleHRPEEvens2 <- purpleHRPE2%>%
  filter(row_number() %% 2 == 0) 
purpleHRPEEvens2 <- purpleHRPEEvens2 %>% 
  dplyr::  mutate(id = row_number())

purpleHRPEAll2 <- merge(purpleHRPEOdds2, purpleHRPEEvens2, by ="id")

purpleHRPEAll2 <- purpleHRPEAll2 %>%
  filter(key_press.x == '79', 
         key_press.y == '79')

purpleHRPEPrime2 <- purpleHRPEAll2 %>%
  select(rt.x, trial_type.x, key_press.x) 

purpleHRPEPrimeRT <- as.numeric(purpleHRPEPrime2$rt.x)
purpleHRPEPrimeRT <- log(purpleHRPEPrimeRT)

purpleHRPEPrimed2 <- purpleHRPEAll2 %>% 
  select(rt.y, trial_type.y, key_press.y)

purpleHRPEPrimedRT <- as.numeric(purpleHRPEPrimed2$rt.y) 
purpleHRPEPrimedRT <- log( purpleHRPEPrimedRT) 

purpleHRPERTZscore <- (purpleHRPEPrimedRT-OverallRTMean)/OverallRTsd  

purpleOutOfSequence2[purpleOutOfSequence2 == '78'] <- "NA"   #OutOfSequence RTs

purpleOutOfSequenceOdds2 <- purpleOutOfSequence2%>%
  filter(row_number() %% 2 == 1) 
purpleOutOfSequenceOdds2 <- purpleOutOfSequenceOdds2 %>% 
  dplyr::  mutate(id = row_number())

purpleOutOfSequenceEvens2 <- purpleOutOfSequence2%>%
  filter(row_number() %% 2 == 0) 
purpleOutOfSequenceEvens2 <- purpleOutOfSequenceEvens2 %>% 
  dplyr::  mutate(id = row_number())

purpleOutOfSequenceAll2 <- merge(purpleOutOfSequenceOdds2, purpleOutOfSequenceEvens2, by ="id")
purpleOutOfSequenceAll2 <- purpleOutOfSequenceAll2 %>%
  filter(key_press.x == '79', 
         key_press.y == '79')

purpleOutOfSequencePrime2 <- purpleOutOfSequenceAll2 %>%
  select(rt.x, trial_type.x, key_press.x) 

purpleOutOfSequencePrimeRT <- as.numeric(purpleOutOfSequencePrime2$rt.x)
purpleOutOfSequencePrimeRT <- log( purpleOutOfSequencePrimeRT)

purpleOutOfSequencePrimed2 <- purpleOutOfSequenceAll2 %>% 
  select(rt.y, trial_type.y, key_press.y)

purpleOutOfSequencePrimedRT <- as.numeric(purpleOutOfSequencePrimed2$rt.y)
purpleOutOfSequencePrimedRT <- log( purpleOutOfSequencePrimedRT) 

purpleOutOfSequenceRTZscore <- (purpleOutOfSequencePrimedRT-OverallRTMean)/OverallRTsd  

purpleSingleLRPE2[purpleSingleLRPE2 == '78'] <- "NA"   #SingleLRPE RTs
purpleSingleLRPEAll2 <- purpleSingleLRPE2 %>%
  filter(key_press == '79')
purpleSingleLRPERT <- as.numeric(purpleSingleLRPEAll2$rt)
purpleSingleLRPERT <- log(purpleSingleLRPERT)

purpleSingleLRPERTZscore <- (purpleSingleLRPERT-OverallRTMean)/OverallRTsd  

purpleSingleHRPE2[purpleSingleHRPE2 == '78'] <- "NA"   #SingleHRPE RTs
purpleSingleHRPEAll2 <- purpleSingleHRPE2 %>%
  filter(key_press == '79')
purpleSingleHRPERT <- as.numeric(purpleSingleHRPEAll2$rt)
purpleSingleHRPERT <- log( purpleSingleHRPERT)

purpleSingleHRPERTZscore <- (purpleSingleHRPERT-OverallRTMean)/OverallRTsd  
##################ROOM/TYPE SPECIFIC HR AND RT: green####################

#hit rates

greenLRPE[greenLRPE == '78'] <- "NA" #LRPE HIT RATES

greenLRPEOdds <- greenLRPE%>%
  filter(row_number() %% 2 == 1) 
greenLRPEOdds <- greenLRPEOdds %>% 
  dplyr::  mutate(id = row_number())

greenLRPEEvens <- greenLRPE%>%
  filter(row_number() %% 2 == 0) 
greenLRPEEvens <- greenLRPEEvens %>% 
  dplyr::  mutate(id = row_number())

greenLRPEAll <- merge(greenLRPEOdds, greenLRPEEvens, by ="id")
greenLRPEAll <- greenLRPEAll %>%
  filter(key_press.x == '79')

greenLRPEPrime <- greenLRPEAll %>%
  select(rt.x, trial_type.x, key_press.x) 

greenLRPEPrimed <- greenLRPEAll %>% 
  select(rt.y, trial_type.y, key_press.y)

greenLRPETotal <- nrow(greenLRPEPrimed) 
greenLRPEPrimedHits<-greenLRPEPrimed[(greenLRPEPrimed$key_press.y=="79"),] 
greenLRPENumHits <- nrow(greenLRPEPrimedHits) 
greenLRPEHitRate <- greenLRPENumHits/greenLRPETotal
greenLRPENumMiss <- greenLRPETotal - greenLRPENumHits
greenLRPEMissRate <- greenLRPENumMiss/greenLRPETotal

greenHRPE[greenHRPE == '78'] <- "NA" #HRPE hit rates

greenHRPEOdds <- greenHRPE%>%
  filter(row_number() %% 2 == 1) 
greenHRPEOdds <- greenHRPEOdds %>% 
  dplyr::  mutate(id = row_number())

greenHRPEEvens <- greenHRPE%>%
  filter(row_number() %% 2 == 0)  
greenHRPEEvens <- greenHRPEEvens %>% 
  dplyr::  mutate(id = row_number())

greenHRPEAll <- merge(greenHRPEOdds, greenHRPEEvens, by ="id")
greenHRPEAll <- greenHRPEAll %>%
  filter(key_press.x == '79')

greenHRPEPrime <- greenHRPEAll %>%
  select(rt.x, trial_type.x, key_press.x) 

greenHRPEPrimed <- greenHRPEAll %>% 
  select(rt.y, trial_type.y, key_press.y)

greenHRPETotal <- nrow(greenHRPEPrimed)
greenHRPEPrimedHits<-greenHRPEPrimed[(greenHRPEPrimed$key_press.y=="79"),] 
greenHRPENumHits <- nrow(greenHRPEPrimedHits) 
greenHRPEHitRate <- greenHRPENumHits/greenHRPETotal
greenHRPENumMiss <- greenHRPETotal - greenHRPENumHits
greenHRPEMissRate <- greenHRPENumMiss/greenHRPETotal

greenOutOfSequence[greenOutOfSequence == '78'] <- "NA" #out of sequence hit rates

greenOutOfSequenceOdds <- greenOutOfSequence%>%
  filter(row_number() %% 2 == 1) 
greenOutOfSequenceOdds <- greenOutOfSequenceOdds %>% 
  dplyr::  mutate(id = row_number())

greenOutOfSequenceEvens <- greenOutOfSequence%>%
  filter(row_number() %% 2 == 0) 
greenOutOfSequenceEvens <- greenOutOfSequenceEvens %>% 
  dplyr::  mutate(id = row_number())

greenOutOfSequenceAll <- merge(greenOutOfSequenceOdds, greenOutOfSequenceEvens, by ="id")
greenOutOfSequenceAll <- greenOutOfSequenceAll %>%
  filter(key_press.x == '79')

greenOutOfSequencePrime <- greenOutOfSequenceAll %>%
  select(rt.x, trial_type.x, key_press.x) 

greenOutOfSequencePrimed <- greenOutOfSequenceAll %>% 
  select(rt.y, trial_type.y, key_press.y)

greenOutOfSequenceTotal <- nrow(greenOutOfSequencePrimed)
greenOutOfSequencePrimedHits<-greenOutOfSequencePrimed[(greenOutOfSequencePrimed$key_press.y=="79"),] 
greenOutOfSequenceNumHits <- nrow(greenOutOfSequencePrimedHits) 
greenOutOfSequenceHitRate <- greenOutOfSequenceNumHits/greenOutOfSequenceTotal
greenOutOfSequenceNumMiss <- greenOutOfSequenceTotal - greenOutOfSequenceNumHits
greenOutOfSequenceMissRate <- greenOutOfSequenceNumMiss/greenOutOfSequenceTotal

greenSingleLRPE[greenSingleLRPE == '78'] <- "NA" #single lrpe Hit Rates
greenSingleLRPETotal <- nrow(greenSingleLRPE)
greenSingleLRPEHits<-greenSingleLRPE[(greenSingleLRPE$key_press=="79"),] 
greenSingleLRPENumHits <- nrow(greenSingleLRPEHits) 
greenSingleLRPEHitRate <- greenSingleLRPENumHits/greenSingleLRPETotal
greenSingleLRPENumMiss <- greenSingleLRPETotal - greenSingleLRPENumHits
greenSingleLRPEMissRate <- greenSingleLRPENumMiss/greenSingleLRPETotal

greenSingleHRPE[greenSingleHRPE == '78'] <- "NA" #single hrpe hit rates
greenSingleHRPETotal <- nrow(greenSingleHRPE)
greenSingleHRPEHits<-greenSingleHRPE[(greenSingleHRPE$key_press=="79"),] 
greenSingleHRPENumHits <- nrow(greenSingleHRPEHits) 
greenSingleHRPEHitRate <- greenSingleHRPENumHits/greenSingleHRPETotal
greenSingleHRPENumMiss <- greenSingleHRPETotal - greenSingleHRPENumHits
greenSingleHRPEMissRate <- greenSingleHRPENumMiss/greenSingleHRPETotal
#
#RT
#
greenLRPE2[greenLRPE2 == '78'] <- "NA"   #LRPE RTs

greenLRPEOdds2 <- greenLRPE2%>%
  filter(row_number() %% 2 == 1) 
greenLRPEOdds2 <- greenLRPEOdds2 %>% 
  dplyr::  mutate(id = row_number())

greenLRPEEvens2 <- greenLRPE2%>%
  filter(row_number() %% 2 == 0) 
greenLRPEEvens2 <- greenLRPEEvens2 %>% 
  dplyr::  mutate(id = row_number())

greenLRPEAll2 <-merge(greenLRPEOdds2, greenLRPEEvens2, by ="id")

greenLRPEAll2 <- greenLRPEAll2 %>%
  filter(key_press.x == '79', 
         key_press.y == '79')

greenLRPEPrime2 <- greenLRPEAll2 %>%
  select(rt.x, trial_type.x, key_press.x) 

greenLRPEPrimeRT <- as.numeric(greenLRPEPrime2$rt.x)
greenLRPEPrimeRT <- log( greenLRPEPrimeRT)

greenLRPEPrimed2 <- greenLRPEAll2 %>% 
  select(rt.y, trial_type.y, key_press.y)

greenLRPEPrimedRT <- as.numeric(greenLRPEPrimed2$rt.y) 
greenLRPEPrimedRT <- log(greenLRPEPrimedRT) 

greenLRPERTZscore <- (greenLRPEPrimedRT-OverallRTMean)/OverallRTsd  

greenHRPE2[greenHRPE2 == '78'] <- "NA"   #HRPE RTs

greenHRPEOdds2 <- greenHRPE2%>%
  filter(row_number() %% 2 == 1) 
greenHRPEOdds2 <- greenHRPEOdds2 %>% 
  dplyr::  mutate(id = row_number())

greenHRPEEvens2 <- greenHRPE2%>%
  filter(row_number() %% 2 == 0) 
greenHRPEEvens2 <- greenHRPEEvens2 %>% 
  dplyr::  mutate(id = row_number())

greenHRPEAll2 <- merge(greenHRPEOdds2, greenHRPEEvens2, by ="id")

greenHRPEAll2 <- greenHRPEAll2 %>%
  filter(key_press.x == '79', 
         key_press.y == '79')

greenHRPEPrime2 <- greenHRPEAll2 %>%
  select(rt.x, trial_type.x, key_press.x) 

greenHRPEPrimeRT <- as.numeric(greenHRPEPrime2$rt.x)
greenHRPEPrimeRT <- log(greenHRPEPrimeRT)

greenHRPEPrimed2 <- greenHRPEAll2 %>% 
  select(rt.y, trial_type.y, key_press.y)

greenHRPEPrimedRT <- as.numeric(greenHRPEPrimed2$rt.y) 
greenHRPEPrimedRT <- log( greenHRPEPrimedRT) 

greenHRPERTZscore <- (greenHRPEPrimedRT-OverallRTMean)/OverallRTsd  

greenOutOfSequence2[greenOutOfSequence2 == '78'] <- "NA"   #OutOfSequence RTs

greenOutOfSequenceOdds2 <- greenOutOfSequence2%>%
  filter(row_number() %% 2 == 1) 
greenOutOfSequenceOdds2 <- greenOutOfSequenceOdds2 %>% 
  dplyr::  mutate(id = row_number())

greenOutOfSequenceEvens2 <- greenOutOfSequence2%>%
  filter(row_number() %% 2 == 0) 
greenOutOfSequenceEvens2 <- greenOutOfSequenceEvens2 %>% 
  dplyr::  mutate(id = row_number())

greenOutOfSequenceAll2 <-merge(greenOutOfSequenceOdds2, greenOutOfSequenceEvens2, by ="id")
greenOutOfSequenceAll2 <- greenOutOfSequenceAll2 %>%
  filter(key_press.x == '79', 
         key_press.y == '79')

greenOutOfSequencePrime2 <- greenOutOfSequenceAll2 %>%
  select(rt.x, trial_type.x, key_press.x) 

greenOutOfSequencePrimeRT <- as.numeric(greenOutOfSequencePrime2$rt.x)
greenOutOfSequencePrimeRT <- log( greenOutOfSequencePrimeRT)

greenOutOfSequencePrimed2 <- greenOutOfSequenceAll2 %>% 
  select(rt.y, trial_type.y, key_press.y)

greenOutOfSequencePrimedRT <- as.numeric(greenOutOfSequencePrimed2$rt.y)
greenOutOfSequencePrimedRT <- log(greenOutOfSequencePrimedRT) 

greenOutOfSequenceRTZscore <- (greenOutOfSequencePrimedRT-OverallRTMean)/OverallRTsd  

greenSingleLRPE2[greenSingleLRPE2 == '78'] <- "NA"   #SingleLRPE RTs
greenSingleLRPEAll2 <- greenSingleLRPE2 %>%
  filter(key_press == '79')
greenSingleLRPERT <- as.numeric(greenSingleLRPEAll2$rt)
greenSingleLRPERT <- log(greenSingleLRPERT)

greenSingleLRPERTZscore <- (greenSingleLRPERT-OverallRTMean)/OverallRTsd  

greenSingleHRPE2[greenSingleHRPE2 == '78'] <- "NA"   #SingleHRPE RTs
greenSingleHRPEAll2 <- greenSingleHRPE2 %>%
  filter(key_press == '79')
greenSingleHRPERT <- as.numeric(greenSingleHRPEAll2$rt)
greenSingleHRPERT <- log( greenSingleHRPERT)

greenSingleHRPERTZscore <- (greenSingleHRPERT-OverallRTMean)/OverallRTsd  


###################### save variables of interest #########################

########################################

save(purpleSingleHRPEHitRate,purpleSingleLRPEHitRate,purpleOutOfSequenceHitRate,purpleLRPEHitRate,purpleHRPEHitRate, 
     yellowSingleHRPEHitRate,yellowSingleLRPEHitRate,yellowOutOfSequenceHitRate,yellowLRPEHitRate,yellowHRPEHitRate, 
     blueSingleHRPEHitRate,blueSingleLRPEHitRate,blueOutOfSequenceHitRate,blueLRPEHitRate,blueHRPEHitRate, 
     orangeSingleHRPEHitRate,orangeSingleLRPEHitRate,orangeOutOfSequenceHitRate,orangeLRPEHitRate,orangeHRPEHitRate, 
     pinkSingleHRPEHitRate,pinkSingleLRPEHitRate,pinkOutOfSequenceHitRate,pinkLRPEHitRate,pinkHRPEHitRate, 
     greenSingleHRPEHitRate,greenSingleLRPEHitRate,greenOutOfSequenceHitRate,greenLRPEHitRate,greenHRPEHitRate, 
     blueSingleHRPERTZscore,blueSingleLRPERTZscore,blueOutOfSequenceRTZscore,blueHRPERTZscore,blueLRPERTZscore, 
     yellowSingleHRPERTZscore,yellowSingleLRPERTZscore,yellowOutOfSequenceRTZscore,yellowHRPERTZscore,yellowLRPERTZscore,
     orangeSingleHRPERTZscore,orangeSingleLRPERTZscore,orangeOutOfSequenceRTZscore,orangeHRPERTZscore,orangeLRPERTZscore,
     pinkSingleHRPERTZscore,pinkSingleLRPERTZscore,pinkOutOfSequenceRTZscore,pinkHRPERTZscore,pinkLRPERTZscore,
     purpleSingleHRPERTZscore,purpleSingleLRPERTZscore,purpleOutOfSequenceRTZscore,purpleHRPERTZscore,purpleLRPERTZscore,
     greenSingleHRPERTZscore,greenSingleLRPERTZscore,greenOutOfSequenceRTZscore,greenHRPERTZscore,greenLRPERTZscore,
     AllSingleLRPEHitRate,AllSingleHRPEHitRate,AllLRPEHitRate,AllHRPEHitRate,AllOutOfSequenceHitRate,
     AllSingleHRPEHitsRTZscore,AllLRPEPrimedRTZscore,AllHRPEPrimedRTZscore,AllOutOfSequencePrimedRTZscore,AllSingleLRPEHitsRTZscore,
     AllMemTrialNoCriteriaPairsAndSinglesRTZscore,AllMemTrialSinglesAndPrimedHitRate,AllMemTrialNoCriteriaHitRate,AllMemTrialPairsPrimedRTZscore,AllMemTrialSinglesRTZscore, 
     file= "CollectiveData.Rdata")



