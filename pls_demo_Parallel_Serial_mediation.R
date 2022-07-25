require(plspm)
attach(demo)


quality=c(0,0,0,0)
sat=c(1,0,0,0)
loyal=c(1,0,0,0)
behint=c(1,1,1,0)

x=rbind(quality,sat,loyal, behint)
colnames(x)=rownames(x)
innerplot(x, arr.pos = .8)

out=list(7:12, 18:21, 13:17, 22:27)
mode=c("A","A","A")

xx=plspm(demo, x, out, 
         scheme="path", 
         boot.val = T, 
         br=500)

#====================================
#Output:

#All Output
summary(xx)

#=====================================

#Graphical Representation
plot(xx)
plot(xx, arr.pos = .8)

#-------------------------------------
#Setting Arrow width
wid=xx$path_coefs

arrow=20*round(wid,2)

#Plot Inner Model
plot(xx, arr.pos = .8, arr.lwd=arrow)

#-------------------------------------
#Plot Outer Model
plot(xx, what="loadings", 
     arr.width=0.5, arr.pos = .7)

#-------------------------------------
#Plot Direct & Indirect Effects
xx$effects
effect=as.matrix(xx$effects[ ,2:3])
rownames(effect)=xx$effects[ ,1]
z=round(effect,2)
z
b=barplot(t(z), beside = T, col=c(4,6),
        legend=c("Direct","Indirect"), 
        ylim=c(0,0.6), las=1)
text(t(b), z+.01, z, pos=3, cex = .9)
box()
#=====================================

#All Model details
xx$model

#Original Data
print(xx$data, digits = 2)

#Standardized Construct Scores
print(xx$scores, digits = 2)

#------------------------------------
#Goodness of Fit
print(xx$gof, digits = 2)

#------------------------------------

#Measurement Model

#Weights and Loadings
print(xx$outer_model,digits=2)

#Convergent Validity
print(xx$unidim, digits = 2)

#R-Square & AVE
print(xx$inner_summary, digits = 2)

#Discriminant Validity
print(xx$crossloadings, digits = 2)
#------------------------------------

#Structural Model

#Regression Result
print(xx$inner_model, digits = 2)

#Beta
print(xx$path_coefs,digits=2)

#Direct and Indirect Effects
print(xx$effects, digits = 2)
