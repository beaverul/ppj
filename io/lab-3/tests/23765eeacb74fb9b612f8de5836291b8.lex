KR_INT 1 int
IDN 1 bar
L_ZAGRADA 1 (
KR_INT 1 int
IDN 1 x
D_ZAGRADA 1 )
TOCKAZAREZ 1 ;
KR_INT 3 int
IDN 3 foo
L_ZAGRADA 3 (
KR_INT 3 int
IDN 3 a
ZAREZ 3 ,
KR_INT 3 int
IDN 3 b
D_ZAGRADA 3 )
L_VIT_ZAGRADA 3 {
KR_IF 5 if
L_ZAGRADA 5 (
IDN 5 a
OP_GT 5 >
BROJ 5 0
D_ZAGRADA 5 )
L_VIT_ZAGRADA 5 {
KR_INT 6 int
IDN 6 cc
TOCKAZAREZ 6 ;
KR_INT 7 int
IDN 7 cc
TOCKAZAREZ 7 ;
KR_RETURN 8 return
IDN 8 a
PLUS 8 +
IDN 8 bar
L_ZAGRADA 8 (
IDN 8 b
D_ZAGRADA 8 )
TOCKAZAREZ 8 ;
D_VIT_ZAGRADA 9 }
KR_ELSE 10 else
L_VIT_ZAGRADA 11 {
KR_RETURN 12 return
BROJ 12 0
TOCKAZAREZ 12 ;
D_VIT_ZAGRADA 13 }
D_VIT_ZAGRADA 14 }
KR_INT 15 int
IDN 15 bar
L_ZAGRADA 15 (
KR_INT 15 int
IDN 15 a
D_ZAGRADA 15 )
L_VIT_ZAGRADA 15 {
KR_RETURN 16 return
IDN 16 foo
L_ZAGRADA 16 (
IDN 16 a
ZAREZ 16 ,
IDN 16 a
MINUS 16 -
BROJ 16 1
D_ZAGRADA 16 )
TOCKAZAREZ 16 ;
D_VIT_ZAGRADA 17 }