---
title: Non-linear regression
nav_order: 6
has_children: True
parent: Lectures
---

# Non-Linear regression

## Objectives

+ Recall that regression minimizes the sum of squares error
+ Recognize that you can minimize the sum of squares error for any function
+ Write code that fits a user-defined function to data
+ Know that polynomials and splines can be used for interpolation

## Background

Non-linear regression fits curves to data. Common examples include exponentials, Gaussians, and sigmoids.

The underlying principle is the same as we described in [linear_regression](../linear_regression/linear_regression.html)
+ define your function using parameters (e.g. slope and intercept)
+ calculate the sum of squares
+ use optimization to find the combination of parameters that provides the best-fit to your data

These videos should explain the concepts.

## Accessing files

See [GitHub](../../GitHub/GitHub.html) for instructions on how to download the course material to your local computer.

The source files for this lecture are at `<repo>/lectures/non_linear_regression`

## Other useful material

+ [Principles of Regression](https://www.graphpad.com/guides/prism/latest/curve-fitting/reg_principles_of_curve_fitting.htm)
  + the same material as a [book](https://books.google.com/books/about/Fitting_Models_to_Biological_Data_Using.html?id=tIsjh56pI0IC)

## Core materials

+ Lecture videos

### Single exponential

A demo showing how to fit a single exponential decay to experimental data.

<iframe width="560" height="315" src="https://uky.yuja.com/V/Video?v=2699698&node=9648339&a=1239472172&preload=false" frameborder="0" webkitallowfullscreen mozallowfullscreen allowfullscreen></iframe>

### Gaussians

A demo showing how to fit the sum of two Gaussians to data.

<iframe width="560" height="315" src="https://uky.yuja.com/V/Video?v=2699718&node=9648376&a=1791359657&preload=false" frameborder="0" webkitallowfullscreen mozallowfullscreen allowfullscreen></iframe>

### Polynomials and splines

A demo showing how to fit polynomials of different degrees, and finally a spline, to data.

<iframe width="560" height="315" src="https://uky.yuja.com/V/Video?v=2700151&node=9649154&a=1735754697&preload=false" frameborder="0" webkitallowfullscreen mozallowfullscreen allowfullscreen></iframe>

