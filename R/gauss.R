x = seq(0, 10, length = 200)
y = dnorm(x, mean = 5.5, sd = 1)
plot(x, y, type = "l", lwd = 2, col = "blue", xlab="", ylab="")

for (i in seq(0,6)) abline(v = i, col = "red", lwd = 2, lty = 2)   

abline(v = 5.2, col = "green", lwd = 2, lty = 3)
abline(v = 5.4, col = "green", lwd = 2, lty = 3)
abline(v = 5.5, col = "green", lwd = 2, lty = 3)


