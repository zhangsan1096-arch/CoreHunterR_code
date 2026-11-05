library(corehunter)
geno.data<-read.table("Ep512.SNP.NoMiss.012.dat")
rows_to_remove <- c("2","85","87","130","177","284","320","349","362","366","503","504","505","506","507","508","509","510","511","512")
df_new <-data[!rownames(data) %in% rows_to_remove, ]
geno.data1<-df_new[,-1]
geno.ID<-read.table("selected1.012 (2).TXT",header = T)
col_names <- paste0("M", 1:ncol(geno.data1)-1)
colnames(geno.data1)<- col_names
colnames(geno.data1)[1] <- "NAME"
rownames(geno.data1) <- NULL
data <- data.frame(geno.ID,geno.data1[,-1])
phe<-read.csv("PHE2.csv")
gen<-read.csv("genetype.csv")
pheno.file <- system.file("extdata", "PHE.csv", package = "corehunter")
geno <- genotypes(gen[,-1:-2], format = "biparental")
my.data <- coreHunterData(
  geno, phenotypes(phe),
)
core1<-sampleCore(my.data,size=0.2)
write.csv(core1$sel,"R1.csv")
write.csv(core2$sel,"R2.csv")
write.csv(core3$sel,"R3.csv")
write.csv(core4$sel,"R4.csv")
write.csv(core5$sel,"R5.csv")
write.csv(core6$sel,"R6.csv")
write.csv(core7$sel,"R7.csv")

core1<-sampleCore(my.data,size = 0.1)
core2<-sampleCore(my.data,size = 0.15)
core3<-sampleCore(my.data,size = 0.2)
core4<-sampleCore(my.data,size = 0.25)
core5<-sampleCore(my.data,size = 0.30)
core6<-sampleCore(my.data,size = 0.35)
core7<-sampleCore(my.data,size = 0.40)
