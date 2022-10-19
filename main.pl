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

pixelIsPixbit(Pixel):-
    pixbit(_,_,Bit,_,Pixel),
    (Bit == 0 ; Bit == 1).

pixelsAreBitmap([Pixel | Pixels]):-
    pixelIsPixbit(Pixel),
    pixelsAreBitmap(Pixels).

imageIsBitmap(Image):-
    image(_,_,Pixels,Image),
    pixelsAreBitmap(Pixels).

% imageIsPixmap


pixelIsPixrgb(Pixel):-
    pixrgb(_,_,R,G,B,_,Pixel),
    R =< 255, R >= 0,
    G =< 255, G >= 0,
    B =< 255, B >= 0.

pixelsArePixmap([Pixel | Pixels]):-
    pixelIsPixrgb(Pixel),
    pixelsArePixmap(Pixels).

imageIsPixmap(Image):-
    image(_,_,Pixels,Image),
    pixelsArePixmap(Pixels).

    
% imageIsHexmap
% imageIsCompressed
% imageFlipH
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
% ======================================================

% pixbit(0,0,1,10,P1),
% pixbit(0,1,0,20,P2),
% pixbit(1,0,0,30,P3),
% pixbit(1,1,1,10,P4),
% image(2,2,[P1,P2,P3,P4],Img1).