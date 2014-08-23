---
title       : Regression on mtcars dataset
subtitle    : 
author      : Sid Amar
job         : 
framework   : io2012        # {io2012, html5slides, shower, dzslides, ...}
highlighter : highlight.js  # {highlight.js, prettify, highlight}
hitheme     : tomorrow      # 
widgets     : []            # {mathjax, quiz, bootstrap}
mode        : selfcontained # {standalone, draft}
knit        : slidify::knit2slides
---

## App concept

1. Use the mtcars dataset to show users how linear regression works
2. Users will attempt to fit a regression line to show the relationship between the milage (miles per gallon) and the weight of the car (in 100s of pounds)
3. The user input will be captured via a slider

--- 

## Summary of the dataset being used

```r
data(mtcars)
summary(mtcars$wt)
```

```
##    Min. 1st Qu.  Median    Mean 3rd Qu.    Max. 
##    1.51    2.58    3.32    3.22    3.61    5.42
```

```r
summary(mtcars$mpg)
```

```
##    Min. 1st Qu.  Median    Mean 3rd Qu.    Max. 
##    10.4    15.4    19.2    20.1    22.8    33.9
```

---

## Best fit line for this dataset
![plot of chunk unnamed-chunk-2](assets/fig/unnamed-chunk-2.png) 

---

##Additional calculations/displays

1. The app also calculates and displays the sum total of the absolute values of residuals
obtained from the user-defined regression model
2. That can be compared against the best fit line's sum of residuals, calculated in the following way:


```r
fit<-lm(mtcars$mpg~I(mtcars$wt*10))
sum(abs(mtcars$mpg-coef(summary(fit))[1]-coef(summary(fit))[2]*(mtcars$wt*10)))
```

```
## [1] 74.9
```

---
