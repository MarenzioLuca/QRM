library(haven)
terrorism = read_sav("ZA6643_v4-0-0.sav")

terrorism$treatment = ifelse(terrorism$p1 > 7, 1, 0)
table(terrorism$isocntry, terrorism$treatment)
prima = subset(terrorism, terrorism$treatment==0)
dopo = subset(terrorism, terrorism$treatment==1)

#qa17a

left= terrorism$d1<4
tl = mean (terrorism$qa17a[left & terrorism$treatment==1], na.rm=TRUE)

itabel = subset(terrorism, terrorism$isocntry == "IT" | terrorism$isocntry == "BE")
itabel$d1
france = subset(terrorism, terrorism$isocntry == "FR" )


table(terrorism$d70, terrorism$treatment)
mean(terrorism$d70[terrorism$treatment==0], na.rm=TRUE)
mean(terrorism$d70[terrorism$treatment==1], na.rm=TRUE)

# social media, città
terrorism$qe5a
mean (terrorism$qe5a[terrorism$treatment==0], na.rm=TRUE)
mean (terrorism$qe5a[terrorism$treatment==1], na.rm=TRUE)

# voce
terrorism$d72_2
mean (terrorism$d72_2[terrorism$treatment==0], na.rm=TRUE)
mean (terrorism$d72_2[terrorism$treatment==1], na.rm=TRUE)

# valore
mean (terrorism$qd8_5[terrorism$treatment==0], na.rm=TRUE)
mean (terrorism$qd8_5[terrorism$treatment==1], na.rm=TRUE)

table (C(prima$qd8_1, prima$qd8_2), )

#identità

#internet
mean (itabel$d62_1[itabel$treatment==0], na.rm=TRUE)
mean (itabel$d62_1[itabel$treatment==1], na.rm=TRUE)
