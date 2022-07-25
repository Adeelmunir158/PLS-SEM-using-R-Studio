library(devtools)
install_github("gastonstat/plspm")

require(plspm)

attach(demo)

quality=c(0,0,0)
sat=c(0,0,0)
loyal=c(1,1,0)

x=rbind(quality,sat,loyal)
colnames(x)=rownames(x)
innerplot(x)

out=list(7:12, 19:22, 13:17)
mode=c("A","A","A")

xx=plspm(demo, x, out, scheme="path", boot.val = T, br=500)

#=======================================
#Output:

#All Output
summary(xx)

#==========================================

#Graphical Representation
#Plot Inner Model
plot(xx)

#Plot Outer Model
plot(xx, what="loadings", arr.width=0.5)

#==========================================

#All Model details
xx$model

#Original Data
print(xx$data, digits = 2)

#Standardized Construct Scores
print(xx$scores, digits = 2)

#--------------------------------------
#Goodness of Fit
print(xx$gof, digits = 2)

#--------------------------------------

#Measurement Model

#Weights and Loadings
print(xx$outer_model,digits=2)

#Convergent Validity
print(xx$unidim, digits = 2)

#R-Square & AVE
print(xx$inner_summary, digits = 2)

#Discriminant Validity
print(xx$crossloadings, digits = 2)
#-------------------------------------

#Structural Model

#Regression Result
print(xx$inner_model, digits = 2)

#Beta
print(xx$path_coefs,digits=2)

#Direct and Indirect Effects
print(xx$effects, digits = 2)


