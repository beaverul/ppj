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
IDN 20 FI
L_ZAGRADA 20 (
KR_INT 20 int
IDN 20 n
D_ZAGRADA 20 )
L_VIT_ZAGRADA 20 {
KR_INT 21 int
IDN 21 i
ZAREZ 21 ,
IDN 21 fib
ZAREZ 21 ,
IDN 21 f1
ZAREZ 21 ,
IDN 21 f2
TOCKAZAREZ 21 ;
KR_IF 22 if
L_ZAGRADA 22 (
IDN 22 n
OP_LTE 22 <=
BROJ 22 1
D_ZAGRADA 22 )
L_VIT_ZAGRADA 22 {
IDN 23 fib
OP_PRIDRUZI 23 =
BROJ 23 1
TOCKAZAREZ 23 ;
D_VIT_ZAGRADA 24 }
KR_ELSE 24 else
L_VIT_ZAGRADA 24 {
IDN 25 f1
OP_PRIDRUZI 25 =
BROJ 25 1
TOCKAZAREZ 25 ;
IDN 25 f2
OP_PRIDRUZI 25 =
BROJ 25 1
TOCKAZAREZ 25 ;
KR_FOR 26 for
L_ZAGRADA 26 (
IDN 26 i
OP_PRIDRUZI 26 =
BROJ 26 2
TOCKAZAREZ 26 ;
IDN 26 i
OP_LTE 26 <=
IDN 26 n
TOCKAZAREZ 26 ;
IDN 26 i
OP_INC 26 ++
D_ZAGRADA 26 )
L_VIT_ZAGRADA 26 {
IDN 27 fib
OP_PRIDRUZI 27 =
IDN 27 f1
PLUS 27 +
IDN 27 f2
TOCKAZAREZ 27 ;
KR_IF 28 if
L_ZAGRADA 28 (
IDN 28 fib
OP_LT 28 <
BROJ 28 0
D_ZAGRADA 28 )
L_VIT_ZAGRADA 28 {
IDN 29 printf
L_ZAGRADA 29 (
NIZ_ZNAKOVA 29 "Ne moze se prikazati %d. Fibonaccijev broj!\n"
D_ZAGRADA 29 )
TOCKAZAREZ 29 ;
D_VIT_ZAGRADA 30 }
IDN 31 f1
OP_PRIDRUZI 31 =
IDN 31 f2
TOCKAZAREZ 31 ;
IDN 32 f2
OP_PRIDRUZI 32 =
IDN 32 fib
TOCKAZAREZ 32 ;
D_VIT_ZAGRADA 33 }
D_VIT_ZAGRADA 34 }
KR_RETURN 35 return
IDN 35 fib
TOCKAZAREZ 35 ;
D_VIT_ZAGRADA 36 }
KR_INT 38 int
IDN 38 main
L_ZAGRADA 38 (
KR_VOID 38 void
D_ZAGRADA 38 )
L_VIT_ZAGRADA 38 {
KR_INT 39 int
IDN 39 n
ZAREZ 39 ,
IDN 39 brojac
ZAREZ 39 ,
IDN 39 fib
TOCKAZAREZ 39 ;
KR_WHILE 40 while
L_ZAGRADA 40 (
BROJ 40 1
D_ZAGRADA 40 )
L_VIT_ZAGRADA 40 {
IDN 41 brojac
OP_PRIDRUZI 41 =
BROJ 41 0
TOCKAZAREZ 41 ;
IDN 42 printf
L_ZAGRADA 42 (
NIZ_ZNAKOVA 42 "Upisite broj >"
D_ZAGRADA 42 )
TOCKAZAREZ 42 ;
IDN 43 n
OP_PRIDRUZI 43 =
BROJ 43 556
TOCKAZAREZ 43 ;
KR_IF 44 if
L_ZAGRADA 44 (
IDN 44 n
OP_LT 44 <
BROJ 44 0
D_ZAGRADA 44 )
L_VIT_ZAGRADA 44 {
IDN 45 printf
L_ZAGRADA 45 (
NIZ_ZNAKOVA 45 "gotovo!\n"
D_ZAGRADA 45 )
TOCKAZAREZ 45 ;
KR_BREAK 45 break
TOCKAZAREZ 45 ;
D_VIT_ZAGRADA 46 }
KR_ELSE 46 else
L_VIT_ZAGRADA 46 {
IDN 47 fib
OP_PRIDRUZI 47 =
IDN 47 FI
L_ZAGRADA 47 (
IDN 47 n
D_ZAGRADA 47 )
TOCKAZAREZ 47 ;
IDN 48 printf
L_ZAGRADA 48 (
NIZ_ZNAKOVA 48 "%d. Fibonaccijev broj = %d , Izravno! \n"
D_ZAGRADA 48 )
TOCKAZAREZ 48 ;
D_VIT_ZAGRADA 49 }
D_VIT_ZAGRADA 50 }
KR_RETURN 51 return
BROJ 51 0
TOCKAZAREZ 51 ;
D_VIT_ZAGRADA 53 }
