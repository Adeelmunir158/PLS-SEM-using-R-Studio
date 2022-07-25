require(plspm)
attach(demo)

quality=c(0,0,0)
sat=c(1,0,0)
loyal=c(1,1,0)

x=rbind(quality,sat,loyal)
colnames(x)=rownames(x)
innerplot(x, arr.pos = .3)

out=list(7:12, 18:21, 13:17)

#=======================================
#Running model for total:
xx=plspm(demo, x, out, 
         scheme="path", 
         boot.val = T, br=500)
summary(xx)

#Moderation Analysis using bootstrap
plspm.groups(xx, as.factor(gender), 
             method = "bootstrap", 
             reps = 500)

#Moderation Analysis using permutation
plspm.groups(xx, as.factor(gender), 
             method = "permutation", 
             reps = 500)

#=======================================
#Dividing file for boys and girls:

demo_boy=subset(demo, gender=="Boy" )
demo_gal=subset(demo, gender=="Girl")


#=======================================
xx_boy=plspm(demo_boy, x, out, scheme="path", boot.val = T, br=500)
xx_gal=plspm(demo_gal, x, out, scheme="path", boot.val = T, br=500)

plot(xx_boy, arr.pos = .3)
plot(xx_gal, arr.pos = .3)
plot(xx)
