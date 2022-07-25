require(plspm)
attach(demo)

quality=c(0,0,0)
sat=c(1,0,0)
loyal=c(1,1,0)

x=rbind(quality,sat,loyal)
colnames(x)=rownames(x)
innerplot(x)

out=list(7:12, 19:22, 13:17)

xx1=plspm(demo, x, out, scheme="path")
summary(xx1)

#=======================================
#Checking Segments using REBUS
#REBUS= Response Based Unit Segmentation

xx2=rebus.pls(xx1)
xx2
xx2$segments
#Compute PLS Path Model for each class
z=local.models(xx1,xx2)
summary(z$glob.model)
#Output:
summary(z$glob.model)
summary(z$loc.model.1)
summary(z$loc.model.2)



