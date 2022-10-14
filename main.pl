% --------------------------------------------------------------------------
%  @title      TDA pixbit-d
%  @author     Javier Collao
%
%  @desc       Este TDA representa a la lista pixbit-d
%  pixbit-d = x (int) X y (int) X bit ([0|1]) X depth (int)
%

%  Dominios
%  posX    : Integer
%  posY    : Integer 
%  bit     : Integer [0|1]
%  depth   : Integer
%  Predicados
%  pixbit(posX, posY, bit, depth) aridad=4
%  Metas Primarias
%  pixbit(posX, posY, bit, depth)
%  Metas Secundarias 
%  Clausulas

pixbit(posX, posY, bit, depth)

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
%  getSimbolo
%  Metas Secundarias 
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
%  getSimbolo
%  Metas Secundarias 
%  Clausulas



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