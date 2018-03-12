#This is the basic start up code for my new research project. I am really excited to work on it.
R=10;C=10   #total number of rows and columns in data
r=2;c=2     #number of row blocks and column blocks
#==========================================================================================
#generate random normal data points with a prespecified mean and variance
#missing values present in the data
sigma=1
dat1=matrix(rnorm(25,1,sigma),nrow=5,ncol=5);dat2=matrix(rnorm(25,-2,sigma),nrow=5,ncol=5)
dat3=matrix(rnorm(25,5,sigma),nrow=5,ncol=5);dat4=matrix(rnorm(25,-5,sigma),nrow=5,ncol=5)
dat=rbind(cbind(dat1,dat2),cbind(dat3,dat4))
id1=matrix(rep(1,25),nrow=5,ncol=5);id2=matrix(rep(2,25),nrow=5,ncol=5)
id3=matrix(rep(3,25),nrow=5,ncol=5);id4=matrix(rep(4,25),nrow=5,ncol=5)
id=rbind(cbind(id1,id2),cbind(id3,id4))
samp_row=sample(1:R,R);samp_col=sample(1:C,C)
train=data.frame(dat[sample(1:R,R),sample(1:C,C)]);id_true=data.frame(id[sample(1:R,R),sample(1:C,C)])
#==========================================================================================
id0_row=sample(c(1:r),R,replace = TRUE,prob=rep(1/r,r))
id0_col=sample(c(1:c),C,replace = TRUE,prob=rep(1/c,c))
id_func=function(rowvec,colvec)
{
  idmat=matrix(0,nrow=R,ncol=C)
  for(i in 1:R)
  {
    for(j in 1:C)
    {
      if(rowvec[i]==1 & colvec[j]==1){idmat[i,j]=1} 
      else if(rowvec[i]==1 & colvec[j]==2){idmat[i,j]=2}
      else if(rowvec[i]==2 & colvec[j]==1){idmat[i,j]=3}
      else{idmat[i,j]=4}
    }
  }
  return(idmat)
}
sigma_prior=10;mu_prior=0
post_var=function(sigma_prior,sigma,n)
{
  prior_prec=1/(sigma_prior^2)
  data_prec=n/(sigma^2)
  return(1/(prior_prec+data_prec))
}
post_mean=function(sigma_prior,mu_prior,sigma,xbar,n)
{
  num=((n*xbar)/(sigma^2))+(mu_prior/(sigma_prior^2))
  den=1/post_var(sigma_prior,sigma,n)
  return(num/den)
}
