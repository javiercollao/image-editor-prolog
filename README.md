## Desafío 2: Paradigma Lógico con Prolog

### Enunciado

Se debe diseñar y desarrollar un software, simulando a GIMP ó Photoshop, Un software de edición o manipulación de imágenes digitales es aquel que permite a un usuario realizar distintas operaciones sobre éstas.

### Análisis del problema

El proyecto se trabaja en imágenes RGBD o RGB-D, esto es, imágenes que además de tener información en el espacio de colores (R)ed, (G)reen, (B)lue, contiene información de la profundidad (D)epth en un espacio tridimensional. 

Al incorporar la dimensión D (profundidad) capturada a través de una cámara especializada, sería posible saber más sobre los detalles del rostro, proyección de la nariz, sombrero, distancia del espejo en la parte posterior, etc. Incluso sería posible construir una representación tridimensional de un rostro.

Algunas definiciones

* bitmaps (para imágenes donde cada pixel o pixbit puede tomar el valor  0 o 1), A bitmap is a simple black and white image, stored as a 2D array of bits (ones and zeros).

* pixmaps (para imágenes donde cada pixel o pixrgb es una combinación de los valores para los canales R, G y B, que toman valores de 0 a 255)

* hexmaps-d (donde cada pixel o pixhex expresa la información del color del pixel a través de un valor único hexadecimal de 6 valores) 

Se debe considerar la dimensión x, y, z (depth).
 
Por lo que podemos identificar algunas funcionalidades 

1. Recortar imágen
2. Invertir una imágen horizontalmente
3. Invertir una imágen verticalmente
4. Comprimir imágen en base a eliminación del color con mayor frecuencia.
5. Convertir a hexadecimal
6. Visualizar la imagen
7. Rotar imágen en 90° a la derecha
8. Rotar imágen en 90° a la izquierda
9. Histograma
10. Descomprimir imagen en base a restitución del color con mayor frecuencia
11. Aplicar operaciones como las anteriores a un área seleccionada dentro de la imagen
12. Convertir imágen a blanco y negro
13. Convertir imágen a escala de grises
14. Editar una imágen a partir de la aplicación de funciones especiales sobre los pixeles
15. Separar capas de una imagen 3D en base a la profundidad. De esta forma desde una imagen 3D se puede devolver una lista de imágenes 2D
16. Redimensionar imágen




![](https://miro.medium.com/max/1306/1*I0I0QKbcXrvyI2usu-si_Q.webp)




### TDAs

A partir del enenunciado se concluye que el programa contiene los siguientes TDAs:

1. TDA image, contiene todas las caractericas y funcionalidades de una imagen.
2. TDA pixbit, contiene todas las caractericas y funcionalidades de una pixel tipo bit.
3. TDA pixhex, contiene todas las caractericas y funcionalidades de una pixel tipo héxadecimal.
4. TDA pixrgb, contiene todas las caractericas y funcionalidades de una pixel tipo RGB.

### Documentación

Podemos generar tres tipos de imágenes con el comando image, de tipo bit, rgb y hexadecimal respectivamente.

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
Para cada imagen podemos utilizar diferentes funciones como imageFlipH, imageFlipV, imageCrop, imageToHistogram, imageCompress, imageDecompress, entre otras.

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

Para este proyecto es necesario utilizar [SWI Prolog](https://www.swi-prolog.org/pldoc/man?section=typetest). 

