% Scripts de prueba

% Podemos generar tres tipos de imágenes con el comando image, 
% con el comando pixbit los píxeles serán de tipo bit, 
% con el comando pixrgb los píxeles serán de tipo rgb y
% con el comando pixhex los píxeles serán de tipo héxadecimal
% ======================================================
%                       pixbit
%                       pixrgb
%                       pixhex
%                       image
% ======================================================

pixbit(0,0,1,10,P1),
pixbit(0,1,0,20,P2),
pixbit(1,0,0,30,P3),
pixbit(1,1,1,4,P4),
image(2,2,[P1,P2,P3,P4],Img1).

pixbit(0,0,1,10,P1),
pixbit(0,1,0,20,P2),
pixbit(0,2,0,30,P3),
pixbit(1,0,1,10,P4),
pixbit(1,1,0,10,P5),
pixbit(1,2,1,10,P6),
pixbit(2,0,0,10,P7),
pixbit(2,1,1,10,P8),
pixbit(2,2,1,10,P9),
image(3,3,[P1,P2,P3,P4,P5,P6,P7,P8,P9],Img2).

pixbit(0,0,1,5,P1),
pixbit(1,0,0,4,P2),
pixbit(2,0,0,6,P3),
pixbit(3,0,0,4,P4),
pixbit(4,0,1,7,P5),
pixbit(5,0,0,7,P6),
pixbit(6,0,0,4,P7),
pixbit(7,0,0,4,P8),
pixbit(8,0,0,4,P9),
pixbit(0,1,1,7,P10),
pixbit(1,1,0,4,P11),
pixbit(2,1,1,7,P12),
pixbit(3,1,0,4,P13),
pixbit(4,1,1,7,P14),
pixbit(5,1,0,4,P15),
pixbit(6,1,0,4,P16),
pixbit(7,1,0,4,P17),
pixbit(8,1,0,4,P18),
pixbit(0,2,1,6,P19),
pixbit(1,2,1,7,P20),
pixbit(2,2,1,7,P21),
pixbit(3,2,1,7,P22),
pixbit(4,2,1,5,P23),
pixbit(5,2,0,4,P24),
pixbit(6,2,0,4,P25),
pixbit(7,2,0,4,P26),
pixbit(8,2,0,4,P27),
pixbit(0,3,0,5,P28),
pixbit(1,3,1,7,P29),
pixbit(2,3,1,7,P30),
pixbit(3,3,1,7,P31),
pixbit(4,3,0,4,P32),
pixbit(5,3,0,4,P33),
pixbit(6,3,1,7,P34),
pixbit(7,3,1,7,P35),
pixbit(8,3,0,4,P36),
pixbit(0,4,0,4,P37),
pixbit(1,4,1,7,P38),
pixbit(2,4,1,7,P39),
pixbit(3,4,1,7,P40),
pixbit(4,4,1,7,P41),
pixbit(5,4,1,7,P42),
pixbit(6,4,1,7,P43),
pixbit(7,4,0,4,P44),
pixbit(8,4,1,7,P45),
pixbit(0,5,0,4,P46),
pixbit(1,5,1,7,P47),
pixbit(2,5,1,7,P48),
pixbit(3,5,1,7,P49),
pixbit(4,5,1,7,P50),
pixbit(5,5,0,4,P51),
pixbit(6,5,0,4,P52),
pixbit(7,5,0,4,P53),
pixbit(8,5,1,7,P54),
pixbit(0,6,0,4,P55),
pixbit(1,6,0,4,P56),
pixbit(2,6,0,4,P57),
pixbit(3,6,0,4,P58),
pixbit(4,6,0,4,P59),
pixbit(5,6,0,4,P60),
pixbit(6,6,0,4,P61),
pixbit(7,6,0,4,P62),
pixbit(8,6,0,4,P63),
image(9,7,[P1,P2,P3,P4,P5,P6,P7,P8,P9,P10,P11,P12,P13,P14,P15,P16,P17,P18,P19,P20,P21,P22,P23,P24,P25,P26,P27,P28,P29,P30,P31,P32,P33,P34,P35,P36,P37,P38,P39,P40,P41,P42,P43,P44,P45,P46,P47,P48,P49,P50,P51,P52,P53,P54,P55,P56,P57,P58,P59,P60,P61,P62,P63],Img3).

pixrgb(0,0,10,10,10,10,P1),
pixrgb(0,1,20,20,20,20,P2),
pixrgb(1,0,30,30,30,30,P3),
pixrgb(1,1,40,40,40,40,P4),
image(2,2,[P1,P2,P3,P4],Img4). 

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
image(4,4,[P1,P2,P3,P4,P5,P6,P7,P8,P9,P10,P11,P12,P13,P14,P15,P16],Img4).

pixrgb(0,0,11,2,0,12,P1),
pixrgb(1,0,210,130,140,32,P2),
pixrgb(2,0,215,213,110,13,P3),
pixrgb(3,0,10,10,10,1,P4),
pixrgb(0,1,233,222,0,2,P5),
pixrgb(1,1,21,10,140,13,P6),
pixrgb(2,1,225,243,10,2,P7),
pixrgb(3,1,3,140,130,13,P8),
pixrgb(0,2,1,22,20,13,P9),
pixrgb(1,2,20,130,40,42,P10),
pixrgb(2,2,215,23,10,14,P11),
pixrgb(3,2,101,240,250,1,P12),
image(4,3,[P1,P2,P3,P4,P5,P6,P7,P8,P9,P10,P11,P12],Img5).

pixhex(0,0,"0A0A0A",13,P1),
pixhex(0,1,"141414",24,P2),
pixhex(0,2,"0A0A0A",1,P3),
pixhex(1,0,"1E1E1E",330,P4),
pixhex(1,1,"282828",20,P5),
pixhex(1,2,"1E1E1E",35,P6),
pixhex(2,0,"1E1E1E",3,P7),
pixhex(2,1,"1E1E1E",6,P8),
pixhex(2,2,"1E1E1E",66,P9),
image(3,3,[P1,P2,P3,P4,P5,P6,P7,P8,P9],Img6).

% Para cada imagen podemos utilizar diferentes funciones como las siguientes:
% ======================================================
%                       imageFlipH
% ======================================================

pixbit(0,0,1,10,P1),
pixbit(0,1,0,20,P2),
pixbit(1,0,0,30,P3),
pixbit(1,1,1,4,P4),
image(2,2,[P1,P2,P3,P4],Img1),
imageFlipH(Img1,R).

pixrgb(0,0,11,2,0,12,P1),
pixrgb(1,0,210,130,140,32,P2),
pixrgb(2,0,215,213,110,13,P3),
pixrgb(3,0,10,10,10,1,P4),
pixrgb(0,1,233,222,0,2,P5),
pixrgb(1,1,21,10,140,13,P6),
pixrgb(2,1,225,243,10,2,P7),
pixrgb(3,1,3,140,130,13,P8),
pixrgb(0,2,1,22,20,13,P9),
pixrgb(1,2,20,130,40,42,P10),
pixrgb(2,2,215,23,10,14,P11),
pixrgb(3,2,101,240,250,1,P12),
image(4,3,[P1,P2,P3,P4,P5,P6,P7,P8,P9,P10,P11,P12],Img5),
imageFlipH(Img5,R).

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
imageFlipH(Img6,R).

% ======================================================
%                       imageFlipV
% ======================================================

pixbit(0,0,1,5,P1),
pixbit(1,0,0,4,P2),
pixbit(2,0,0,6,P3),
pixbit(3,0,0,4,P4),
pixbit(4,0,1,7,P5),
pixbit(5,0,0,7,P6),
pixbit(6,0,0,4,P7),
pixbit(7,0,0,4,P8),
pixbit(8,0,0,4,P9),
pixbit(0,1,1,7,P10),
pixbit(1,1,0,4,P11),
pixbit(2,1,1,7,P12),
pixbit(3,1,0,4,P13),
pixbit(4,1,1,7,P14),
pixbit(5,1,0,4,P15),
pixbit(6,1,0,4,P16),
pixbit(7,1,0,4,P17),
pixbit(8,1,0,4,P18),
pixbit(0,2,1,6,P19),
pixbit(1,2,1,7,P20),
pixbit(2,2,1,7,P21),
pixbit(3,2,1,7,P22),
pixbit(4,2,1,5,P23),
pixbit(5,2,0,4,P24),
pixbit(6,2,0,4,P25),
pixbit(7,2,0,4,P26),
pixbit(8,2,0,4,P27),
pixbit(0,3,0,5,P28),
pixbit(1,3,1,7,P29),
pixbit(2,3,1,7,P30),
pixbit(3,3,1,7,P31),
pixbit(4,3,0,4,P32),
pixbit(5,3,0,4,P33),
pixbit(6,3,1,7,P34),
pixbit(7,3,1,7,P35),
pixbit(8,3,0,4,P36),
pixbit(0,4,0,4,P37),
pixbit(1,4,1,7,P38),
pixbit(2,4,1,7,P39),
pixbit(3,4,1,7,P40),
pixbit(4,4,1,7,P41),
pixbit(5,4,1,7,P42),
pixbit(6,4,1,7,P43),
pixbit(7,4,0,4,P44),
pixbit(8,4,1,7,P45),
pixbit(0,5,0,4,P46),
pixbit(1,5,1,7,P47),
pixbit(2,5,1,7,P48),
pixbit(3,5,1,7,P49),
pixbit(4,5,1,7,P50),
pixbit(5,5,0,4,P51),
pixbit(6,5,0,4,P52),
pixbit(7,5,0,4,P53),
pixbit(8,5,1,7,P54),
pixbit(0,6,0,4,P55),
pixbit(1,6,0,4,P56),
pixbit(2,6,0,4,P57),
pixbit(3,6,0,4,P58),
pixbit(4,6,0,4,P59),
pixbit(5,6,0,4,P60),
pixbit(6,6,0,4,P61),
pixbit(7,6,0,4,P62),
pixbit(8,6,0,4,P63),
image(9,7,[P1,P2,P3,P4,P5,P6,P7,P8,P9,P10,P11,P12,P13,P14,P15,P16,P17,P18,P19,P20,P21,P22,P23,P24,P25,P26,P27,P28,P29,P30,P31,P32,P33,P34,P35,P36,P37,P38,P39,P40,P41,P42,P43,P44,P45,P46,P47,P48,P49,P50,P51,P52,P53,P54,P55,P56,P57,P58,P59,P60,P61,P62,P63],Img3),
imageFlipV(Img3,R).

pixrgb(0,0,11,2,0,12,P1),
pixrgb(1,0,210,130,140,32,P2),
pixrgb(2,0,215,213,110,13,P3),
pixrgb(3,0,10,10,10,1,P4),
pixrgb(0,1,233,222,0,2,P5),
pixrgb(1,1,21,10,140,13,P6),
pixrgb(2,1,225,243,10,2,P7),
pixrgb(3,1,3,140,130,13,P8),
pixrgb(0,2,1,22,20,13,P9),
pixrgb(1,2,20,130,40,42,P10),
pixrgb(2,2,215,23,10,14,P11),
pixrgb(3,2,101,240,250,1,P12),
image(4,3,[P1,P2,P3,P4,P5,P6,P7,P8,P9,P10,P11,P12],Img5),
imageFlipV(Img5,R).

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
imageFlipV(Img6,R).
 
% ======================================================
%                       imageCrop
% ======================================================

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
imageCrop(Img4,1,1,2,1, R).

pixbit(0,0,1,5,P1),
pixbit(1,0,0,4,P2),
pixbit(2,0,0,6,P3),
pixbit(3,0,0,4,P4),
pixbit(4,0,1,7,P5),
pixbit(5,0,0,7,P6),
pixbit(6,0,0,4,P7),
pixbit(7,0,0,4,P8),
pixbit(8,0,0,4,P9),
pixbit(0,1,1,7,P10),
pixbit(1,1,0,4,P11),
pixbit(2,1,1,7,P12),
pixbit(3,1,0,4,P13),
pixbit(4,1,1,7,P14),
pixbit(5,1,0,4,P15),
pixbit(6,1,0,4,P16),
pixbit(7,1,0,4,P17),
pixbit(8,1,0,4,P18),
pixbit(0,2,1,6,P19),
pixbit(1,2,1,7,P20),
pixbit(2,2,1,7,P21),
pixbit(3,2,1,7,P22),
pixbit(4,2,1,5,P23),
pixbit(5,2,0,4,P24),
pixbit(6,2,0,4,P25),
pixbit(7,2,0,4,P26),
pixbit(8,2,0,4,P27),
pixbit(0,3,0,5,P28),
pixbit(1,3,1,7,P29),
pixbit(2,3,1,7,P30),
pixbit(3,3,1,7,P31),
pixbit(4,3,0,4,P32),
pixbit(5,3,0,4,P33),
pixbit(6,3,1,7,P34),
pixbit(7,3,1,7,P35),
pixbit(8,3,0,4,P36),
pixbit(0,4,0,4,P37),
pixbit(1,4,1,7,P38),
pixbit(2,4,1,7,P39),
pixbit(3,4,1,7,P40),
pixbit(4,4,1,7,P41),
pixbit(5,4,1,7,P42),
pixbit(6,4,1,7,P43),
pixbit(7,4,0,4,P44),
pixbit(8,4,1,7,P45),
pixbit(0,5,0,4,P46),
pixbit(1,5,1,7,P47),
pixbit(2,5,1,7,P48),
pixbit(3,5,1,7,P49),
pixbit(4,5,1,7,P50),
pixbit(5,5,0,4,P51),
pixbit(6,5,0,4,P52),
pixbit(7,5,0,4,P53),
pixbit(8,5,1,7,P54),
pixbit(0,6,0,4,P55),
pixbit(1,6,0,4,P56),
pixbit(2,6,0,4,P57),
pixbit(3,6,0,4,P58),
pixbit(4,6,0,4,P59),
pixbit(5,6,0,4,P60),
pixbit(6,6,0,4,P61),
pixbit(7,6,0,4,P62),
pixbit(8,6,0,4,P63),
image(9,7,[P1,P2,P3,P4,P5,P6,P7,P8,P9,P10,P11,P12,P13,P14,P15,P16,P17,P18,P19,P20,P21,P22,P23,P24,P25,P26,P27,P28,P29,P30,P31,P32,P33,P34,P35,P36,P37,P38,P39,P40,P41,P42,P43,P44,P45,P46,P47,P48,P49,P50,P51,P52,P53,P54,P55,P56,P57,P58,P59,P60,P61,P62,P63],Img3),
imageCrop(Img3,1,4,7,4, R).

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
imageCrop(Img6,0,1,2,1, R).

% ======================================================
%                       imageRGBToHex
% ======================================================

pixrgb(0,0,10,10,10,10,P1),
pixrgb(0,1,20,20,20,20,P2),
pixrgb(1,0,30,30,30,30,P3),
pixrgb(1,1,40,40,40,40,P4),
image(2,2,[P1,P2,P3,P4],Img1),
imageRGBToHex(Img1,R).

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
image(4,4,[P1,P2,P3,P4,P5,P6,P7,P8,P9,P10,P11,P12,P13,P14,P15,P16],Img2),
imageRGBToHex(Img2,R).

pixrgb(0,0,11,2,0,12,P1),
pixrgb(1,0,210,130,140,32,P2),
pixrgb(2,0,215,213,110,13,P3),
pixrgb(3,0,10,10,10,1,P4),
pixrgb(0,1,233,222,0,2,P5),
pixrgb(1,1,21,10,140,13,P6),
pixrgb(2,1,225,243,10,2,P7),
pixrgb(3,1,3,140,130,13,P8),
pixrgb(0,2,1,22,20,13,P9),
pixrgb(1,2,20,130,40,42,P10),
pixrgb(2,2,215,23,10,14,P11),
pixrgb(3,2,101,240,250,1,P12),
image(4,3,[P1,P2,P3,P4,P5,P6,P7,P8,P9,P10,P11,P12],Img3),
imageRGBToHex(Img3,R).

% ======================================================
%                       imageToHistogram
% ======================================================

pixbit(0,0,1,5,P1),
pixbit(1,0,0,4,P2),
pixbit(2,0,0,6,P3),
pixbit(3,0,0,4,P4),
pixbit(4,0,1,7,P5),
pixbit(5,0,0,7,P6),
pixbit(6,0,0,4,P7),
pixbit(7,0,0,4,P8),
pixbit(8,0,0,4,P9),
pixbit(0,1,1,7,P10),
pixbit(1,1,0,4,P11),
pixbit(2,1,1,7,P12),
pixbit(3,1,0,4,P13),
pixbit(4,1,1,7,P14),
pixbit(5,1,0,4,P15),
pixbit(6,1,0,4,P16),
pixbit(7,1,0,4,P17),
pixbit(8,1,0,4,P18),
pixbit(0,2,1,6,P19),
pixbit(1,2,1,7,P20),
pixbit(2,2,1,7,P21),
pixbit(3,2,1,7,P22),
pixbit(4,2,1,5,P23),
pixbit(5,2,0,4,P24),
pixbit(6,2,0,4,P25),
pixbit(7,2,0,4,P26),
pixbit(8,2,0,4,P27),
pixbit(0,3,0,5,P28),
pixbit(1,3,1,7,P29),
pixbit(2,3,1,7,P30),
pixbit(3,3,1,7,P31),
pixbit(4,3,0,4,P32),
pixbit(5,3,0,4,P33),
pixbit(6,3,1,7,P34),
pixbit(7,3,1,7,P35),
pixbit(8,3,0,4,P36),
pixbit(0,4,0,4,P37),
pixbit(1,4,1,7,P38),
pixbit(2,4,1,7,P39),
pixbit(3,4,1,7,P40),
pixbit(4,4,1,7,P41),
pixbit(5,4,1,7,P42),
pixbit(6,4,1,7,P43),
pixbit(7,4,0,4,P44),
pixbit(8,4,1,7,P45),
pixbit(0,5,0,4,P46),
pixbit(1,5,1,7,P47),
pixbit(2,5,1,7,P48),
pixbit(3,5,1,7,P49),
pixbit(4,5,1,7,P50),
pixbit(5,5,0,4,P51),
pixbit(6,5,0,4,P52),
pixbit(7,5,0,4,P53),
pixbit(8,5,1,7,P54),
pixbit(0,6,0,4,P55),
pixbit(1,6,0,4,P56),
pixbit(2,6,0,4,P57),
pixbit(3,6,0,4,P58),
pixbit(4,6,0,4,P59),
pixbit(5,6,0,4,P60),
pixbit(6,6,0,4,P61),
pixbit(7,6,0,4,P62),
pixbit(8,6,0,4,P63),
image(9,7,[P1,P2,P3,P4,P5,P6,P7,P8,P9,P10,P11,P12,P13,P14,P15,P16,P17,P18,P19,P20,P21,P22,P23,P24,P25,P26,P27,P28,P29,P30,P31,P32,P33,P34,P35,P36,P37,P38,P39,P40,P41,P42,P43,P44,P45,P46,P47,P48,P49,P50,P51,P52,P53,P54,P55,P56,P57,P58,P59,P60,P61,P62,P63],Img3),
imageToHistogram(Img3,R).

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
imageToHistogram(Img4,R).

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

% ======================================================
%                       imageRotate90
% ======================================================

pixbit(0,0,1,10,P1),
pixbit(0,1,0,20,P2),
pixbit(0,2,0,30,P3),
pixbit(1,0,1,40,P4),
pixbit(1,1,0,50,P5),
pixbit(1,2,1,60,P6),
pixbit(2,0,0,70,P7),
pixbit(2,1,1,80,P8),
pixbit(2,2,1,90,P9),
image(3,3,[P1,P2,P3,P4,P5,P6,P7,P8,P9],Img2),
imageRotate90(Img2,R).

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
imageRotate90(Img4,R).

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
imageRotate90(Img6,R).

% ======================================================
%                       imageCompress
% ======================================================

pixbit(0,0,1,10,P1),
pixbit(0,1,0,20,P2),
pixbit(0,2,0,30,P3),
pixbit(1,0,1,10,P4),
pixbit(1,1,0,10,P5),
pixbit(1,2,1,10,P6),
pixbit(2,0,0,10,P7),
pixbit(2,1,1,10,P8),
pixbit(2,2,1,10,P9),
image(3,3,[P1,P2,P3,P4,P5,P6,P7,P8,P9],Img2),
imageCompress(Img2, CImg2).

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
imageCompress(Img4,CImg4).

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
imageCompress(Img6, CImg6).

% ======================================================
%                      imageChangePixel
% ======================================================

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
pixrgb(3,3,230,50,220,30,NewPixel),
imageChangePixel(Img4, NewPixel, R).

pixrgb(0,0,11,2,0,12,P1),
pixrgb(1,0,210,130,140,32,P2),
pixrgb(2,0,215,213,110,13,P3),
pixrgb(3,0,10,10,10,1,P4),
pixrgb(0,1,233,222,0,2,P5),
pixrgb(1,1,21,10,140,13,P6),
pixrgb(2,1,225,243,10,2,P7),
pixrgb(3,1,3,140,130,13,P8),
pixrgb(0,2,1,22,20,13,P9),
pixrgb(1,2,20,130,40,42,P10),
pixrgb(2,2,215,23,10,14,P11),
pixrgb(3,2,101,240,250,1,P12),
image(4,3,[P1,P2,P3,P4,P5,P6,P7,P8,P9,P10,P11,P12],Img3),
pixrgb(0,1,23,255,2,9,NewPixel),
imageChangePixel(Img3, NewPixel, R).

pixrgb(0,0,10,10,10,10,P1),
pixrgb(0,1,20,20,20,20,P2),
pixrgb(1,0,30,30,30,30,P3),
pixrgb(1,1,40,40,40,40,P4),
image(2,2,[P1,P2,P3,P4],Img4),
pixrgb(1,0,230,50,220,30,NewPixel),
imageChangePixel(Img3, NewPixel, R).

% ======================================================
%                       imageInvertColorRG
% ======================================================

pixrgb(2,1,30,30,30,21,P10),
imageInvertColorRGB(P10, R).

pixrgb(1,0,230,50,220,30,NewPixel),
imageInvertColorRGB(NewPixel, R).

pixrgb( 0, 0, 10, 10, 10, 10, P1), 
pixrgb( 0, 1, 20, 20, 20, 20, P2), 
pixrgb( 1, 0, 30, 30, 30, 30, P3), 
pixrgb( 1, 1, 40, 40, 40, 40, P4), 
image(2, 2, [P1, P2, P3, P4], I1), 
imageInvertColorRGB(P2, P2_modificado), 
imageChangePixel(I1, P2_modificado, I2).

% ======================================================
%                       imageToString
% ======================================================

pixbit(0,0,1,10,P1),
pixbit(0,1,0,20,P2),
pixbit(0,2,0,30,P3),
pixbit(1,0,1,10,P4),
pixbit(1,1,0,10,P5),
pixbit(1,2,1,10,P6),
pixbit(2,0,0,10,P7),
pixbit(2,1,1,10,P8),
pixbit(2,2,1,10,P9),
image(3,3,[P1,P2,P3,P4,P5,P6,P7,P8,P9],Img2),
imageToString(Img2, I).

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
imageToString(Img6, I).

% ======================================================
%                       imageDepthLayers
% ======================================================

pixbit(0,0,1,10,P1),
pixbit(0,1,0,20,P2),
pixbit(1,0,0,30,P3),
pixbit(1,1,1,4,P4),
image(2,2,[P1,P2,P3,P4],Img1),
imageDepthLayers(Img1, I).

pixrgb(0,0,10,10,10,10,P1),
pixrgb(0,1,20,20,20,20,P2),
pixrgb(1,0,30,30,30,30,P3),
pixrgb(1,1,40,40,40,40,P4),
image(2,2,[P1,P2,P3,P4],Img4),
imageDepthLayers(Img4, I).

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
imageDepthLayers(Img6, I).

% ======================================================
%                       imageDecompress
% ======================================================

CImg1 = [[3, 3, [[0, 1, 0, 20], [0, 2, 0, 30], [1, 1, 0, 10], [2, 0, 0, 10]]],1,[10, 10, 10, 10, 10]],
imageDecompress(CImg2, I).

CImg2 = [[3, 3, [[0, 1, 0, 20], [0, 2, 0, 30], [1, 1, 0, 10], [2, 0, 0, 10]]],1,[10, 10, 10, 10, 10]],
imageDecompress(CImg2, Im).

CImg3 = [[3, 3, [[0, 0, "0A0A0A", 13],[0, 1, "141414", 24],[0, 2, "0A0A0A", 1],[1, 1, "282828", 20]]], "1E1E1E", [330, 35, 3, 6, 66]],
imageDecompress(CImg3, Im).

pixbit(0,0,1,10,P1),
pixbit(0,1,0,20,P2),
pixbit(0,2,0,30,P3),
pixbit(1,0,1,10,P4),
pixbit(1,1,0,10,P5),
pixbit(1,2,1,10,P6),
pixbit(2,0,0,10,P7),
pixbit(2,1,1,10,P8),
pixbit(2,2,1,10,P9),
image(3,3,[P1,P2,P3,P4,P5,P6,P7,P8,P9],Img2),
imageCompress(Img2, CImg2),
imageDecompress(CImg2, I).

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
imageCompress(Img4,CImg4),
imageDecompress(CImg4, I).

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
imageCompress(Img6, CImg6),
imageDecompress(CImg6, I).



