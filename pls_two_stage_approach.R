require(plspm)


install.packages("nipals")
require(nipals)

attach(hoc)

int=nipals(hoc[, c(1:3)])
int
hoc$int=int$scores[,1]

ext=nipals(hoc[, c(4:6)])
hoc$ext=ext$scores[,1]

#--------------------------------------
tang=nipals(hoc[, c(12:14)])
hoc$tang=tang$scores[,1]

emp=nipals(hoc[, c(15:18)])
hoc$emp=emp$scores[,1]

reliab=nipals(hoc[, c(19:21)])
hoc$reliab=reliab$scores[,1]

resp=nipals(hoc[, c(22:26)])
hoc$resp=resp$scores[,1]

#=============================================

comm=c(0,0,0)
psq=c(1,0,0)
reten=c(1,1,0)

path=rbind(comm,psq,reten)
colnames(path)=rownames(path)
innerplot(path)

b=list(27:28,29:32,7:11)
m=c("B","B","A")
p=plspm(hoc, path, b, m)

summary(p)
