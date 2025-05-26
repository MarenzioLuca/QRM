library(haven)
terrorism = read_sav("ZA6643_v4-0-0.sav")

countries = subset (terrorism, isocntry == "RO" | isocntry == "HU" | isocntry == "SE" |
                    isocntry == "DK" | isocntry == "IT" | isocntry == "PT", c(p1, isocntry, qa17a, qd8_5,
                                                                              d10, d11, d60,
                                                                              d63))
countries$treatment = ifelse(countries$p1>7, 1, 0)
countries$type = ifelse(countries$isocntry == "RO" | countries$isocntry == "HU", "New", ifelse(countries$isocntry == "IT" | countries$isocntry == "PT", "Rebuilt", "Old"))
new = subset (countries, type =="New")
old = subset (countries, type =="Old")
rebuilt = subset (countries, type =="Rebuilt")

lm(new$qa17a ~ new$treatment + new$d60) # nuove democrazie - i poveri sono leggermente più disillusi, perché se si alza di 1 d60 (se è più ricco) si abbassa il "livello di disillusione" qa17a. In linea con Acemoglu e l'opportunity cost della rivoluzione.
lm(old$qa17a ~ old$treatment + old$d60) # vecchie - qui di più
lm(rebuilt$qa17a ~ rebuilt$treatment + rebuilt$d60) #ricostruite - soprattutto qui i poveri sono più disillusi

# Ricorda Edmund Burke. Chi sta bene, paesi vecchi anche in questo caso, vogliono lo status quo.