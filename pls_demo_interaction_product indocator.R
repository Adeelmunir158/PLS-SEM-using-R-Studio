require(plspm)
attach(demo)

ncol(demo)
#Generate Interaction Variable

#Product Indicator Approach
demo$inter1=quality1*sat1
demo$inter2=quality1*sat2
demo$inter3=quality1*sat3
demo$inter4=quality1*sat4
demo$inter5=quality2*sat1
demo$inter6=quality2*sat2
demo$inter7=quality2*sat3
demo$inter8=quality2*sat4
demo$inter9=quality3*sat1
demo$inter10=quality3*sat2
demo$inter11=quality3*sat3
demo$inter12=quality3*sat4
demo$inter13=quality4*sat1
demo$inter14=quality4*sat2
demo$inter15=quality4*sat3
demo$inter16=quality4*sat4
demo$inter17=quality5*sat1
demo$inter18=quality5*sat2
demo$inter19=quality5*sat3
demo$inter20=quality5*sat4
demo$inter21=quality6*sat1
demo$inter22=quality6*sat2
demo$inter23=quality6*sat3
demo$inter24=quality6*sat4


ncol(demo)

quality=c(0,0,0,0)
sat=c(0,0,0,0)
inter=c(0,0,0,0)
loyal=c(1,1,1,0)

x=rbind(quality,sat,inter,loyal)
colnames(x)=rownames(x)
innerplot(x, arr.pos = .3)

out=list(7:12, 18:21, 28:51, 13:17)

#=======================================
#Running model for Product Indicator Approach:
xx=plspm(demo, x, out, scheme="path",
         boot.val =T)

summary(xx)
plot(xx)
#=======================================
#Setting Arrow width
wid=xx$path_coefs
arrow=20*round(wid,2)

#Plot Inner Model
plot(xx, arr.pos = .3, arr.lwd=arrow)
