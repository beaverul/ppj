KR_INT 15 int
IDN 15 printf
L_ZAGRADA 15 (
KR_CONST 15 const
KR_CHAR 15 char
IDN 15 format
L_UGL_ZAGRADA 15 [
D_UGL_ZAGRADA 15 ]
D_ZAGRADA 15 )
L_VIT_ZAGRADA 15 {
KR_RETURN 17 return
BROJ 17 0
TOCKAZAREZ 17 ;
D_VIT_ZAGRADA 18 }
KR_INT 20 int
IDN 20 aniz
L_ZAGRADA 20 (
KR_INT 20 int
IDN 20 a0
ZAREZ 20 ,
KR_INT 20 int
IDN 20 d
ZAREZ 20 ,
KR_INT 20 int
IDN 20 n
D_ZAGRADA 20 )
L_VIT_ZAGRADA 20 {
KR_IF 21 if
L_ZAGRADA 21 (
IDN 21 n
OP_EQ 21 ==
BROJ 21 0
D_ZAGRADA 21 )
KR_RETURN 21 return
IDN 21 a0
TOCKAZAREZ 21 ;
KR_ELSE 22 else
KR_RETURN 22 return
IDN 22 d
PLUS 22 +
IDN 22 aniz
L_ZAGRADA 22 (
IDN 22 a0
ZAREZ 22 ,
IDN 22 d
ZAREZ 22 ,
IDN 22 n
MINUS 22 -
BROJ 22 1
D_ZAGRADA 22 )
TOCKAZAREZ 22 ;
D_VIT_ZAGRADA 23 }
KR_INT 26 int
IDN 26 main
L_ZAGRADA 26 (
KR_VOID 26 void
D_ZAGRADA 26 )
L_VIT_ZAGRADA 26 {
KR_INT 27 int
IDN 27 a0
ZAREZ 27 ,
IDN 27 d
ZAREZ 27 ,
IDN 27 n
ZAREZ 27 ,
IDN 27 nclan
TOCKAZAREZ 27 ;
IDN 28 n
OP_PRIDRUZI 28 =
BROJ 28 0
TOCKAZAREZ 28 ;
KR_WHILE 29 while
L_ZAGRADA 29 (
BROJ 29 1
D_ZAGRADA 29 )
L_VIT_ZAGRADA 29 {
IDN 30 printf
L_ZAGRADA 30 (
NIZ_ZNAKOVA 30 "\nUpisite nulti clan, diferenciju i indeks zadanog clana >"
D_ZAGRADA 30 )
TOCKAZAREZ 30 ;
KR_IF 31 if
L_ZAGRADA 31 (
IDN 31 n
OP_LT 31 <
BROJ 31 100000
D_ZAGRADA 31 )
KR_BREAK 31 break
TOCKAZAREZ 31 ;
IDN 32 nclan
OP_PRIDRUZI 32 =
IDN 32 aniz
L_ZAGRADA 32 (
IDN 32 a0
ZAREZ 32 ,
IDN 32 d
ZAREZ 32 ,
IDN 32 n
D_ZAGRADA 32 )
TOCKAZAREZ 32 ;
IDN 33 n
OP_INC 33 ++
TOCKAZAREZ 33 ;
IDN 34 printf
L_ZAGRADA 34 (
NIZ_ZNAKOVA 34 "\n %d. clan aritmetickog niza, s nultim clanom %d i diferencijom %d: %d \n"
ZAREZ 34 ,
IDN 34 n
ZAREZ 34 ,
IDN 34 a0
ZAREZ 34 ,
IDN 34 d
ZAREZ 34 ,
IDN 34 nclan
D_ZAGRADA 34 )
TOCKAZAREZ 34 ;
D_VIT_ZAGRADA 35 }
IDN 36 printf
L_ZAGRADA 36 (
NIZ_ZNAKOVA 36 "\nNegativni indeks clana %d\n"
ZAREZ 36 ,
IDN 36 n
D_ZAGRADA 36 )
TOCKAZAREZ 36 ;
KR_RETURN 37 return
BROJ 37 0
TOCKAZAREZ 37 ;
D_VIT_ZAGRADA 39 }
