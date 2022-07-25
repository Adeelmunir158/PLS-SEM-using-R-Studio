require(plspm)
attach(demo)

quality=c(0,0,0)
sat=c(0,0,0)
loyal=c(1,1,0)

x=rbind(quality,sat,loyal)
colnames(x)=rownames(x)
innerplot(x)

out=list(7:12, 18:21, 13:17)

xx=plspm(demo, x, out, 
         scheme="path")
#=======================================

#Extract COnstruct Score from the Output
z=xx$scores
z
quality=z[ ,1]
sat=z[,2]
loyal=z[,3]

#Generate the Interaction term
inter=quality*sat
inter

#Run Multiple Regression with Interaction term

summary(lm(loyal~quality+sat+inter))
