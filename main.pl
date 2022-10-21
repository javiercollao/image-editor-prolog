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
%  @title      TDA pixbit-d
%  @author     Javier Collao
%
%  @desc       Este TDA representa a la lista pixbit-d
%  pixbit-d = x (int) X y (int) X bit ([0|1]) X depth (int)
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
%  @title      TDA pixhex-d
%  @author     Javier Collao
%
%  @desc Este TDA representa a la lista pixhex-d
%   pixhex-d = x (int) X y (int) X hex(String) X d (int)
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
%  @title      TDA pixrgb-d
%  @author     Javier Collao
%
%  @desc       Este TDA representa a la lista pixrgb-d
%  pixrgb-d = x (int) X y (int) X r (C) X g (C) X b(C) X d (int)
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
%  image = Width (int) X Height (int) X [pixbit-d* | pixrgb-d* | pixhex-d*]
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


pixelFlipH(Width, PixelIn, PixelOut):-
    pixbit(PosX, PosY, Bit, Depth, PixelIn),
    W is Width-1,
    (   PosX = W
    ->  NewX is PosX-1
    ;	NewX is PosX+1
    ),
    pixbit(NewX, PosY, Bit, Depth, PixelOut).

pixelsFlipH(_,[],[]).
pixelsFlipH(Width, [PixelIn | PixelsIn], [PixelOut | PixelsOut]):-
    pixelFlipH(Width, PixelIn, PixelOut),
    pixelsFlipH(Width, PixelsIn, PixelsOut).

imageFlipH(ImageIn, ImageOut):-
    image(Width, Height, PixelsIn, ImageIn),
    pixelsFlipH(Width, PixelsIn, PixelsOut),
    image(Width, Height,PixelsOut, ImageOut).


% imageFlipV
% imageCrop
% imageRGBToHex
% imageToHistogram
% imageRotate90
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




