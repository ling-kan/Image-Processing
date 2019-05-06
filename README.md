## Image-Processing


# Task 1 – Interpolation 
Complete the MATLAB script to load the image 'Zebra.jpg' and convert it to grey-scale. Then resize
the image from its original size of 556×612 to an enlarged size of 1668×1836 by interpolation.
Implement both nearest neighbour and bilinear interpolation. Display both re-sized images in your
report. Also add at least one close-up (zoomed-in section) to you report where the difference between
the two interpolation techniques is clear. Discuss the differences you notice between the two
techniques. For this task, you CANNOT use the MATLAB built-in functions ‘imresize’ and ‘interp2’.
However, you CAN use any other built-in function, if necessary.

# Task 2 – Point Processing
Complete the MATLAB script to load the image ‘SC.png’ and apply the following Piecewise-Linear
transformation function to the image. Assume the diagram is drawn according to scale. This
transformation highlights range [A, B], but preserves all other grey levels (identity). You can use the
following values: A=80, B=100, and C=220. For this task, you CAN use any MATLAB built-in
function. Add figures of the original and transformed images to your report.

# Task 3 – Neighbourhood Processing 
Complete the MATLAB script to load the image ‘Noisy.png' and convert it to grey-scale. Then
implement smoothing filters using averaging and median filters with a kernel (mask) size of 5
(neighbourhood of 5×5). Use zero-padding to deal with pixels on the edges of the image. For this
task, you CANNOT use the MATLAB built-in functions ‘fspecial’, ‘imfilter’, ‘conv2’, ‘medfilt2’ and
‘filter2’. However, you CAN use any other built-in function, if necessary. Discuss the differences you
notice between the effects of the application of two filters on the image. Display both filtered images
in your report.

# Task 4 – Object Recognition
Complete the MATLAB script to load the image ‘Starfish.jpg’ and, through a series of image
processing techniques you choose, generate a binary image where zero means no starfish detected and
a non-zero value means that the pixel belongs to a starfish as shown in the figure below. For this task,
you CAN use any built-in function. (Tip: you can separate the starfishes by the area and roundness of
the recognized objects. First estimate each object's area and perimeter. Then use a simple metric
indicating the roundness of an object: metric = 4*pi*area/perimeter^2).
In your report, explain each step you have taken and fully justify the methods you have used.
Illustrate the outcome of each processing stage by adding figure(s) to your report. For example, if you
used a particular type of spatial filtering, you need to explain why you have chosen it and discuss its
effect by showing the figures of the original and filtered images. Add an explanation/interpretation of
your results.
