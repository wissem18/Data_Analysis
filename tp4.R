#exercice1:
phi <- function(x, a) {
  return(0.5 * (x + (a/x)))
}

generate_nth_term <- function(x0, a, n) {
  x <- x0
  for (i in 1:n) {
    x <- phi(x, a)
  }
  return(x)
}

plot_dynamics <- function(x0, a, n) {
  x <- rep(NA, n+1)
  x[1] <- x0
  for (i in 1:n) {
    x[i+1] <- phi(x[i], a)
  }
  plot(x, type="l", main=paste0("Dynamics of φ(x) with a=", a), xlab="n", ylab="x")
  abline(h=sqrt(a), col="red", lty=2)
}

generate_nth_term(1, 4, 4)
plot_dynamics(1,4,10)

#Exercice 2:
library(markovchain)
library(ggplot2)

# Define transition matrix
T <- matrix(c(0.5,0.2,0.3, 0.3,0.4,0.3, 0.2,0.3,0.5), nrow = 3, byrow = TRUE)
rownames(T) <- colnames(T) <- c("red", "green", "blue")

# Define initial state distribution
PX0 <- c(0.2, 0.3, 0.5)

# Define Markov chain
mc <- new("markovchain", states = c("red", "green", "blue"), transitionMatrix = T, name = "MC")

# Simulate 20 states
sim <- rmarkovchain(n = 20, object = mc, t0 = "red")
print(sim)
# Define the sequence
sequence <- sim

# Create a data frame with the sequence and its index
df <- data.frame(State = sequence, Index = 1:length(sequence))

# Plot the sequence
ggplot(df, aes(x = Index, fill = State)) + 
  geom_bar(position = "stack") +
  scale_fill_manual(values = c("red" = "red", "green" = "green", "blue" = "blue")) +
  labs(title = "Sequence of States", x = "Index", y = "Count")