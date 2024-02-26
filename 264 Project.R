##################################################
################ Math 264 Project ################
##################################################
install.packages("tolerance")
library(tolerance)
library(LaplacesDemon)
set.seed(1)

# Randomly sample questions
a=sample(184, 30)
sort(a)

# 1. Conjugate Prior
# (1) ChatGPT 3.5
f<-function(a) { pbeta(0.83, a, (3/7)*a+4/7) - pbeta(0.1,  a, (3/7)*a+4/7) - 0.95}
curve(f,xname="a", from=1,to=10)
abline(h=0, lty=3)

a<- uniroot(f, interval = c(1,20), tol=1e-6, check.conv=TRUE, maxiter = 100)
a
(3/7)*15.55664+4/7 # beta
15.55664+(3/7)*15.55664+4/7-2 #t0

# (2) Bard
f<-function(a) { pbeta(0.83, a, 1.5*a) - pbeta(0.1,  a, 1.5*a) - 0.95}
curve(f,xname="a", from=1,to=10)
abline(h=0, lty=3)

a<- uniroot(f, interval = c(1,20), tol=1e-6, check.conv=TRUE, maxiter = 100)
a
1.5*2.313077 # beta
2.313077+1.5*2.313077-2

# 2. Plot Conjugate Prior & Posterior: ChatGPT & Bard
par(mfrow=c(1,2)) 
#Define range
p = seq(0,1, length=100)

# (1) ChatGPT 3.5
# Plot Conjugate Prior
plot(p, dbeta(p, 15.56,7.24), ylab='Density', type ='l', col='red',yaxt="n",
     xlab='Proportion of SAT Math Problems are Answered Correctly',
     main = 'Prior & Posterior Distribution of Theta: ChatGPT 3.5',
     cex.lab=1.2,
     cex.main=1.5,
     cex.axis=1,
     ylim=c(0, 7.5))
abline(v=14.56/(15.56+7.24-2), lty=5, col='red')
axis(1, at=14.56/(15.56+7.24-2),labels=round(14.56/(15.56+7.24-2), 2), col = 'red', col.axis='red',lwd.ticks=5)

# Plot Posterior
lines(p, dbeta(p, 41.56, 11.24), col='blue') 
abline(v=40.56/(41.56+11.24-2), lty=5, col='blue')
axis(1, at=40.56/(41.56+11.24-2),labels=round(40.56/(41.56+11.24-2), 2), 
     col = 'blue', col.axis='blue',lwd.ticks=5)

legend("topleft",legend=c('Conjugate Prior','Posterior'), 
       lty=c(1,1),col=c('red', 'blue'), cex=1)

# (2) Bard
# Plot Conjugate Prior
plot(p, dbeta(p, 2.31,3.47), ylab='Density', type ='l', col='red',yaxt="n",
     xlab='Proportion of SAT Math Problems are Answered Correctly',
     main = 'Prior & Posterior Distribution of Theta: Bard',
     cex.lab=1.2,
     cex.main=1.5,
     cex.axis=1,
     ylim=c(0, 5))
abline(v=1.31/(2.31+3.47-2), lty=5, col='red')
axis(1, at=1.31/(2.31+3.47-2),labels=round(1.31/(2.31+3.47-2), 2), col = 'red', col.axis='red',lwd.ticks=5)

# Plot Posterior
lines(p, dbeta(p, 19.31, 16.47), col='blue') 
abline(v=18.31/(19.31+16.47-2), lty=5, col='blue')
axis(1, at=18.31/(19.31+16.47-2),labels=round(18.31/(19.31+16.47-2), 2), 
     col = 'blue', col.axis='blue',lwd.ticks=5)

legend("topleft",legend=c('Conjugate Prior','Posterior'), 
       lty=c(1,1),col=c('red', 'blue'), cex=1)

# 3. Summarizing Posterior Uncertainty
set.seed(1)
# (1) ChatGPT 3.5
# 95% HPD
post.sample <-rbeta(500000, 41.56, 11.24)
p.interval(post.sample, HPD=TRUE, MM=FALSE, prob=0.95)

# Posterior mode
40.56/50.8

# (2) Bard
# 95% HPD
post.sample <-rbeta(500000, 19.31, 16.47)
p.interval(post.sample, HPD=TRUE, MM=FALSE, prob=0.95)

# Posterior mode
18.31/33.78

# (3) Plot Two posteriors together & 95% HPD credible region
par(mfrow=c(1,1)) 
plot(p, dbeta(p, 41.56, 11.24), ylab='Density', type ='l', col='red',yaxt="n",
     xlab='Proportion of SAT Math Problems are Answered Correctly',
     main = '95% HPD Credible Regions: ChatGPT 3.5 & Bard',
     cex.lab=1.2,
     cex.main=1.5,
     cex.axis=1,
     ylim=c(0, 7.5),
     xlim=c(0.2, 1))
abline(v=0.6778, lty=5, col='red')
abline(v=0.9121, lty=5, col='red')
lines(x=c(0.6778,0.9121), y=c(7.15,7.15), col='blue', lty=5)
text(x=0.8, y=7.3, labels='95% HPD CR: ChatGPT 3.5', col='red', font=10)
axis(1, at=0.6778,labels=round(0.6778, 2), col = 'red', col.axis='red',lwd.ticks=5)
axis(1, at=0.9121,labels=round(0.9121, 2), col = 'red', col.axis='red',lwd.ticks=5)
lines(x=c(40.56/(41.56+11.24-2), 40.56/(41.56+11.24-2)), y=c(0,7.15), col='red', lty=5)
axis(1, at=40.56/(41.56+11.24-2),labels=round(40.56/(41.56+11.24-2), 2), 
     col = 'blue', col.axis='blue',lwd.ticks=5)

lines(p, dbeta(p, 19.31, 16.47), col='blue') 
abline(v=0.4304, lty=5, col='blue')
abline(v=0.6482, lty=5, col='blue')
lines(x=c(0.4304,0.6482), y=c(7.15,7.15), col='blue', lty=5)
text(x=0.54, y=7.3, labels='95% HPD CR: Bard', col='blue', font=10)
axis(1, at=0.4304,labels=round(0.4304, 2), col = 'blue', col.axis='blue',lwd.ticks=5)
axis(1, at=0.6482,labels=round(0.6482, 2), col = 'blue', col.axis='blue',lwd.ticks=5)
lines(x=c(18.31/(19.31+16.47-2), 18.31/(19.31+16.47-2)), y=c(0, 4.75), col='blue', lty=5)
axis(1, at=18.31/(19.31+16.47-2),labels=round(18.31/(19.31+16.47-2), 2), 
     col = 'blue', col.axis='blue',lwd.ticks=5)
legend("topleft",legend=c('ChatGPT 3.5 Posterior','Bard Posterior'), 
       lty=c(1,1),col=c('red', 'blue'), cex=1)

# 4. Model Checking
# (1) Method 1: Posterior Predictive Distribution vs. Observation
set.seed(1)
par(mfrow=c(1,2)) 
n.sim <- 5000

# ChatGPT 3.5
# Simulate Replicated Data
theta <- rbeta(n.sim, shape1=41.56, shape2 = 11.24)
y.rep <- t(sapply(theta, function(p) rbinom(30, 1, p)))

# Calculate the number of success from the replicated data
t.rep.y <- sapply(1:n.sim, function(s) sum(y.rep[s,]))

hist(t.rep.y , probability = TRUE,
     breaks = c(5:30),
     xlim = range(c(5:30)),
     xlab='Number of Questions',
     ylab="Proportion",
     main = "Posterior Predictive Distribution: ChatGPT 3.5")
abline(v=26, lty=3, col='red', lwd=3)
axis(1, at=26,labels=26, col = 'red', col.axis='red',lwd.ticks=3)
text(x=25.5, y=0.08, labels='Observed', col='red', srt=90)

# Bard
# Simulate Replicated Data
theta <- rbeta(n.sim, shape1=19.31, shape2 = 16.47)
y.rep <- t(sapply(theta, function(p) rbinom(30, 1, p)))

# Calculate the number of success from the replicated data
t.rep.y <- sapply(1:n.sim, function(s) sum(y.rep[s,]))

hist(t.rep.y , probability = TRUE,
     breaks = c(0:30),
     xlim = range(c(0:30)),
     xlab='Number of Questions',
     ylab="Proportion",
     main = "Posterior Predictive Distribution: Bard")
abline(v=17, lty=3, col='red', lwd=3)
axis(1, at=17,labels=17, col = 'red', col.axis='red',lwd.ticks=3)
text(x=16.5, y=0.06, labels='Observed', col='red', srt=90)

# (2) Method 2: Posterior Predictive Distribution vs. Observation
set.seed(1)
par(mfrow=c(1,2)) 
n.sim <- 5000

# ChatGPT 3.5
# Simulate Replicated Data
theta <- rbeta(n.sim, shape1=41.56, shape2 = 11.24)
y.rep <- t(sapply(theta, function(p) rbinom(30, 1, p)))

# Calculate the average success from the replicated data
t.rep.dummy <- sapply(1:n.sim, function(s) sum(y.rep[s,]))
mean(t.rep.dummy)

# Bard
# Simulate Replicated Data
theta <- rbeta(n.sim, shape1=19.31, shape2 = 16.47)
y.rep <- t(sapply(theta, function(p) rbinom(30, 1, p)))

# Calculate the number of success from the replicated data
t.rep.dummy<- sapply(1:n.sim, function(s) sum(y.rep[s,]))
mean(t.rep.dummy)

xlabels <- c("Failure", "Success")
par(mfrow=c(1,2))
chat <- matrix(c(4, 26, 6, 24), nrow = 2, ncol = 2, byrow = TRUE)
bp <- barplot(chat, beside = TRUE, ylim = c(0, 30), main = "ChatGPT 3.5", names.arg = xlabels, col = c("red", "blue"))
text(bp,chat+1,labels=as.character(chat), cex = 1.5)
legend("topleft",legend=c('Observation','Average Posterior Predictive'), fill = c("red", "blue"), cex=0.9)

bard <-matrix(c(13, 17, 14, 16), nrow = 2, ncol = 2, byrow = TRUE)
bp<-barplot(bard, beside = TRUE, ylim = c(0, 30), main = "Bard", names.arg = xlabels, col = c("red", "blue"))
text(bp,bard+1,labels=as.character(bard), cex = 1.5)
legend("topleft",legend=c('Observation','Average Posterior Predictive'), fill = c("red", "blue"), cex=0.9)

# (3) Sensitivity Analysis
# A. Quartile Comparison
p <- c(0.25, 0.5, 0.75, 0.8)

# ChatGPT 3.5
conjugate.post.quartile <- qbeta(p = p, shape1 = 41.56, shape2 = 11.24)
jeffreys.post.quartile <- qbeta(p = p, shape1 = 26.5, shape2 = 4.5)

conjugate.post.quartile
jeffreys.post.quartile

# Bard
conjugate.post.quartile <- qbeta(p = p, shape1 = 19.31, shape2 = 16.47)
jeffreys.post.quartile <- qbeta(p = p, shape1 = 17.5, shape2 = 13.5)

conjugate.post.quartile
jeffreys.post.quartile

pbeta(c(0, 0.8), 41.56, 11.24)
pbeta(c(0, 0.8), 26.5, 4.5)
pbeta(c(0, 0.8), 19.31, 16.47)
pbeta(c(0, 0.8), 17.5, 13.5)

# B. Prior and Posterior comparison
# Define range
par(mfrow=c(2,2)) 
p = seq(0,1, length=100)

# ChatGPT 3.5
# Plot Conjugate Prior
plot(p, dbeta(p, 15.56,7.24), ylab='Density', type ='l', col='red',yaxt="n",
     xlab='Proportion of SAT Math Problems are Answered Correctly',
     main = 'Conjugate vs. Jeffreys Prior: ChatGPT 3.5',
     cex.lab=1.2,
     cex.main=1.5,
     cex.axis=1,
     ylim=c(0, 5))
abline(v=14.56/20.8, lty=3, col='red', lwd=2)
axis(1, at=14.56/20.8,labels=round(14.56/20.8, 2), col = 'red', col.axis='red',lwd.ticks=2)

# Plot Jeffreys Prior
lines(p, dbeta(p, 0.5, 0.5), col='blue')
abline(v=0.1, lty=3, col='blue', lwd=2)
abline(v=0.9, lty=3, col='blue', lwd=2)
axis(1, at=0.1,labels=0.1, col = 'blue', col.axis='blue',lwd.ticks=2)
axis(1, at=0.9,labels=0.9, col = 'blue', col.axis='blue',lwd.ticks=2)
legend("topleft",legend=c('Conjugate Prior','Jeffreys Prior'), 
       lty=c(1,1),col=c('red', 'blue'), cex=1)

# Plot Conjugate Posterior
plot(p, dbeta(p, 41.56, 11.24), ylab='Density', type ='l', col='red',yaxt="n",
     xlab='Proportion of SAT Math Problems are Answered Correctly',
     main = 'Conjugate vs. Jeffreys Posterior: ChatGPT 3.5',
     cex.lab=1.2,
     cex.main=1.5,
     cex.axis=1,
     ylim=c(0, 8),
     xlim=c(0, 1))
abline(v=40.56/50.8, lty=3, col='red', lwd=2)
axis(1, at=40.56/50.8,labels=round(40.56/50.8, 2), col = 'red', col.axis='red',lwd.ticks=2)

# Plot Jeffreys Posterior
lines(p, dbeta(p, 26.5, 4.5), col='blue') 
abline(v=25.5/29, lty=3, col='blue', lwd=2)
axis(1, at=25.5/29,labels=round(25.5/29, 2), col = 'blue', col.axis='blue',lwd.ticks=2)
legend("topleft",legend=c('Conjugate Posterior','Jeffreys Posterior'), 
       lty=c(1,1),col=c('red', 'blue'), cex=1)

# Bard
# Plot Conjugate Prior
plot(p, dbeta(p, 2.31, 3.47), ylab='Density', type ='l', col='red',yaxt="n",
     xlab='Proportion of SAT Math Problems are Answered Correctly',
     main = 'Conjugate vs. Jeffreys Prior: Bard',
     cex.lab=1.2,
     cex.main=1.5,
     cex.axis=1,
     ylim=c(0, 5))
abline(v=1.31/3.78, lty=3, col='red', lwd=2)
axis(1, at=1.31/3.78,labels=round(1.31/3.78, 2), col = 'red', col.axis='red',lwd.ticks=2)

# Plot Jeffreys Prior
lines(p, dbeta(p, 0.5, 0.5), col='blue')
abline(v=0.1, lty=3, col='blue', lwd=2)
abline(v=0.9, lty=3, col='blue', lwd=2)
axis(1, at=0.1,labels=0.1, col = 'blue', col.axis='blue',lwd.ticks=2)
axis(1, at=0.9,labels=0.9, col = 'blue', col.axis='blue',lwd.ticks=2)
legend("topleft",legend=c('Conjugate Prior','Jeffreys Prior'), 
       lty=c(1,1),col=c('red', 'blue'), cex=1)

# Plot Conjugate Posterior
plot(p, dbeta(p, 19.31, 16.47), ylab='Density', type ='l', col='red',yaxt="n",
     xlab='Proportion of SAT Math Problems are Answered Correctly',
     main = 'Conjugate vs. Jeffreys Posterior: Bard',
     cex.lab=1.2,
     cex.main=1.5,
     cex.axis=1,
     ylim=c(0, 8),
     xlim=c(0, 1))
abline(v=18.31/33.78, lty=3, col='red', lwd=2)
text(x=0.52, y=2, labels='0.54', col='red', srt=90)

# Plot Jeffreys Posterior
lines(p, dbeta(p, 17.5, 13.5), col='blue') 
abline(v=16.5/29, lty=3, col='blue', lwd=2)
text(x=0.59, y=2, labels='0.57', col='blue', srt=90)
legend("topleft",legend=c('Conjugate Posterior','Jeffreys Posterior'), 
       lty=c(1,1),col=c('red', 'blue'), cex=1)

# 5. Posterior Difference
# (1) Calculate pdf of theta.diff where theta.diff = beta(a1, b1) - beta(a2, b2)
beta.diff <- function(theta_list, a1, b1, a2, b2){
  results <- numeric(length(theta_list))
  # Do logarithm when calculate parts since some numbers are hard to calculate
  # if not use log-form
  logA <- lbeta(a1, b1) + lbeta(a2, b2)
  for(i in 1:length(theta_list)){
    if(theta_list[i] > 0 && theta_list[i] <= 1){
      results[i] <- (lbeta(a2, b1) +
                       (b1+b2-1)*log(theta_list[i]) +
                       (a2+b1-1)*log(1-theta_list[i]) +
                       log(F1(b1, a1+b1+a2+b2-2, 1-a1, b1+a2, (1-theta_list[i]), (1-theta_list[i]^2))) -
                       logA)
    } else if(theta_list[i] >= -1 && theta_list[i] < 0){
      results[i] <- (lbeta(a1, b2) +
                       (b1+b2-1)*log(-theta_list[i]) +
                       (a1+b2-1)*log(1+theta_list[i]) +
                       log(F1(b2, 1-a2, a1+a2+b1+b2-2, a1+b2, (1-theta_list[i]^2), (1+theta_list[i]))) -
                       logA)
    } else {
      results[i] <- (lbeta(a1+a2-1, b1 + b2 -1) - logA)
    }
  }
  # Do exponential to get the correct values.
  return(exp(results))
}

theta_list = seq(-1, 1, 0.01)
beta.diff.values = beta.diff(theta_list, 41.56, 11.24, 19.31, 16.47)

# (2) Mathematical 95% HPD
set.seed(1)
X = runif(5000, -1, 1)
Y = runif(length(X))

pdf.samples <- c()
for (i in 1:length(Y)) {
  p.X = beta.diff(X[i], 41.56, 11.24, 19.31, 16.47)
  if (Y[i] <= p.X) {
    pdf.samples <- c(pdf.samples, X[i])
  }
}
p.interval(pdf.samples, prob = 0.95)

# (3) p(posterior difference>0.2)
install.packages('nor1mix')
library(nor1mix)

cdf_list = pdf2cdf(p=beta.diff.values, x=theta_list)
1-cdf_list$y[match(c(TRUE), theta_list>0.09999999)]
1-cdf_list$y[match(c(TRUE), theta_list>0.19999999)]
1-cdf_list$y[match(c(TRUE), theta_list>0.29999999)]

# (4) Plot theta difference: mathematical vs. monte carlos simulation
par(mfrow=c(1, 1)) 

plot(theta_list, beta.diff.values, xlim = c(-0.1, 0.6), ylim = c(0, 4.5),
     ylab = 'Density',
     xlab = 'Theta.C-Theta.B',
     main='95% HPD Credible Region of Theta.C-Theta.B')
abline(v=0.02979929, lty=5, col='red')
text(x=0.02, y=2, labels='0.03', col='red', srt=90)
abline(v=0.4978863, lty=5, col='red')
text(x=0.485, y=2, labels='0.498', col='red', srt=90)
lines(x=c(0.02979929,0.4978863), y=c(4.1,4.1), col='red', lty=5)
text(x=0.2638428, y=4.2, labels='95% HPD', col='red', font=10)