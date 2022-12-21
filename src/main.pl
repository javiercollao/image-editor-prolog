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
%  Dominios
%  image    : List
%  Predicados
%  imageIsCompressed(ImageIn) aridad = 1
%  Metas Primarias: imageIsCompressed
%  Metas Secundarias:  imageCompresed, length
%  Clausulas

imageIsCompressed(ImageIn):-
    imageCompresed(Image,_,_, ImageIn),
    length(Image,3).

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
    pixrgb(PosX, PosY, R, G, B, Depth, PixelIn),
    (   PosX >= X1, PosX =< X2, PosY =< Y1
    ->  pixrgb(PosX, PosY, R, G, B, Depth, PixelOut)
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
%  Dominios
%  imageIn    : List
%  imageOut	  : List
%  Predicados
%  imageRGBToHex(ImageIn, ImageOut) aridad = 2
%  Metas Primarias: imageRGBToHex
%  Metas Secundarias: image, pixelsRGBToHex, pixelRGBToHex, converterRGBToHex,toHex,hexNumber,atomic_list_concat, atom_concat, pixrgb, pixhex
%  Clausulas

hexNumber(C, HexNumberStr):-
    (   C >= 0, C =< 9
    ->  number_string(C,HexNumberStr)
    ;   (   C = 10
        ->  atom_string(`A`,HexNumberStr)
        ;   (   C = 11
            ->  atom_string(`B`,HexNumberStr)
            ; (   C = 12
              ->  atom_string(`C`,HexNumberStr)
              ; (   C = 13
                ->  atom_string(`D`,HexNumberStr)
                ; (   C = 14
                  ->  atom_string(`E`,HexNumberStr)
                  ; (   C = 15
                    ->  atom_string(`F`,HexNumberStr)
                    ; atom_string(malo, HexNumberStr)
                    )
                  )
                )
              )
            )
        )
    ).

toHex(C,HexOut):-
    C1 is (C mod 16) mod 16,
    C2 is C mod 16,
    hexNumber(C1,Cx), 
    hexNumber(C2,Cy),
    atom_concat(Cx,Cy,HexOut).

converterRGBToHex(R,G,B,HexOut):-
    toHex(R,ROut),
    toHex(G,GOut),
    toHex(B,BOut),
    atomic_list_concat([ROut,GOut,BOut],HexOut).
    
pixelRGBToHex(PixelIn, PixelOut):-
    pixrgb(PosX, PosY, R, G, B, Depth, PixelIn),
    converterRGBToHex(R,G,B,HexOut),
    pixhex(PosX, PosY, HexOut, Depth, PixelOut).
   
pixelsRGBToHex([],[]).
pixelsRGBToHex([PixelIn | PixelsIn], [PixelOut | PixelsOut]):-
    pixelRGBToHex(PixelIn, PixelOut),
    pixelsRGBToHex(PixelsIn, PixelsOut).

imageRGBToHex(ImageIn, ImageOut):-
    image(Width, Height, PixelsIn, ImageIn),
    pixelsRGBToHex(PixelsIn, PixelsOut),
    image(Width, Height, PixelsOut, ImageOut).

% imageToHistogram
%  Dominios
%  imageIn    : List
%  imageOut	  : List
%  Predicados
%  imageToHistogram(ImageIn, HistogramOut) aridad = 2
%  Metas Primarias: imageToHistogram
%  Metas Secundarias: imageIsBitmap,imageIsPixmap, pixelsHistogramBit,pixelsHistogramRgb,pixelsHistogramHex,histogramColor,pixelHistogramBit,pixelHistogramRgb, pixelHistogramHex, pixbit,pixrgb,pixhex
%  Clausulas

colorCounter(Color, Times, [Color, Times]).

colorRGB(R,G,B,[R,G,B]).

list_length([], 0 ).
list_length([_|Xs] , L ) :- 
    list_length(Xs,N) , 
    L is N+1 .

elementHistogram(Color, List, Out):-
	filterListIncl(Color, List, OutL),
    list_length(OutL, RLength),
    colorCounter(Color, RLength, Out).
    
histogramColor([],[]).
histogramColor([ColorIn | ColorsIn], [ColorOut | ColorsOut]):-
    elementHistogram(ColorIn,[ColorIn | ColorsIn], ColorOut),
    filterList(ColorIn, ColorsIn, NewColorsIn),
    histogramColor(NewColorsIn, ColorsOut).

are_identical(X, Y) :-
    X == Y.

filterList(A, In, Out) :-
    exclude(are_identical(A), In, Out).

filterListIncl(A, In, Out) :-
    include(are_identical(A), In, Out).

pixelHistogramBit(PixelIn, ColorOut):-
    pixbit(_, _, ColorOut, _, PixelIn).

pixelsHistogramBit([],[]).
pixelsHistogramBit([PixelIn | PixelsIn], [PixelOut | PixelsOut]):-
    pixelHistogramBit(PixelIn, PixelOut),
    pixelsHistogramBit(PixelsIn, PixelsOut).

pixelHistogramRgb(PixelIn, ColorOut):-
    pixrgb(_, _, R, G, B, _, PixelIn),
    colorRGB(R,G,B,ColorOut).

pixelsHistogramRgb([],[]).
pixelsHistogramRgb([PixelIn | PixelsIn], [PixelOut | PixelsOut]):-
    pixelHistogramRgb(PixelIn, PixelOut),
    pixelsHistogramRgb(PixelsIn, PixelsOut).


pixelHistogramHex(PixelIn, ColorOut):-
    pixhex(_, _, ColorOut, _, PixelIn).

pixelsHistogramHex([],[]).
pixelsHistogramHex([PixelIn | PixelsIn], [PixelOut | PixelsOut]):-
    pixelHistogramHex(PixelIn, PixelOut),
    pixelsHistogramHex(PixelsIn, PixelsOut).


imageToHistogram(ImageIn, HistogramOut):-
    image(_, _, PixelsIn, ImageIn),
    (   imageIsBitmap(ImageIn)
    ->   pixelsHistogramBit(PixelsIn, List),
         histogramColor(List, HistogramOut)
    ;   (    imageIsPixmap(ImageIn)
        ->  pixelsHistogramRgb(PixelsIn, List),
            histogramColor(List, HistogramOut)
        ;   pixelsHistogramHex(PixelsIn, List),
            histogramColor(List, HistogramOut)
        )
    ).

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
%  Dominios
%  imageIn    : List
%  imageOut	  : List
%  Predicados
%  imageCompress(ImageIn, ImageCompresedOut) aridad = 2
%  Metas Primarias: imageCompress
%  Metas Secundarias: imageIsBitmap,imageIsPixmap, imageToHistogram,timesList,max_list, colorMax, image, depthsFilterBit, depthsFilterRgb, depthsFilterHex, filterPixelsBit, filterPixelsRgb, filterPixelsHex,imageCompresed
%  Clausulas

imageCompresed(Image, Color, Depths, [Image, Color, Depths]).

times(HIn, NumberOut):-
    colorCounter(_, NumberOut, HIn).

timesList([],[]).
timesList([HIn | HsIn], [NumberOut | NumbersOut]):-
      times(HIn, NumberOut),
      timesList(HsIn, NumbersOut).

colorMax( MaxNOut, [HIn | HsIn], ColorOut):-
    colorCounter(_, Times, HIn),
    (   Times = MaxNOut
    ->  colorCounter(ColorOut, Times, HIn)
    ;   colorMax( MaxNOut, HsIn, ColorOut)
    ).

 depthFilterBit(Color, PixelIn, DepthOut):-
     pixbit(_,_,C,_,PixelIn),
     (   C = Color
     ->  pixbit(_,_,_,DepthOut,PixelIn)
     ;   DepthOut = _).

 depthsFilterBit(_,[], []).
 depthsFilterBit(Color,[PixelIn | PixelsIn], [DepthOut | PixelsOut]):-
     depthFilterBit(Color, PixelIn, DepthOut),
     depthsFilterBit(Color, PixelsIn, PixelsOut).
    
depthFilterHex(Color, PixelIn, DepthOut):-
     pixhex(_,_,C,_,PixelIn),
     (   C = Color
     ->  pixhex(_,_,_,DepthOut,PixelIn)
     ;   DepthOut = _).

 depthsFilterHex(_,[], []).
 depthsFilterHex(Color,[PixelIn | PixelsIn], [DepthOut | PixelsOut]):-
     depthFilterHex(Color, PixelIn, DepthOut),
     depthsFilterHex(Color, PixelsIn, PixelsOut).

depthFilterRgb(Color, PixelIn, DepthOut):-
     pixrgb(_,_,R,G,B,_,PixelIn),
     colorRGB(R,G,B,C),
     (   C = Color
     ->  pixrgb(_,_,_,_,_,DepthOut,PixelIn)
     ;   DepthOut = _).

 depthsFilterRgb(_,[], []).
 depthsFilterRgb(Color,[PixelIn | PixelsIn], [DepthOut | PixelsOut]):-
     depthFilterRgb(Color, PixelIn, DepthOut),
     depthsFilterRgb(Color, PixelsIn, PixelsOut).

filterPixelBit(Color, PixelIn, PixelOut):-
    pixbit(PosX,PosY,C,Dpth,PixelIn),
    (   Color = C
    ->  PixelOut = "str"
    ;   pixbit(PosX,PosY,C,Dpth,PixelOut)
    ).

filterPixelsBit(_,[],[]).
filterPixelsBit(Color, [PixelIn | PixelsIn], [ PixelOut | PixelsOut]):-
     filterPixelBit(Color, PixelIn, PixelOut),
     filterPixelsBit(Color, PixelsIn, PixelsOut).

filterPixelHex(Color, PixelIn, PixelOut):-
    pixhex(PosX,PosY,C,Dpth,PixelIn),
    (   Color = C
    ->  PixelOut = 9
    ;   pixhex(PosX,PosY,C,Dpth,PixelOut)
    ).

filterPixelsHex(_,[],[]).
filterPixelsHex(Color, [PixelIn | PixelsIn], [ PixelOut | PixelsOut]):-
     filterPixelHex(Color, PixelIn, PixelOut),
     filterPixelsHex(Color, PixelsIn, PixelsOut).

filterPixelRgb(Color, PixelIn, PixelOut):-
    pixrgb(PosX,PosY,Raux,Gaux,Baux,Dpth,PixelIn),
    colorRGB(Raux,Gaux,Baux,C),
    (   Color = C
    ->  PixelOut = "str"
    ;   pixrgb(PosX,PosY,Raux,Gaux,Baux,Dpth,PixelOut)
    ).

filterPixelsRgb(_,[],[]).
filterPixelsRgb(Color, [PixelIn | PixelsIn], [ PixelOut | PixelsOut]):-
     filterPixelRgb(Color, PixelIn, PixelOut),
     filterPixelsRgb(Color, PixelsIn, PixelsOut).

imageCompress(ImageIn, ImageCompresedOut):-
    imageToHistogram(ImageIn, HistogramOut),
    timesList(HistogramOut, ListNumbers),
    max_list(ListNumbers, MaxNOut),
    colorMax(MaxNOut, HistogramOut, ColorMaxOut),
    image(Width, Height, PixelsIn, ImageIn),
    (   imageIsBitmap(ImageIn)
    ->  depthsFilterBit(ColorMaxOut, PixelsIn, DepthsAux),
    	include(number, DepthsAux, DepthsOut),
    	filterPixelsBit(ColorMaxOut, PixelsIn, PixelsAux),
    	exclude(string, PixelsAux,PixelsOut)
    ;   (   imageIsPixmap(ImageIn)
        ->  depthsFilterRgb(ColorMaxOut, PixelsIn, DepthsAux),
    		include(number, DepthsAux, DepthsOut),
    		filterPixelsRgb(ColorMaxOut, PixelsIn, PixelsAux),
    		exclude(string, PixelsAux,PixelsOut)
        ;   depthsFilterHex(ColorMaxOut, PixelsIn, DepthsAux),
    		include(number, DepthsAux, DepthsOut),
    		filterPixelsHex(ColorMaxOut, PixelsIn, PixelsAux),
    		exclude(number, PixelsAux,PixelsOut)
        )
    ),
    image(Width, Height, PixelsOut, ImageOut),
    imageCompresed(ImageOut, ColorMaxOut, DepthsOut, ImageCompresedOut).

% imageChangePixel
%  Dominios
%  ImageIn    : List
%  Pixel      : List
%  ImageOut	  : List
%  Predicados
%  imageChangePixel(ImageIn, Pixel, ImageOut) aridad = 3
%  Metas Primarias: imageChangePixel
%  Metas Secundarias: image imageIsBitmap,imageIsPixmap, remplacePixelBit, remplacePixelRgb, remplacePixelHex, newPixelBit, newPixelRgb, newPixelHex
%  Clausulas

newPixelBit(Pixel, PixelIn, PixelOut):-
    pixbit(Px,Py,Cbit,Dpth,Pixel),
    pixbit(PosX,PosY,Bit,Depth,PixelIn),
    (   Px = PosX, Py = PosY
    ->  pixbit(Px,Py,Cbit,Dpth,PixelOut)
    ;   pixbit(PosX,PosY,Bit,Depth,PixelOut)
    ).
    
remplacePixelBit(_,[],[]).
remplacePixelBit(Pixel,[PixelIn|PixelsIn],[PixelOut|PixelsOut]):-
    newPixelBit(Pixel, PixelIn, PixelOut),
    remplacePixelBit(Pixel,PixelsIn,PixelsOut).

newPixelRgb(Pixel, PixelIn, PixelOut):-
    pixrgb(Px,Py,CR,CG,CB,Dpth,Pixel),
    pixrgb(PosX,PosY,R,G,B,Depth,PixelIn),
    (   Px = PosX, Py = PosY
    ->  pixrgb(Px,Py,CR,CG,CB,Dpth,PixelOut)
    ;   pixrgb(PosX,PosY,R,G,B,Depth,PixelOut)
    ).
    
remplacePixelRgb(_,[],[]).
remplacePixelRgb(Pixel,[PixelIn|PixelsIn],[PixelOut|PixelsOut]):-
    newPixelRgb(Pixel, PixelIn, PixelOut),
    remplacePixelRgb(Pixel,PixelsIn,PixelsOut).

newPixelHex(Pixel, PixelIn, PixelOut):-
    pixhex(Px,Py,Chex,Dpth,Pixel),
    pixhex(PosX,PosY,Hex,Depth,PixelIn),
    (   Px = PosX, Py = PosY
    ->  pixhex(Px,Py,Chex,Dpth,PixelOut)
    ;   pixhex(PosX,PosY,Hex,Depth,PixelOut)
    ).
    
remplacePixelHex(_,[],[]).
remplacePixelHex(Pixel,[PixelIn|PixelsIn],[PixelOut|PixelsOut]):-
    newPixelHex(Pixel, PixelIn, PixelOut),
    remplacePixelHex(Pixel,PixelsIn,PixelsOut).

imageChangePixel(ImageIn, Pixel, ImageOut):-
    image(Width, Height, PixelsIn, ImageIn),
    (   imageIsBitmap(ImageIn)
    ->  remplacePixelBit(Pixel,PixelsIn,PixelsOut)
    ;   (   imageIsPixmap(ImageIn)
        ->  remplacePixelRgb(Pixel,PixelsIn,PixelsOut)
        ;   remplacePixelHex(Pixel,PixelsIn,PixelsOut)
        )
    ),
    image(Width, Height, PixelsOut, ImageOut).

% imageInvertColorRGB
%  Dominios
%  PixeRgbIn    : List 
%  PixeRgbOut	  : List
%  Predicados
%  imageInvertColorRGB(PixelRgbIn, PixelRgbOut) aridad = 2
%  Metas Primarias: imageInvertColorRGB
%  Metas Secundarias: pixrgb
%  Clausulas

imageInvertColorRGB(PixelRgbIn, PixelRgbOut):-
    pixrgb(PosX,PosY,R,G,B,Depth,PixelRgbIn),
    NewR is 255-R,
    NewG is 255-G,
    NewB is 255-B,
    pixrgb(PosX,PosY,NewR,NewG,NewB,Depth,PixelRgbOut).

% imageToString
%  Dominios
%  ImageIn    : List 
%  ImageStr	  : String
%  Predicados
%  imageToString(ImageIn, ImageStr) aridad = 2
%  Metas Primarias: imageToString
%  Metas Secundarias: image, pixelsToString, atomic_list_concat,
%  Clausulas

%%  ==== bit
pixelToStrBit(Width, Height,PosX,PosY,Bit,PStr):-
    number_string(Bit,BitStr), 
    (   PosX < Width, PosY < Height-1
        ->  string_concat(BitStr, '\t', PStr)
        ;   string_concat(BitStr, '\n', PStr)
    ).

pixelsToStringBit(_,_,[],[]).
pixelsToStringBit(Width, Height, [P | PixelsIn], [PStr | PixelsString]):-
    pixbit(PosX,PosY,Bit,_,P),
    pixelToStrBit(Width, Height,PosX,PosY,Bit,PStr),
    pixelsToStringBit(Width, Height, PixelsIn, PixelsString).
%%  ==== bit

%%  ==== rgb
pixelToStrRgb(Width, Height,PosX,PosY,R,G,B,PStr):-
    number_string(R,RStr), 
    number_string(G,GStr),
    number_string(B,BStr),
    atomic_list_concat(['[', RStr,',',GStr,',',BStr,']'], RgbStr),
    (   PosX < Width, PosY < Height-1
        ->  string_concat(RgbStr, '\t', PStr)
        ;   string_concat(RgbStr, '\n', PStr)
    ).

pixelsToStringRgb(_,_,[],[]).
pixelsToStringRgb(Width, Height, [P | PixelsIn], [PStr | PixelsString]):-
    pixrgb(PosX,PosY,R,G,B,_,P),
    pixelToStrRgb(Width, Height,PosX,PosY,R,G,B,PStr),
    pixelsToStringRgb(Width, Height, PixelsIn, PixelsString).
%%  ==== rgb

%%  ==== hex
pixelToStrHex(Width, Height,PosX,PosY,Hex,PStr):-
    (   PosX < Width, PosY < Height-1
        ->  string_concat(Hex, '\t', PStr)
        ;   string_concat(Hex, '\n', PStr)
    ).

pixelsToStringHex(_,_,[],[]).
pixelsToStringHex(Width, Height, [P | PixelsIn], [PStr | PixelsString]):-
    pixhex(PosX,PosY,Hex,_,P),
    pixelToStrHex(Width, Height,PosX,PosY,Hex,PStr),
    pixelsToStringHex(Width, Height, PixelsIn, PixelsString).
%%  ==== hex

imageToString(ImageIn, ImageStr):-
    image(Width, Height, PixelsIn, ImageIn),
    (   imageIsBitmap(ImageIn)
    ->  pixelsToStringBit(Width, Height, PixelsIn, PixelsString)
    ;   (   imageIsPixmap(ImageIn)
        ->  pixelsToStringRgb(Width, Height, PixelsIn, PixelsString)
        ;   pixelsToStringHex(Width, Height, PixelsIn, PixelsString)
        )
    ),
    atomic_list_concat(PixelsString,ImageStr).


% imageDepthLayers
%  Dominios
%  ImageIn        : List 
%  ImageByLayers  : List
%  Predicados
%  imageDepthLayers(ImageIn, ImageByLayers) aridad = 2
%  Metas Primarias: imageDepthLayers
%  Metas Secundarias: image, positionsGenerator, getDepthsBit, getDepthsRgb , getDepthsHex, filterDepths, filterPixelsByDepthsListBit, filterPixelsByDepthsListRgb, filterPixelsByDepthsListHex, clearList, getPositionsListsBit, getPositionsListsRgb, getPositionsListsHex, positionsMissing, pixelsGeneratorListsBit, pixelsGeneratorListsRgb ,pixelsGeneratorListsHex, mergePixelsLists, imagesGenerator
%  Clausulas

positionsGenerator(W,H,PositionsOut):-
    NewW is W-1,
    NewH is H-1,
    elementsGeneratorI(NewW, NewH, PositionsOut).

elementsGeneratorI(0,J,R):-
    elementsGeneratorJ(0,J,R).

elementsGeneratorI(I,J,R):-
    Kant is I-1,
    elementsGeneratorJ(I,J,Raux),
    append(Raux, Rant, R),
    elementsGeneratorI(Kant,J,Rant).

elementsGeneratorJ(I, 0,R):-
    R=[[I,0]],
    !.

elementsGeneratorJ(I,J,R):-
    Kant is J-1,
    append([[I, J]],Rant,R),
    elementsGeneratorJ(I,Kant, Rant).

%%  ==== bit
pixelByDepthBit(D,P,POut):-
    pixbit(PosX,PosY,Bit,Depth,P),
    (   Depth = D
    ->  pixbit(PosX,PosY,Bit,Depth,POut)
    ;   POut = "no"
    ).

filterPixelByDepthBit(_,[],[]).
filterPixelByDepthBit(D, [P | PixelsIn], [POut | PixelsOut]):-
    pixelByDepthBit(D, P, POut),
    filterPixelByDepthBit(D, PixelsIn, PixelsOut).

filterPixelsByDepthsListBit([],_,[]).
filterPixelsByDepthsListBit([D | DepthsList], PixelsIn, [PixelOut | PixelsList]):-
    filterPixelByDepthBit(D, PixelsIn, PixelOut),
    filterPixelsByDepthsListBit(DepthsList, PixelsIn, PixelsList).
%%  ==== bit

%%  ==== rgb
pixelByDepthRgb(D,P,POut):-
    pixrgb(PosX,PosY,R,G,B,Depth,P),
    (   Depth = D
    ->  pixrgb(PosX,PosY,R,G,B,Depth,POut)
    ;   POut = "no"
    ).

filterPixelByDepthRgb(_,[],[]).
filterPixelByDepthRgb(D, [P | PixelsIn], [POut | PixelsOut]):-
    pixelByDepthRgb(D, P, POut),
    filterPixelByDepthRgb(D, PixelsIn, PixelsOut).

filterPixelsByDepthsListRgb([],_,[]).
filterPixelsByDepthsListRgb([D | DepthsList], PixelsIn, [PixelOut | PixelsList]):-
    filterPixelByDepthRgb(D, PixelsIn, PixelOut),
    filterPixelsByDepthsListRgb(DepthsList, PixelsIn, PixelsList).
%%  ==== rgb

%%  ==== hex
pixelByDepthHex(D,P,POut):-
    pixhex(PosX,PosY,Hex,Depth,P),
    (   Depth = D
    ->  pixbit(PosX,PosY,Hex,Depth,POut)
    ;   POut = "no"
    ).

filterPixelByDepthHex(_,[],[]).
filterPixelByDepthHex(D, [P | PixelsIn], [POut | PixelsOut]):-
    pixelByDepthHex(D, P, POut),
    filterPixelByDepthHex(D, PixelsIn, PixelsOut).

filterPixelsByDepthsListHex([],_,[]).
filterPixelsByDepthsListHex([D | DepthsList], PixelsIn, [PixelOut | PixelsList]):-
    filterPixelByDepthHex(D, PixelsIn, PixelOut),
    filterPixelsByDepthsListHex(DepthsList, PixelsIn, PixelsList).
%%  ==== hex

clearList([],[]).
clearList([PL |PixelLists],[POut | PixelsListsOut]):-
	exclude(string, PL, POut),
    clearList(PixelLists,PixelsListsOut).
 
%%  ==== bit
getDepthsBit([],[]).
getDepthsBit([P | Ps], [DOut|DsOut]):-
    getDBit(P,DOut),
    getDepthsBit(Ps, DsOut). 

getDBit(PixelIn, DOut):-
    pixbit(_,_,_,D,PixelIn),
    DOut=D.
%%  ==== bit

%%  ==== rgb
getDepthsRgb([],[]).
getDepthsRgb([P | Ps], [DOut|DsOut]):-
    getDRgb(P,DOut),
    getDepthsRgb(Ps, DsOut). 

getDRgb(PixelIn, DOut):-
    pixrgb(_,_,_,_,_,D,PixelIn),
    DOut=D.
%%  ==== rgb

%%  ==== hex
getDepthsHex([],[]).
getDepthsHex([P | Ps], [DOut|DsOut]):-
    getDHex(P,DOut),
    getDepthsHex(Ps, DsOut). 

getDHex(PixelIn, DOut):-
    pixhex(_,_,_,D,PixelIn),
    DOut=D.
%%  ==== hex

filterDepths([],[]).
filterDepths([D | DepthsListIn], DepthsList):-
    filterList(D, DepthsListIn, DepthsListInAux),
    append([D], Rant, DepthsList),
    filterDepths(DepthsListInAux, Rant).

%%  ==== bit
getPositionsListsBit([],[]).
getPositionsListsBit([P | PixelsList], [PosL | PositionsAuxListO]):-
    getPositionsOfImageCompressedBit(P, PosL),
    getPositionsListsBit(PixelsList, PositionsAuxListO).
%%  ==== bit

%%  ==== rgb
getPositionsListsRgb([],[]).
getPositionsListsRgb([P | PixelsList], [PosL | PositionsAuxListO]):-
    getPositionsOfImageCompressedRgb(P, PosL),
    getPositionsListsRgb(PixelsList, PositionsAuxListO).
%%  ==== rgb

%%  ==== hex
getPositionsListsHex([],[]).
getPositionsListsHex([P | PixelsList], [PosL | PositionsAuxListO]):-
    getPositionsOfImageCompressedHex(P, PosL),
    getPositionsListsHex(PixelsList, PositionsAuxListO).
%%  ==== hex

positionsMissing([],_,[]).
positionsMissing([Pgen|Pgens], PgensList, [PosList | PosListsOut]):-
    filterPositions(Pgen, PgensList, PosList),
    positionsMissing(Pgens, PgensList, PosListsOut).

%%  ==== bit
pixelsGeneratorLayersBit([],_,_,[]).
pixelsGeneratorLayersBit([Pos|PositionsImageDescompressedOut], Color, Depth, [P|PixelsAuxOut]):-
    newPixelBit(Pos,Color,Depth,P),
    pixelsGeneratorLayersBit(PositionsImageDescompressedOut, Color, Depth, PixelsAuxOut).

pixelsGeneratorListsBit([],[], []).
pixelsGeneratorListsBit([P | Ps], [D | DepthsList], [POut | PixelsListsOut]):-
    pixelsGeneratorLayersBit(P, 0, D, POut),
    pixelsGeneratorListsBit(Ps,DepthsList, PixelsListsOut).
%%  ==== bit

%%  ==== rgb
pixelsGeneratorLayersRgb([],_,_,[]).
pixelsGeneratorLayersRgb([Pos|PositionsImageDescompressedOut], Color, Depth, [P|PixelsAuxOut]):-
    newPixelRgbP(Pos,Color,Depth,P),
    pixelsGeneratorLayersRgb(PositionsImageDescompressedOut, Color, Depth, PixelsAuxOut).


pixelsGeneratorListsRgb([],[], []).
pixelsGeneratorListsRgb([P | Ps], [D | DepthsList], [POut | PixelsListsOut]):-
    pixelsGeneratorLayersRgb(P, [255,255,255], D, POut),
    pixelsGeneratorListsRgb(Ps,DepthsList, PixelsListsOut).
%%  ==== rgb

%%  ==== hex
pixelsGeneratorLayersHex([],_,_,[]).
pixelsGeneratorLayersHex([Pos|PositionsImageDescompressedOut], Color, Depth, [P|PixelsAuxOut]):-
    newPixelHex(Pos,Color,Depth,P),
    pixelsGeneratorLayersHex(PositionsImageDescompressedOut, Color, Depth, PixelsAuxOut).


pixelsGeneratorListsHex([],[], []).
pixelsGeneratorListsHex([P | Ps], [D | DepthsList], [POut | PixelsListsOut]):-
    pixelsGeneratorLayersHex(P, "FFFFFF", D, POut),
    pixelsGeneratorListsHex(Ps,DepthsList, PixelsListsOut).
%%  ==== hex

mergePixelsLists([], [], []).
mergePixelsLists([P | Pixels], [PIn | PixelsIn], [POut | PixelsOut] ):-
    mergePixels(P,PIn, POut),
    mergePixelsLists(Pixels, PixelsIn, PixelsOut).
    
imagesGenerator(_,_,[], []).
imagesGenerator(Width, Height ,[P | Ps], [ImgOut | ImagesByLayers]):-
    image(Width, Height, P, ImgOut),
    imagesGenerator(Width, Height , Ps, ImagesByLayers).
    


 imageDepthLayers(ImageIn, ImageByLayers):-
    image(Width, Height, PixelsIn, ImageIn),
    positionsGenerator(Width, Height, PositionsOut),
    (   imageIsBitmap(ImageIn)
    ->  getDepthsBit(PixelsIn, DepthsListAux)
    ;   (   imageIsPixmap(ImageIn)
        ->  getDepthsRgb(PixelsIn, DepthsListAux)
        ;   getDepthsHex(PixelsIn, DepthsListAux)
        )
    ),
    filterDepths(DepthsListAux, DepthsList), 
    (   imageIsBitmap(ImageIn)
    ->  filterPixelsByDepthsListBit(DepthsList, PixelsIn, PixelsLists)
    ;   (   imageIsPixmap(ImageIn)
        ->  filterPixelsByDepthsListRgb(DepthsList, PixelsIn, PixelsLists)
        ;   filterPixelsByDepthsListHex(DepthsList, PixelsIn, PixelsLists)
        )
    ),
    clearList(PixelsLists,PixelsListsOutAux),
    (   imageIsBitmap(ImageIn)
    ->  getPositionsListsBit(PixelsListsOutAux, PositionsAuxOut)
    ;   (   imageIsPixmap(ImageIn)
        ->  getPositionsListsRgb(PixelsListsOutAux, PositionsAuxOut)
        ;   getPositionsListsHex(PixelsListsOutAux, PositionsAuxOut)
        )
    ),
    positionsMissing(PositionsAuxOut,PositionsOut, PositionsListsOut),
    (   imageIsBitmap(ImageIn)
    ->  pixelsGeneratorListsBit(PositionsListsOut, DepthsList, PixelsListsMissingOut)
    ;   (   imageIsPixmap(ImageIn)
        ->  pixelsGeneratorListsRgb(PositionsListsOut, DepthsList, PixelsListsMissingOut)
        ;   pixelsGeneratorListsHex(PositionsListsOut, DepthsList, PixelsListsMissingOut)
        )
    ),
    mergePixelsLists(PixelsListsMissingOut, PixelsListsOutAux, PixelsMergedLists),
    imagesGenerator(Width, Height ,PixelsMergedLists, ImageByLayers).


% imageDecompress
%  Dominios
%  ImageCompressedIn   : List 
%  ImageOut 	  : List
%  Predicados
%  imageDecompress(ImageCompressedIn, ImageOut) aridad = 2
%  Metas Primarias: imageDecompress
%  Metas Secundarias: imageCompresed, image, positionsGenerator, imageIsBitmap,imageIsPixmap,getPositionsOfImageCompressedRgb,getPositionsOfImageCompressedHex, filterPositions, pixelsGeneratorBit,pixelsGeneratorRgb,pixelsGeneratorHex, mergePixels
%  Clausulas

mergePixels(Pixels,PixelsAuxOut, PixelsOut):-
    append(Pixels, PixelsAuxOut,PixelsOut).

positionOfPixel(X,Y,[X,Y]).

newPixelBit(Pos,Color,D,P):-
    positionOfPixel(X,Y,Pos),
    pixbit(X,Y,Color,D,P).

pixelsGeneratorBit([],_,[],[]).
pixelsGeneratorBit([Pos|PositionsImageDescompressedOut], Color, [D|Depths], [P|PixelsAuxOut]):-
    newPixelBit(Pos,Color,D,P),
    pixelsGeneratorBit(PositionsImageDescompressedOut, Color, Depths, PixelsAuxOut).
 
newPixelRgbP(Pos,Color,D,P):-
    positionOfPixel(X,Y,Pos),
    colorRGB(R,G,B,Color),
    pixrgb(X,Y,R,G,B,D,P).

pixelsGeneratorRgb([],_,[],[]).
pixelsGeneratorRgb([Pos|PositionsImageDescompressedOut], Color, [D|Depths], [P|PixelsAuxOut]):-
    newPixelRgbP(Pos,Color,D,P),
    pixelsGeneratorRgb(PositionsImageDescompressedOut, Color, Depths, PixelsAuxOut).

newPixelHex(Pos,Color,D,P):-
    positionOfPixel(X,Y,Pos),
    pixhex(X,Y,Color,D,P).

pixelsGeneratorHex([],_,[],[]).
pixelsGeneratorHex([Pos|PositionsImageDescompressedOut], Color, [D|Depths], [P|PixelsAuxOut]):-
    newPixelHex(Pos,Color,D,P),
    pixelsGeneratorHex(PositionsImageDescompressedOut, Color, Depths, PixelsAuxOut).

filterPositions([],R,R).
filterPositions([Pos | Positions], PositionsImage , PositionsImageDescompressedOut):-
    filterList(Pos, PositionsImage, PositionsImageDescompressedOutAux),
    filterPositions(Positions, PositionsImageDescompressedOutAux , PositionsImageDescompressedOut).

getPositionBit(PixelIn, PosOut):-
    pixbit(PosX,PosY,_,_,PixelIn),
    PosOut=[PosX,PosY].
    
getPositionsOfImageCompressedBit([],[]).
getPositionsOfImageCompressedBit([PixelIn | PixelsIn], [ PosOut | PositionsOut]):-
     getPositionBit(PixelIn, PosOut),
     getPositionsOfImageCompressedBit(PixelsIn, PositionsOut).

getPositionRgb(PixelIn, PosOut):-
    pixrgb(PosX,PosY,_,_,_,_,PixelIn),
    PosOut=[PosX,PosY].
    
getPositionsOfImageCompressedRgb([],[]).
getPositionsOfImageCompressedRgb([PixelIn | PixelsIn], [ PosOut | PositionsOut]):-
     getPositionRgb(PixelIn, PosOut),
     getPositionsOfImageCompressedRgb(PixelsIn, PositionsOut).

getPositionHex(PixelIn, PosOut):-
    pixhex(PosX,PosY,_,_,PixelIn),
    PosOut=[PosX,PosY].
    
getPositionsOfImageCompressedHex([],[]).
getPositionsOfImageCompressedHex([PixelIn | PixelsIn], [ PosOut | PositionsOut]):-
     getPositionHex(PixelIn, PosOut),
     getPositionsOfImageCompressedHex(PixelsIn, PositionsOut).

imageDecompress(ImageCompressedIn, ImageOut):-
    imageCompresed(ImageAux, Color, Depths, ImageCompressedIn),
    image(Width, Height, Pixels, ImageAux),
	positionsGenerator(Width, Height, PositionsOut),
    (   imageIsBitmap(ImageAux)
    ->  getPositionsOfImageCompressedBit(Pixels, PositionsImageOut)
    ;   (   imageIsPixmap(ImageAux)
        ->  getPositionsOfImageCompressedRgb(Pixels, PositionsImageOut)
        ;   getPositionsOfImageCompressedHex(Pixels, PositionsImageOut)
        )
    ),
	filterPositions(PositionsImageOut, PositionsOut, PositionsImageDescompressedOut),
    (   imageIsBitmap(ImageAux)
    ->  pixelsGeneratorBit(PositionsImageDescompressedOut, Color, Depths, PixelsAuxOut)
    ;   (   imageIsPixmap(ImageAux)
        ->  pixelsGeneratorRgb(PositionsImageDescompressedOut, Color, Depths, PixelsAuxOut)
        ;   pixelsGeneratorHex(PositionsImageDescompressedOut, Color, Depths, PixelsAuxOut)
        )
    ),
	mergePixels(Pixels,PixelsAuxOut, PixelsOut),
    image(Width, Height, PixelsOut, ImageOut).


