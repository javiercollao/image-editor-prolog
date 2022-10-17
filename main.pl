% --------------------------------------------------------------------------
%  @title      TDA lista
%  @author     Javier Collao
%
%  @desc       Este TDA representa lista 
%


% member()
% es map
% call()
 


% --------------------------------------------------------------------------
%  @title      TDA pixbit-d
%  @author     Javier Collao
%
%  @desc       Este TDA representa a la lista pixbit-d
%  pixbit-d = x (int) X y (int) X bit ([0|1]) X depth (int)
%

%  Dominios
%  PosX    : Integer
%  PosY    : Integer 
%  Bit     : Integer [0|1]
%  Depth   : Integer

%  Predicados: 
%   pixbit(PosX, PosY, Bit, Depth, PixbitList) aridad = 4
%  Metas Primarias: pixbit
%  Metas Secundarias: NA
%  Clausulas

pixbit(PosX, PosY, Bit, Depth, [PosX, PosY, Bit, Depth]).

% --------------------------------------------------------------------------
%  @title      TDA pixhex-d
%  @author     Javier Collao
%
%  @desc Este TDA representa a la lista pixhex-d
%   pixhex-d = x (int) X y (int) X hex(String) X d (int)
%

%  Dominios
%  IdSimbolo    : Integer
%  Simbolo      : String 
%  Predicados
%  Metas Primarias
%  Metas Secundarias 


pixhex(PosX, PosY, Hex, Depth, [PosX, PosY, Hex, Depth]).

%  Clausulas

% --------------------------------------------------------------------------
%  @title      TDA pixrgb-d
%  @author     Javier Collao
%
%  @desc       Este TDA representa a la lista pixrgb-d
%  pixrgb-d = x (int) X y (int) X r (C) X g (C) X b(C) X d (int)
%

%  Dominios
%  IdSimbolo    : Integer
%  Simbolo      : String 
%  Predicados
%  Metas Primarias 
%  Metas Secundarias  
%  Clausulas

pixrgb(PosX, PosY, R, G, B, Depth, [PosX, PosY, R, G, B, Depth]).


% --------------------------------------------------------------------------
%  @title      TDA image
%  @author     Javier Collao
%
%  @desc        Este TDA representa a la lista image, contiene todas las 
%  características para las creación  de una imagen.
%
%  image = Width (int) X Height (int) X [pixbit-d* | pixrgb-d* | pixhex-d*]
%

%  Dominios
%  IdSimbolo    : Integer
%  Simbolo      : String 
%  Predicados
%  Metas Primarias
%  getSimbolo
%  Metas Secundarias 
%  Clausulas

image(Width, Height, Pixels, [Width, Height, Pixels])
