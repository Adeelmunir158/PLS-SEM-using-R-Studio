require(plspm)
attach(hoc)

int=    c(0,0,0,0)
ext=    c(0,0,0,0)
comm=   c(1,1,0,0)
reten=  c(0,0,1,0)

path=rbind(int,ext, comm,reten)
colnames(path)=rownames(path)
innerplot(path)

b=list(1:3,4:6,1:6,7:11)
m=c("A","A","B","A")
p=plspm(hoc, path, b, m, 
        boot.val = T, br=1000 )

summary(p)
