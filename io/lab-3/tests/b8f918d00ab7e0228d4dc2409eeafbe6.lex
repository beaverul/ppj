KR_INT 15 int
IDN 15 printf
L_ZAGRADA 15 (
KR_INT 15 int
IDN 15 x
D_ZAGRADA 15 )
L_VIT_ZAGRADA 15 {
KR_RETURN 17 return
BROJ 17 0
TOCKAZAREZ 17 ;
D_VIT_ZAGRADA 18 }
KR_INT 20 int
IDN 20 main
L_ZAGRADA 20 (
KR_VOID 20 void
D_ZAGRADA 20 )
L_VIT_ZAGRADA 20 {
KR_INT 21 int
IDN 21 i
ZAREZ 21 ,
IDN 21 j
ZAREZ 21 ,
IDN 21 n
TOCKAZAREZ 21 ;
IDN 23 struct
IDN 23 timeb
IDN 23 vrijeme1
ZAREZ 23 ,
IDN 23 vrijeme2
TOCKAZAREZ 23 ;
IDN 23 long
IDN 23 trajanjems
TOCKAZAREZ 23 ;
KR_WHILE 25 while
L_ZAGRADA 25 (
IDN 25 scanf
L_ZAGRADA 25 (
NIZ_ZNAKOVA 25 "%d"
ZAREZ 25 ,
OP_BIN_I 25 &
IDN 25 n
D_ZAGRADA 25 )
OP_EQ 25 ==
BROJ 25 1
OP_I 25 &&
IDN 25 n
OP_GT 25 >
BROJ 25 0
D_ZAGRADA 25 )
L_VIT_ZAGRADA 25 {
IDN 26 ftime
L_ZAGRADA 26 (
OP_BIN_I 26 &
IDN 26 vrijeme1
D_ZAGRADA 26 )
TOCKAZAREZ 26 ;
KR_FOR 28 for
L_ZAGRADA 28 (
IDN 28 i
OP_PRIDRUZI 28 =
BROJ 28 1
TOCKAZAREZ 28 ;
IDN 28 i
OP_LT 28 <
IDN 28 n
TOCKAZAREZ 28 ;
OP_INC 28 ++
IDN 28 i
D_ZAGRADA 28 )
L_VIT_ZAGRADA 28 {
KR_IF 29 if
L_ZAGRADA 29 (
IDN 29 i
OP_MOD 29 %
BROJ 29 100
OP_EQ 29 ==
BROJ 29 0
D_ZAGRADA 29 )
IDN 29 printf
L_ZAGRADA 29 (
NIZ_ZNAKOVA 29 "."
D_ZAGRADA 29 )
TOCKAZAREZ 29 ;
KR_FOR 31 for
L_ZAGRADA 31 (
IDN 31 j
OP_PRIDRUZI 31 =
BROJ 31 0
TOCKAZAREZ 31 ;
IDN 31 j
OP_LT 31 <
IDN 31 i
TOCKAZAREZ 31 ;
OP_INC 31 ++
IDN 31 j
D_ZAGRADA 31 )
TOCKAZAREZ 32 ;
D_VIT_ZAGRADA 34 }
IDN 36 ftime
L_ZAGRADA 36 (
OP_BIN_I 36 &
IDN 36 vrijeme2
D_ZAGRADA 36 )
TOCKAZAREZ 36 ;
IDN 37 trajanjems
OP_PRIDRUZI 37 =
BROJ 37 1000
OP_PUTA 37 *
L_ZAGRADA 37 (
IDN 37 vrijeme2
IDN 37 time
MINUS 37 -
IDN 37 vrijeme1
IDN 37 time
D_ZAGRADA 37 )
PLUS 37 +
IDN 38 vrijeme2
IDN 38 millitm
MINUS 38 -
IDN 38 vrijeme1
IDN 38 millitm
TOCKAZAREZ 38 ;
IDN 39 printf
L_ZAGRADA 39 (
NIZ_ZNAKOVA 39 "\n%ld ms\n"
ZAREZ 39 ,
IDN 39 trajanjems
D_ZAGRADA 39 )
TOCKAZAREZ 39 ;
D_VIT_ZAGRADA 40 }
KR_RETURN 42 return
BROJ 42 0
TOCKAZAREZ 42 ;
D_VIT_ZAGRADA 44 }