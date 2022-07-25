require(plspm)
attach(Mix)

#Drawing Model
int=c(0,0,0,0,0,0,0)
ext=c(0,0,0,0,0,0,0)
tang=c(1,1,0,0,0,0,0)
emp=c(1,1,0,0,0,0,0)
reliab=c(1,1,0,0,0,0,0)
loyal=c(0,0,0,0,0,0,0)
reten=c(1,1,1,1,1,1,0)


x=rbind(int,ext,tang,emp,reliab,loyal,reten)
colnames(x)=rownames(x)
innerplot(x, arr.pos = .7)

out=list(1:3, 4:6, 7:9,10:13, 14:16,
         17:21,22:26)

xx=plspm(Mix, x, out, scheme="path")


#All Output
summary(xx)

#=======================================

#Extracting Construct Score:

z=xx$scores
head(z,2)
tang_s=z[ ,3]
emp_s=z[,4]
reliab_s=z[,5]
loyal_s=z[,6]
retention=z[,7]

#----------------------------------------
#Making Interaction terms
loyaltang=tang_s*loyal_s
loyalemp=emp_s*loyal_s
loyalreliab=reliab_s*loyal_s


#=======================================
#Running Multiple Regression with 
#Interaction Terms

summary(lm(retention~
             tang_s+
             emp_s+
             reliab_s+
             loyal_s+
             loyaltang+
             loyalemp+
             loyalreliab))
#==========================================