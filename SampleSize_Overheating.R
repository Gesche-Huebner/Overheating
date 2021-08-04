#Sample size calculation for overheating study

library(pwr)
library (WebPower) #for Possion regression

#Hypothesis 1: Concern about overheating is higher in parents than non-parents.
#Approach: t-test for two independent means
pwr.t.test(d =0.25 , sig.level =0.05 , power = 0.95, type = c("two.sample"))

#OUtcome: n = 417 in each group, total 834. Given that we will expect some missing data on the outcome variable, we will oversample to 1000.

#Hypothesis 2: Concern about overheating is higher in mothers than father and non-parents.
#Approach: OLS
#Rationale: Parental status is classsified into four (five) groups
#note, we calcUate with 5 groups though we might only have four groups if the 'other' group is too small)
pwr.f2.test(u=4, f =0.02, sig.level=0.05, power=.95)
#pwr.anova.test(k = 5, f = 0.15, sig.level = 0.05, power = .95)
#Outcome: v = 920,  \(n = v + u + 1\). n = 920+4+1 = 934. 

#Hypothesis 3: Parents of younger children are more concerned about overheating than non-parents or parents of older children.
#Approach: Ordinary least square regression. 
pwr.f2.test(u=4, f2=0.02, sig.level=0.05, power=0.95)
#v = 929 plus number of variables 4 + 1 = 934

#Hypothesis 4: Parents are more likely to install future cooling devices than non-parents.
#Approach: OLS; assuming parents coded depending on age of children
pwr.f2.test(u=4, f2=0.02, sig.level=0.05, power=0.95)
#v =929, plus number of variables 4+1, sample size 934. 

#Hypothesis 5: Parents are using more mitigation options than non-parents. 
#Poisson regression; we assume 8 out of 19 mitigation options for parents and 4 out of 19 for non-parents
wp.poisson(exp0=1.2343, exp1=1.5236, alpha=0.05, power=0.95, alternative ="two.sided", family="uniform")
#N = 579
# There is a risk we are underpowered as this can only be tested amongst those who experience overheating.
#Solution: we combine the sample into one, i.e. give up on the country differentiation. 
