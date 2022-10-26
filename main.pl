% ======================================================
%  @title      TDA lista
%  @author     Javier Collao
%
%  @desc       Este TDA representa lista 
%


% member()
% es map
% call()
 


% ======================================================
%  @title      TDA pixbit
%  @author     Javier Collao
%
%  @desc       Este TDA representa a la lista pixbit
%  pixbit = x (int) X y (int) X bit ([0|1]) X depth (int)
%

%  Dominios
%  PosX    : Integer
%  PosY    : Integer 
%  Bit     : Integer [0 ; 1]
%  Depth   : Integer
%  PixBit  : List
%  Predicados: 
%  pixbit(PosX, PosY, Bit, Depth, PixbitList) aridad = 5
%  Metas Primarias: pixbit
%  Metas Secundarias: NA
%  Clausulas

pixbit(PosX, PosY, Bit, Depth, [PosX, PosY, Bit, Depth]).

% ======================================================
%  @title      TDA pixhex
%  @author     Javier Collao
%
%  @desc Este TDA representa a la lista pixhex
%   pixhex = x (int) X y (int) X hex(String) X d (int)
%

%  Dominios
%  PosX    : Integer
%  PosY    : Integer 
%  Hex     : String
%  Depth   : Integer
%  Pixhex  : List
%  Predicados
%  pixhex(PosX, PosY, Hex, Depth, Pixhex) aridad = 5
%  Metas Primarias: pixhex
%  Metas Secundarias: NA
%  Clausulas

pixhex(PosX, PosY, Hex, Depth, [PosX, PosY, Hex, Depth]).

% ======================================================
%  @title      TDA pixrgb
%  @author     Javier Collao
%
%  @desc       Este TDA representa a la lista pixrgb-d
%  pixrgb = x (int) X y (int) X r (C) X g (C) X b(C) X d (int)
%

%  Dominios
%  PosX    : Integer
%  PosY    : Integer 
%  R       : Integer (0 <= R <= 255)
%  G       : Integer (0 <= G <= 255)
%  B       : Integer (0 <= B <= 255)
%  Depth   : Integer
%  PixRgb  : List
%  Predicados
%  pixrgb(PosX, PosY, R, G, B, Depth, PixRgb) aridad = 7
%  Metas Primarias 
%  Metas Secundarias  
%  Clausulas

pixrgb(PosX, PosY, R, G, B, Depth, [PosX, PosY, R, G, B, Depth]).

% ======================================================
%  @title      TDA image
%  @author     Javier Collao
%
%  @desc        Este TDA representa a la lista image, contiene todas las 
%  características para las creación  de una imagen.
%
%  image = Width (int) X Height (int) X [pixbit* | pixrgb* | pixhex*]
%

%  Dominios
%  Width    : Integer
%  Height   : Integer
%  Pixels   : Lists
%  image    : List
%  Predicados
%  image(Width, Height, Pixels, Image) aridad = 4
%  Metas Primarias: image
%  Metas Secundarias: NA
%  Clausulas

image(Width, Height, Pixels, [Width, Height, Pixels]).

% imageIsBitmap
%  Dominios
%  image    : List
%  Predicados
%  imageIsBitmap(Image) aridad = 1
%  Metas Primarias: imageIsBitmap
%  Metas Secundarias: image, pixelsAreBitmap, pixelIsPixbit
%  Clausulas

pixelIsPixbit(Pixel):-
    pixbit(_,_,Bit,_,Pixel),
    (Bit == 0 ; Bit == 1).

pixelsAreBitmap([]).

pixelsAreBitmap([Pixel | Pixels]):-
    pixelIsPixbit(Pixel),
    pixelsAreBitmap(Pixels).

imageIsBitmap(Image):-
    image(_,_,Pixels,Image),
    pixelsAreBitmap(Pixels).

% imageIsPixmap
%  Dominios
%  image    : List
%  Predicados
%  imageIsPixmap(Image) aridad = 1
%  Metas Primarias: imageIsPixmap
%  Metas Secundarias: image, pixelsArePixmap, pixelIsPixrgb
%  Clausulas

pixelIsPixrgb(Pixel):-
    pixrgb(_,_,R,G,B,_,Pixel),
    R =< 255, R >= 0,
    G =< 255, G >= 0,
    B =< 255, B >= 0.

pixelsArePixmap([]).

pixelsArePixmap([Pixel | Pixels]):-
    pixelIsPixrgb(Pixel),
    pixelsArePixmap(Pixels).

imageIsPixmap(Image):-
    image(_,_,Pixels,Image),
    pixelsArePixmap(Pixels).

% imageIsHexmap
%  Dominios
%  image    : List
%  Predicados
%  imageIsHexmap(Image) aridad = 1
%  Metas Primarias: imageIsHexmap
%  Metas Secundarias: image, pixelsAreHexmap, pixelIsPixhex, string, atom_length
%  Clausulas

pixelIsPixhex(Pixel):-
    pixbit(_,_,Hex,_,Pixel),
    string(Hex),
    atom_length(Hex,6).

pixelsAreHexmap([]).

pixelsAreHexmap([Pixel | Pixels]):-
    pixelIsPixhex(Pixel),
    pixelsAreHexmap(Pixels).

imageIsHexmap(Image):-
    image(_,_,Pixels,Image),
    pixelsAreHexmap(Pixels).

% imageIsCompressed



% imageFlipH
%  Dominios
%  imageIn    : List
%  imageOut	  : List
%  Predicados
%  imageFlipH(ImageIn, ImageOut) aridad = 2
%  Metas Primarias: imageFlipH
%  Metas Secundarias: image, imageIsBitmap, imageIsPixmap, pixelsFlipHbit, pixelsFlipHrgb, pixelsFlipHhex, pixelFlipHbit, pixelFlipHrgb, pixelFlipHhex, pixbit, pixrgb, pixhex
%  Clausulas



pixelFlipHbit(Width, PixelIn, PixelOut):-
    pixbit(PosX, PosY, Bit, Depth, PixelIn),
    W is Width-1,
    (   PosX = W
    ->  NewX is 0
    ;	 (   PosX = 0
         ->   NewX is W
         ;    NewX is W-PosX
         )
    ),
    pixbit(NewX, PosY, Bit, Depth, PixelOut).

pixelFlipHrgb(Width, PixelIn, PixelOut):-
    pixrgb(PosX, PosY, R, G, B, Depth, PixelIn),
    W is Width-1,
    (   PosX = W
    ->  NewX is 0
    ;	 (   PosX = 0
         ->   NewX is W
         ;    NewX is W-PosX
         )
    ),
    pixrgb(NewX, PosY, R, G, B, Depth, PixelOut).

pixelFlipHhex(Width, PixelIn, PixelOut):-
    pixhex(PosX, PosY, Hex, Depth, PixelIn),
    W is Width-1,
    (   PosX = W
    ->  NewX is 0
    ;	 (   PosX = 0
         ->   NewX is W
         ;    NewX is W-PosX
         )
    ),
    pixhex(NewX, PosY, Hex, Depth, PixelOut).

pixelsFlipHbit(_,[],[]).
pixelsFlipHbit(Width, [PixelIn | PixelsIn], [PixelOut | PixelsOut]):-
    pixelFlipHbit(Width, PixelIn, PixelOut),
    pixelsFlipHbit(Width, PixelsIn, PixelsOut).

pixelsFlipHrgb(_,[],[]).
pixelsFlipHrgb(Width, [PixelIn | PixelsIn], [PixelOut | PixelsOut]):-
    pixelFlipHrgb(Width, PixelIn, PixelOut),
    pixelsFlipHrgb(Width, PixelsIn, PixelsOut).

pixelsFlipHhex(_,[],[]).
pixelsFlipHhex(Width, [PixelIn | PixelsIn], [PixelOut | PixelsOut]):-
    pixelFlipHhex(Width, PixelIn, PixelOut),
    pixelsFlipHhex(Width, PixelsIn, PixelsOut).

imageFlipH(ImageIn, ImageOut):-
    image(Width, Height, PixelsIn, ImageIn),
    (   imageIsBitmap(ImageIn)
    ->  pixelsFlipHbit(Width, PixelsIn, PixelsOut)
    ;   (   imageIsPixmap(ImageIn)
        ->  pixelsFlipHrgb(Width, PixelsIn, PixelsOut)
        ;   pixelsFlipHhex(Width, PixelsIn, PixelsOut)
        )
    ),
    image(Width, Height,PixelsOut, ImageOut).

% imageFlipV
%  Dominios
%  imageIn    : List
%  imageOut	  : List
%  Predicados
%  imageFlipV(ImageIn, ImageOut) aridad = 2
%  Metas Primarias: imageFlipV
%  Metas Secundarias: image, imageIsBitmap, imageIsPixmap, pixelsFlipVbit, pixelsFlipVrgb, pixelsFlipVhex, pixelFlipVbit, pixelFlipVrgb, pixelFlipVhex, pixbit, pixrgb, pixhex
%  Clausulas

pixelFlipVbit(Height, PixelIn, PixelOut):-
    pixbit(PosX, PosY, Bit, Depth, PixelIn),
    H is Height-1,
    (   PosY = H
    ->  NewY is 0
    ;	 (   PosY = 0
         ->   NewY is H
         ;    NewY is H-PosY
         )
    ),
    pixbit(PosX, NewY, Bit, Depth, PixelOut).

pixelFlipVrgb(Height, PixelIn, PixelOut):-
    pixrgb(PosX, PosY, R, G, B, Depth, PixelIn),
    H is Height-1,
    (   PosY = H
    ->  NewY is 0
    ;	 (   PosY = 0
         ->   NewY is H
         ;    NewY is H-PosY
         )
    ),
    pixrgb(PosX, NewY, R, G, B, Depth, PixelOut).

pixelFlipVhex(Height, PixelIn, PixelOut):-
    pixhex(PosX, PosY, Hex, Depth, PixelIn),
    H is Height-1,
    (   PosY = H
    ->  NewY is 0
    ;	 (   PosY = 0
         ->   NewY is H
         ;    NewY is H-PosY
         )
    ),
    pixhex(PosX, NewY, Hex, Depth, PixelOut).

pixelsFlipVbit(_,[],[]).
pixelsFlipVbit(Height, [PixelIn | PixelsIn], [PixelOut | PixelsOut]):-
    pixelFlipVbit(Height, PixelIn, PixelOut),
    pixelsFlipVbit(Height, PixelsIn, PixelsOut).

pixelsFlipVrgb(_,[],[]).
pixelsFlipVrgb(Height, [PixelIn | PixelsIn], [PixelOut | PixelsOut]):-
    pixelFlipVrgb(Height, PixelIn, PixelOut),
    pixelsFlipVrgb(Height, PixelsIn, PixelsOut).

pixelsFlipVhex(_,[],[]).
pixelsFlipVhex(Height, [PixelIn | PixelsIn], [PixelOut | PixelsOut]):-
    pixelFlipVhex(Height, PixelIn, PixelOut),
    pixelsFlipVhex(Height, PixelsIn, PixelsOut).

imageFlipV(ImageIn, ImageOut):-
    image(Width, Height, PixelsIn, ImageIn),
    (   imageIsBitmap(ImageIn)
    ->  pixelsFlipVbit(Height, PixelsIn, PixelsOut)
    ;   (   imageIsPixmap(ImageIn)
        ->  pixelsFlipVrgb(Height, PixelsIn, PixelsOut)
        ;   pixelsFlipVhex(Height, PixelsIn, PixelsOut)
        )
    ),
    image(Width, Height,PixelsOut, ImageOut).

% imageCrop
%  Dominios
%  imageIn    : List
%  X1		  : Int
%  Y1		  : Int
%  X2		  : Int
%  Y2		  : Int
%  imageOut	  : List
%  Predicados
%  imageCrop(ImageIn, X1, Y1, X2, Y2, ImageOut) aridad = 6
%  Metas Primarias: imageCrop
%  Metas Secundarias: image, imageIsBitmap, imageIsPixmap, pixelsCropbit, pixelsCroprgb, pixelsCrophex, pixelCropbit, pixelCroprgb, pixelCrophex, pixbit, pixrgb, pixhex
%  Clausulas

pixelCropbit(X1, Y1, X2, PixelIn, PixelOut):-
    pixbit(PosX, PosY, Bit, Depth, PixelIn),
    (   PosX >= X1, PosX =< X2, PosY =< Y1
    ->  pixbit(PosX, PosY, Bit, Depth, PixelOut)
    ;	 pixbit(_, _, _, _, PixelOut)
    ).
   
pixelsCropbit(_,_,_,[],[]).
pixelsCropbit(X1, Y1, X2, [PixelIn | PixelsIn], [PixelOut | PixelsOut]):-
    pixelCropbit(X1, Y1, X2, PixelIn, PixelOut),
    pixelsCropbit(X1, Y1, X2, PixelsIn, PixelsOut).

pixelCroprgb(X1, Y1, X2, PixelIn, PixelOut):-
    pixrgb(PosX, PosY, R,G,B, Depth, PixelIn),
    (   PosX >= X1, PosX =< X2, PosY =< Y1
    ->  pixrgb(PosX, PosY, R,G,B, Depth, PixelOut)
    ;	 pixrgb(_, _, _, _, _, _, PixelOut)
    ).
   
pixelsCroprgb(_,_,_,[],[]).
pixelsCroprgb(X1, Y1, X2, [PixelIn | PixelsIn], [PixelOut | PixelsOut]):-
    pixelCroprgb(X1, Y1, X2, PixelIn, PixelOut),
    pixelsCroprgb(X1, Y1, X2, PixelsIn, PixelsOut).


pixelCrophex(X1, Y1, X2, PixelIn, PixelOut):-
    pixhex(PosX, PosY, Hex, Depth, PixelIn),
    (   PosX >= X1, PosX =< X2, PosY =< Y1
    ->  pixhex(PosX, PosY, Hex, Depth, PixelOut)
    ;	 pixhex(_, _, _, _, PixelOut)
    ).
   
pixelsCrophex(_,_,_,[],[]).
pixelsCrophex(X1, Y1, X2, [PixelIn | PixelsIn], [PixelOut | PixelsOut]):-
    pixelCrophex(X1, Y1, X2, PixelIn, PixelOut),
    pixelsCrophex(X1, Y1, X2, PixelsIn, PixelsOut).


imageCrop(ImageIn, X1, Y1, X2, Y2, ImageOut):-
    image(_, Height, PixelsIn, ImageIn),
    (   imageIsBitmap(ImageIn)
    ->  pixelsCropbit(X1, Y1, X2, PixelsIn, PixelsOut)
    ;   (   imageIsPixmap(ImageIn)
        ->  pixelsCroprgb(X1, Y1, X2, PixelsIn, PixelsOut)
        ;   pixelsCrophex(X1, Y1, X2, PixelsIn, PixelsOut)
        )
    ),
    NewWidth is (X2-X1)+1,
    NewHeight is Height-((Height-1)-Y2),
    image(NewWidth, NewHeight, PixelsOut, ImageOut).


% imageRGBToHex

% imageToHistogram

% imageRotate90
%  Dominios
%  imageIn    : List
%  imageOut	  : List
%  Predicados
%  imageRotate90(ImageIn, ImageOut) aridad = 2
%  Metas Primarias: imageRotate90
%  Metas Secundarias: image, imageIsBitmap, imageIsPixmap, pixelsRotate90Bit, pixelsRotate90Rgb, pixelsRotate90Hex, pixelRotate90Bit, pixelRotate90Rgb, pixelRotate90Hex, pixbit, pixrgb, pixhex
%  Clausulas

pixelRotate90Bit(PixelIn, PixelOut):-
      pixbit(PosX, PosY, Bit, Depth, PixelIn),
      pixbit(PosY, PosX, Bit, Depth, PixelOut).

pixelsRotate90Bit([],[]).
pixelsRotate90Bit([PixelIn | PixelsIn], [PixelOut | PixelsOut]):-
      pixelRotate90Bit(PixelIn, PixelOut),
      pixelsRotate90Bit(PixelsIn, PixelsOut).


pixelRotate90Rgb(PixelIn, PixelOut):-
      pixrgb(PosX, PosY, R,G,B, Depth, PixelIn),
      pixrgb(PosY, PosX, R,G,B, Depth, PixelOut).

pixelsRotate90Rgb([],[]).
pixelsRotate90Rgb([PixelIn | PixelsIn], [PixelOut | PixelsOut]):-
      pixelRotate90Rgb(PixelIn, PixelOut),
      pixelsRotate90Rgb(PixelsIn, PixelsOut).

pixelRotate90Hex(PixelIn, PixelOut):-
      pixhex(PosX, PosY, Hex, Depth, PixelIn),
      pixhex(PosY, PosX, Hex, Depth, PixelOut).

pixelsRotate90Hex([],[]).
pixelsRotate90Hex([PixelIn | PixelsIn], [PixelOut | PixelsOut]):-
      pixelRotate90Hex(PixelIn, PixelOut),
      pixelsRotate90Hex(PixelsIn, PixelsOut).


imageRotate90(ImageIn,ImageOut):- 
    image(Width, Height, PixelsIn, ImageIn),
    (   imageIsBitmap(ImageIn)
    ->  pixelsRotate90Bit(PixelsIn, PixelsOut)
    ;   (   imageIsPixmap(ImageIn)
        ->  pixelsRotate90Rgb(PixelsIn, PixelsOut)
        ;   pixelsRotate90Hex(PixelsIn, PixelsOut)
        )
    ),
    image(Width, Height, PixelsOut, ImageAux),
    imageFlipH(ImageAux,ImageOut). 

% imageCompress
% imageChangePixel
% imageInvertColorRGB
% imageToString
% imageDepthLayers
% imageDecompress








% Scripts de prueba

% ======================================================
%                       image
%                       pixbit
%                       pixrgb
%                       pixhex
% ======================================================

% pixbit(0,0,1,10,P1),
% pixbit(0,1,0,20,P2),
% pixbit(1,0,0,30,P3),
% pixbit(1,1,1,4,P4),
% image(2,2,[P1,P2,P3,P4],Img1).

% pixbit(0,0,1,10,P1),
% pixbit(0,1,0,20,P2),
% pixbit(0,2,0,30,P3),
% pixbit(1,0,1,10,P4),
% pixbit(1,1,0,10,P5),
% pixbit(1,2,1,10,P6),
% pixbit(2,0,0,10,P7),
% pixbit(2,1,1,10,P8),
% pixbit(2,2,1,10,P9),
% image(3,3,[P1,P2,P3,P4,P5,P6,P7,P8,P9],Img2).

% pixbit(0,0,1,5,P1),
% pixbit(1,0,0,4,P2),
% pixbit(2,0,0,6,P3),
% pixbit(3,0,0,4,P4),
% pixbit(4,0,1,7,P5),
% pixbit(5,0,0,7,P6),
% pixbit(6,0,0,4,P7),
% pixbit(7,0,0,4,P8),
% pixbit(8,0,0,4,P9),
% pixbit(0,1,1,7,P10),
% pixbit(1,1,0,4,P11),
% pixbit(2,1,1,7,P12),
% pixbit(3,1,0,4,P13),
% pixbit(4,1,1,7,P14),
% pixbit(5,1,0,4,P15),
% pixbit(6,1,0,4,P16),
% pixbit(7,0,0,4,P17),
% pixbit(8,1,0,4,P18),
% pixbit(0,2,1,6,P19),
% pixbit(1,2,1,7,P20),
% pixbit(2,2,1,7,P21),
% pixbit(3,2,1,7,P22),
% pixbit(4,2,1,5,P23),
% pixbit(5,2,0,4,P24),
% pixbit(6,2,0,4,P25),
% pixbit(7,0,0,4,P26),
% pixbit(8,2,0,4,P27),
% pixbit(0,3,0,5,P28),
% pixbit(1,3,1,7,P29),
% pixbit(2,3,1,7,P30),
% pixbit(3,3,1,7,P31),
% pixbit(4,3,0,4,P32),
% pixbit(5,3,0,4,P33),
% pixbit(6,3,1,7,P34),
% pixbit(7,0,1,7,P35),
% pixbit(8,3,0,4,P36),
% pixbit(0,4,0,4,P37),
% pixbit(1,4,1,7,P38),
% pixbit(2,4,1,7,P39),
% pixbit(3,4,1,7,P40),
% pixbit(4,4,1,7,P41),
% pixbit(5,4,1,7,P42),
% pixbit(6,4,1,7,P43),
% pixbit(7,0,0,4,P44),
% pixbit(8,4,1,7,P45),
% pixbit(0,5,0,4,P46),
% pixbit(1,5,1,7,P47),
% pixbit(2,5,1,7,P48),
% pixbit(3,5,1,7,P49),
% pixbit(4,5,1,7,P50),
% pixbit(5,5,0,4,P51),
% pixbit(6,5,0,4,P52),
% pixbit(7,0,0,4,P53),
% pixbit(8,5,1,7,P54),
% pixbit(0,6,0,4,P55),
% pixbit(1,6,0,4,P56),
% pixbit(2,6,0,4,P57),
% pixbit(3,6,0,4,P58),
% pixbit(4,6,0,4,P59),
% pixbit(5,6,0,4,P60),
% pixbit(6,6,0,4,P61),
% pixbit(7,0,0,4,P62),
% pixbit(8,6,0,4,P63),
% image(9,7,[P1,P2,P3,P4,P5,P6,P7,P8,P9,P10,P11,P12,P13,P14,P15,P16,P17,P18,P19,P20,P21,P22,P23,P24,P25,P26,P27,P28,P29,P30,P31,P32,P33,P34,P35,P36,P37,P38,P39,P40,P41,P42,P43,P44,P45,P46,P47,P48,P49,P50,P51,P52,P53,P54,P55,P56,P57,P58,P59,P60,P61,P62,P63],Img3).

% pixrgb(0,0,10,10,10,10,P1),
% pixrgb(0,1,20,20,20,20,P2),
% pixrgb(1,0,30,30,30,30,P3),
% pixrgb(1,1,40,40,40,40,P4),
% image(2,2,[P1,P2,P3,P4],Img4). 

% pixrgb(0,0,10,10,10,12,P1),
% pixrgb(0,1,20,20,20,21,P2),
% pixrgb(0,2,10,10,10,60,P3),
% pixrgb(0,3,10,10,10,40,P4),
% pixrgb(1,0,30,30,30,30,P5),
% pixrgb(1,1,40,40,40,20,P6),
% pixrgb(1,2,30,30,30,23,P7),
% pixrgb(1,3,30,30,30,11,P8),
% pixrgb(2,0,30,30,30,12,P9),
% pixrgb(2,1,30,30,30,21,P10),
% pixrgb(2,2,30,30,30,34,P11),
% pixrgb(2,3,30,30,30,44,P12),
% pixrgb(3,0,30,30,30,67,P13),
% pixrgb(3,1,30,30,30,31,P14),
% pixrgb(3,2,30,30,30,30,P15),
% pixrgb(3,3,30,30,30,30,P16),
% image(4,4,[P1,P2,P3,P4,P5,P6,P7,P8,P9,P10,P11,P12,P13,P14,P15,P16],Img4).

% pixrgb(0,0,11,2,0,12,P1),
% pixrgb(1,0,210,130,140,32,P2),
% pixrgb(2,0,215,213,110,13,P3),
% pixrgb(3,0,10,10,10,1,P4),
% pixrgb(0,1,233,222,0,2,P5),
% pixrgb(1,1,21,10,140,13,P6),
% pixrgb(2,1,225,243,10,2,P7),
% pixrgb(3,1,3,140,130,13,P8),
% pixrgb(0,2,1,22,20,13,P9),
% pixrgb(1,2,20,130,40,42,P10),
% pixrgb(2,2,215,23,10,14,P11),
% pixrgb(3,2,101,240,250,1,P12),
% image(4,3,[P1,P2,P3,P4,P5,P6,P7,P8,P9,P10,P11,P12],Img5).

% pixhex(0,0,"0A0A0A",13,P1),
% pixhex(0,1,"141414",24,P2),
% pixhex(0,2,"0A0A0A",1,P3),
% pixhex(1,0,"1E1E1E",330,P4),
% pixhex(1,1,"282828",20,P5),
% pixhex(1,2,"1E1E1E",35,P6),
% pixhex(2,0,"1E1E1E",3,P7),
% pixhex(2,1,"1E1E1E",6,P8),
% pixhex(2,2,"1E1E1E",66,P9),
% image(3,3,[P1,P2,P3,P4,P5,P6,P7,P8,P9],Img6).


% ======================================================
%                       imageFlipH
% ======================================================

% pixbit(0,0,1,10,P1),
% pixbit(0,1,0,20,P2),
% pixbit(1,0,0,30,P3),
% pixbit(1,1,1,4,P4),
% image(2,2,[P1,P2,P3,P4],Img1),
% imageFlipH(Img1,R).

% ======================================================
%                       imageFlipV
% ======================================================

% pixbit(0,0,1,10,P1),
% pixbit(0,1,0,20,P2),
% pixbit(1,0,0,30,P3),
% pixbit(1,1,1,4,P4),
% image(2,2,[P1,P2,P3,P4],Img1),
% imageFlipV(Img1,R).

 

% ======================================================
%                       imageCrop
% ======================================================



% ======================================================
%                       imageRGBToHex
% ======================================================




% ======================================================
%                       imageToHistogram
% ======================================================




% ======================================================
%                       imageRotate90
% ======================================================

% pixbit(0,0,1,10,P1),
% pixbit(0,1,0,20,P2),
% pixbit(0,2,0,30,P3),
% pixbit(1,0,1,40,P4),
% pixbit(1,1,0,50,P5),
% pixbit(1,2,1,60,P6),
% pixbit(2,0,0,70,P7),
% pixbit(2,1,1,80,P8),
% pixbit(2,2,1,90,P9),
% image(3,3,[P1,P2,P3,P4,P5,P6,P7,P8,P9],Img2),
% imageRotate90(Img2,R).

% ======================================================
%                       imageCompress
% ======================================================



% ======================================================
%                      imageChangePixel
% ======================================================




% ======================================================
%                       imageInvertColorRG
% ======================================================



% ======================================================
%                       imageDepthLayers
% ======================================================




% ======================================================
%                       imageDecompress
% ======================================================

