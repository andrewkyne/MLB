# MLB Win Curve w/ Logistic Regression Model


library(ggplot2)


# Read data
PlayoffData <- read.csv("~/PlayoffData.csv")


# Fit logistic model
PlayoffModel <- glm(MadePlayoffs ~ Wins, data = PlayoffData, family = binomial)


# Print summary of model
summary(PlayoffModel)


# Predict model
predictions <- predict(PlayoffModel, type = "response")


# Combine data frames
combined <- data.frame(PlayoffData, predictions)


# Write combined data frame to a csv
write.csv(combined, "PlayoffOdds.csv")


# Plot win curve with ggplot2
ggplot(PlayoffModel, aes(x=Wins, y=MadePlayoffs)) +
  geom_point() +
  geom_smooth(method="glm", method.args = list(family = "binomial"), fill="grey60", size=1.18, na.rm=TRUE) +
  xlim(75, 100) + 
  theme_classic()