KR_CHAR 14 char
IDN 14 x
TOCKAZAREZ 14 ;
KR_CONST 15 const
KR_INT 15 int
IDN 15 z
OP_PRIDRUZI 15 =
BROJ 15 9
TOCKAZAREZ 15 ;
KR_INT 16 int
IDN 16 printf
L_ZAGRADA 16 (
KR_CONST 16 const
KR_CHAR 16 char
IDN 16 format
L_UGL_ZAGRADA 16 [
D_UGL_ZAGRADA 16 ]
D_ZAGRADA 16 )
L_VIT_ZAGRADA 16 {
KR_RETURN 18 return
BROJ 18 0
TOCKAZAREZ 18 ;
D_VIT_ZAGRADA 19 }
KR_INT 20 int
IDN 20 fun
L_ZAGRADA 20 (
KR_INT 20 int
IDN 20 a
ZAREZ 20 ,
KR_CHAR 20 char
IDN 20 g
L_UGL_ZAGRADA 20 [
D_UGL_ZAGRADA 20 ]
D_ZAGRADA 20 )
TOCKAZAREZ 20 ;
KR_INT 21 int
IDN 21 main
L_ZAGRADA 21 (
KR_VOID 21 void
D_ZAGRADA 21 )
L_VIT_ZAGRADA 21 {
KR_INT 22 int
IDN 22 a
OP_PRIDRUZI 22 =
BROJ 22 4
TOCKAZAREZ 22 ;
L_VIT_ZAGRADA 23 {
KR_INT 24 int
IDN 24 a
OP_PRIDRUZI 24 =
BROJ 24 2
TOCKAZAREZ 24 ;
KR_WHILE 25 while
L_ZAGRADA 25 (
IDN 25 a
OP_EQ 25 ==
BROJ 25 3
D_ZAGRADA 25 )
L_VIT_ZAGRADA 26 {
KR_BREAK 27 break
TOCKAZAREZ 27 ;
D_VIT_ZAGRADA 28 }
KR_CHAR 29 char
IDN 29 jjj
L_UGL_ZAGRADA 29 [
D_UGL_ZAGRADA 29 ]
OP_PRIDRUZI 29 =
NIZ_ZNAKOVA 29 "ab"
TOCKAZAREZ 29 ;
KR_INT 30 int
IDN 30 c
TOCKAZAREZ 30 ;
IDN 31 c
OP_PRIDRUZI 31 =
IDN 31 fun
L_ZAGRADA 31 (
BROJ 31 4
ZAREZ 31 ,
IDN 31 jjj
D_ZAGRADA 31 )
TOCKAZAREZ 31 ;
KR_RETURN 32 return
IDN 32 printf
L_ZAGRADA 32 (
NIZ_ZNAKOVA 32 "hello world!\n"
D_ZAGRADA 32 )
TOCKAZAREZ 32 ;
D_VIT_ZAGRADA 33 }
KR_INT 35 int
IDN 35 fun
L_ZAGRADA 35 (
KR_INT 35 int
IDN 35 a
ZAREZ 35 ,
KR_CHAR 35 char
IDN 35 g
L_UGL_ZAGRADA 35 [
D_UGL_ZAGRADA 35 ]
D_ZAGRADA 35 )
L_VIT_ZAGRADA 36 {
KR_CONST 37 const
KR_INT 37 int
IDN 37 i
OP_PRIDRUZI 37 =
BROJ 37 8
TOCKAZAREZ 37 ;
KR_CHAR 38 char
IDN 38 ch
OP_PRIDRUZI 38 =
ZNAK 38 'h'
TOCKAZAREZ 38 ;
KR_RETURN 39 return
KR_INT 39 int
L_ZAGRADA 39 (
IDN 39 i
PLUS 39 +
IDN 39 ch
D_ZAGRADA 39 )
TOCKAZAREZ 39 ;
D_VIT_ZAGRADA 40 }