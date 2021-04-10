---
title: Image processing segmentation
nav_order: 11
has_children: True
parent: Lectures
---

# Image processing segmentation

## Objectives

+ Recognize that segmentation can be used to identify features in an image
+ Distinguish between global and regional thresholding
+ Explain the algorithm underlying Otsu's method for thresholding
+ Use different color-spaces to simplify thresholding

## Accessing files

See [GitHub](../../GitHub/GitHub.html) for instructions on how to download the course material to your local computer.

The source files for this lecture are at `<repo>/lectures/image_processing_segmentation`

## Other useful material

+ [Steve on Image Processing](https://blogs.mathworks.com/steve/)
+ [Digital Image Processing, Gonzalez and Woods](https://www.google.com/books/edition/_/738oAQAAMAAJ?hl=en&gbpv=1)
+ A [blog-post](http://datadriving.blogspot.com/2016/04/image-segmentation-part-1.html) on k-means segmentation

## Core materials

+ Lecture videos
+ PowerPoint file

### Image processing segmentation

A video explaining the basic concept of image segmentation.

<iframe width="560" height="315" src="https://uky.yuja.com/V/Video?v=2912010&node=10125788&a=510631625&preload=false" frameborder="0" webkitallowfullscreen mozallowfullscreen allowfullscreen></iframe>

A demonstration of finding pixel values with intensities above a certain threshold.

<iframe width="560" height="315" src="https://uky.yuja.com/V/Video?v=2912012&node=10125790&a=526362063&preload=false" frameborder="0" webkitallowfullscreen mozallowfullscreen allowfullscreen></iframe>

A third video which explains Otsu's method for automatic thresholding and demonstrates adaptive background correction to allow for changes in overall brightness.

<iframe width="560" height="315" src="https://uky.yuja.com/V/Video?v=2912046&node=10125842&a=1585801766&preload=false" frameborder="0" webkitallowfullscreen mozallowfullscreen allowfullscreen></iframe>

A video showing how to use MATLAB's Color Segmenter App to explore whether different features are easier to segment in non RGB color spaces.