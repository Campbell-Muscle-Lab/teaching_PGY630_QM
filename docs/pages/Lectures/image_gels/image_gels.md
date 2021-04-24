---
title: Image connected components
nav_order: 12
has_children: True
parent: Lectures
---

# Image connected components

## Objectives

+ Recognize the difference between different types of connected components (or "blobs" as they are often called)
+ Explain what a labeled image is
+ List some of the properties that can be used to describe a connected component
+ Recognize that blobs can be filtered according to their properties
+ Recall that the watershed algorithm can be used to separate touching components

## Accessing files

See [GitHub](../../GitHub/GitHub.html) for instructions on how to download the course material to your local computer.

The source files for this lecture are at `<repo>/lectures/image_conncted_components`

## Other useful material

+ [Steve on Image Processing](https://blogs.mathworks.com/steve/)
+ [Digital Image Processing, Gonzalez and Woods](https://www.google.com/books/edition/_/738oAQAAMAAJ?hl=en&gbpv=1)

## Core materials

+ Lecture videos
+ [PowerPoint file](https://github.com/Campbell-Muscle-Lab/teaching_PGY630_QM/blob/da67cf91296464ca27efd4c2c3b139cc3f174da4/lectures/image_connected_components/image_processing_connected_components.pptx)

### Image processing connected components

A video explaining different types of connected components.

<iframe width="560" height="315" src="https://uky.yuja.com/V/Video?v=2946871&node=10201543&a=357543063&preload=false" frameborder="0" webkitallowfullscreen mozallowfullscreen allowfullscreen></iframe>

A demonstration of creating a labeled image.

<iframe width="560" height="315" src="https://uky.yuja.com/V/Video?v=2946864&node=10201531&a=712056749&preload=false" frameborder="0" webkitallowfullscreen mozallowfullscreen allowfullscreen></iframe>

A third video which shows how to extract blob properties (in this case their size and centroid).

<iframe width="560" height="315" src="https://uky.yuja.com/V/Video?v=2946853&node=10201511&a=65441249&preload=false" frameborder="0" webkitallowfullscreen mozallowfullscreen allowfullscreen></iframe>

A demonstration of filtering blobs by size, clearning the image boundary, and identifying the largest blob in an image.

<iframe width="560" height="315" src="https://uky.yuja.com/V/Video?v=2946839&node=10201486&a=1190663258&preload=false" frameborder="0" webkitallowfullscreen mozallowfullscreen allowfullscreen></iframe>

A final video showing how to apply a watershed algorithm to separate a blob into two separate regions.

<iframe width="560" height="315" src="https://uky.yuja.com/V/Video?v=2946841&node=10201489&a=485199923&preload=false" frameborder="0" webkitallowfullscreen mozallowfullscreen allowfullscreen></iframe>