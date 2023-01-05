## Challenge 2: Logical Paradigm with Prolog.

### Statement

Software must be designed and developed, simulating GIMP or Photoshop. A digital image editing or manipulation software is one that allows a user to perform different operations on them.

### Problem Analysis

The project is worked on RGBD or RGB-D images, that is, images that in addition to having information in the color space (R)ed, (G)reen, (B)lue, contain depth (D) information in a three-dimensional space.

By incorporating the D dimension (depth) captured through a specialized camera, it would be possible to know more about the details of the face, projection of the nose, hat, distance of the mirror at the back, etc. It would even be possible to build a three-dimensional representation of a face.

Some definitions:

* Bitmaps (for images where each pixel or pixbit can take the value 0 or 1).

* Pixmaps (for images where each pixel or pixrgb is a combination of the values for the R, G and B channels, which take values from 0 to 255).

* Hexmaps (where each pixel or pixhex expresses the color information of the pixel through a single hexadecimal value of 6 values).

The x, y, z (depth) dimension must be taken into account.

So we can identify some functionalities:

1. Crop image.
2. Invert image horizontally.
3. Invert image vertically.
4. Compress image based on elimination of the most frequent color.
5. Convert RGB to hexadecimal.
6. Visualize the image.
7. Rotate image 90° to the right.
8. Histogram.
9. Resize image.
10. Decompress image based on restitution of the most frequent color.
11. Apply operations like the above to a selected area within the image.
12. Invert color image.
13. Edit an image by applying special functions to the pixels
14. Separate layers of a 3D image based on depth. In this way, from a 3D image a list of 2D images can be returned

![](https://miro.medium.com/max/1306/1*I0I0QKbcXrvyI2usu-si_Q.webp)


### TDAs

With the analysis of the statement it is concluded that the software contains:
1. TDA image, contains all the features and functionalities of an image. Functions that allow to apply image editing operations such as flipH, flipV, crop, histogram, compress, decompress among others.
2. TDA pixbit, contains all the features and functionalities of a bit type pixel.
3. TDA pixhex, contains all the features and functionalities of a hexadecimal type pixel.
4. TDA pixrgb, contains all the features and functionalities of a RGB type pixel. 


### Documentation

To use the program we need to load the main file to SWI Prolog.

We can generate three types of images with the image command, of type bit, rgb and hexadecimal respectively.

```
pixbit(0,0,1,10,P1),
pixbit(0,1,0,20,P2),
pixbit(1,0,0,30,P3),
pixbit(1,1,1,4,P4),
image(2,2,[P1,P2,P3,P4],Img1).

pixrgb(0,0,10,10,10,10,P1),
pixrgb(0,1,20,20,20,20,P2),
pixrgb(1,0,30,30,30,30,P3),
pixrgb(1,1,40,40,40,40,P4),
image(2,2,[P1,P2,P3,P4],Img2).

pixhex(0,0,"0A0A0A",13,P1),
pixhex(0,1,"141414",24,P2),
pixhex(0,2,"0A0A0A",1,P3),
pixhex(1,0,"1E1E1E",330,P4),
pixhex(1,1,"282828",20,P5),
pixhex(1,2,"1E1E1E",35,P6),
pixhex(2,0,"1E1E1E",3,P7),
pixhex(2,1,"1E1E1E",6,P8),
pixhex(2,2,"1E1E1E",66,P9),
image(3,3,[P1,P2,P3,P4,P5,P6,P7,P8,P9],Img3).

```
For each image we can use different functions such as flipH, flipV, crop, histogram, compress, decompress among others.

```
pixbit(0,0,1,10,P1),
pixbit(0,1,0,20,P2),
pixbit(1,0,0,30,P3),
pixbit(1,1,1,4,P4),
image(2,2,[P1,P2,P3,P4],Img1),
imageFlipH(Img1,R).
```

```
pixhex(0,0,"0A0A0A",13,P1),
pixhex(0,1,"141414",24,P2),
pixhex(0,2,"0A0A0A",1,P3),
pixhex(1,0,"1E1E1E",330,P4),
pixhex(1,1,"282828",20,P5),
pixhex(1,2,"1E1E1E",35,P6),
pixhex(2,0,"1E1E1E",3,P7),
pixhex(2,1,"1E1E1E",6,P8),
pixhex(2,2,"1E1E1E",66,P9),
image(3,3,[P1,P2,P3,P4,P5,P6,P7,P8,P9],Img6),
imageToHistogram(Img6,R).
```

```
pixrgb( 0, 0, 10, 10, 10, 10, P1), 
pixrgb( 0, 1, 20, 20, 20, 20, P2), 
pixrgb( 1, 0, 30, 30, 30, 30, P3), 
pixrgb( 1, 1, 40, 40, 40, 40, P4), 
image(2, 2, [P1, P2, P3, P4], I1), 
imageInvertColorRGB(P2, P2_modificado), 
imageChangePixel(I1, P2_modificado, I2).
```

```
pixrgb(0,0,10,10,10,12,P1),
pixrgb(0,1,20,20,20,21,P2),
pixrgb(0,2,10,10,10,60,P3),
pixrgb(0,3,10,10,10,40,P4),
pixrgb(1,0,30,30,30,30,P5),
pixrgb(1,1,40,40,40,20,P6),
pixrgb(1,2,30,30,30,23,P7),
pixrgb(1,3,30,30,30,11,P8),
pixrgb(2,0,30,30,30,12,P9),
pixrgb(2,1,30,30,30,21,P10),
pixrgb(2,2,30,30,30,34,P11),
pixrgb(2,3,30,30,30,44,P12),
pixrgb(3,0,30,30,30,67,P13),
pixrgb(3,1,30,30,30,31,P14),
pixrgb(3,2,30,30,30,30,P15),
pixrgb(3,3,30,30,30,30,P16),
image(4,4,[P1,P2,P3,P4,P5,P6,P7,P8,P9,P10,P11,P12,P13,P14,P15,P16],Img4),
imageToString(Img4, I).
```

### Software

For this project [SWI Prolog](https://www.swi-prolog.org/pldoc/man?section=typetest) was used . 

