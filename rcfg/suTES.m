suTES  ;CKW/ESC  i16may20 kj7r/ sudoku/ rcfg/ ; 20200516-33 ; Test Suite
;
;;$$Q
T(Qt) S Qt=$G(Qt)
      S Q=$$TxSR^sudRef(Qt) I Q'="" S Qt=Qt+1_Q
      S Q=$$T2(Qt) I Q'="" S Qt=Qt+1_"T2 err"_Q
      Q Qt
;
;*   trc.  Test RRC vs PRC calcs
TRC   S Qt=""
      S Q=$$T(Qt) I Q'="" S Qt=Qt+1_Q
      USE $P W:$X ! W "Running Tests of RPC vs PRC algorithms in ^sus- "
      I Qt="" W " Passed.  (Work identically)",!
      E  W " Failed.  ",Qt,!
      Q
      
;* * *   Tests  t1.  ^suMenu  ? Intended to be All tests, but is not...
;*  Tst conversion sr vs Array mapping ^sudRef  sic test is actually in sr...
xTx   ; Done elsewhere  Tx^sudRef
;*
;*
;*
T2(Qt)  S Qt=$G(Qt)
      ;D IIGM^suInit
      D G1^suIGM  ; GM, GM2
	;D GM2^sus(GM)  ; : RRC
      D PRCx^sus  ; : PRC, PIX
      D GM2^sus(GM) ; : RRC
      S Q=$$compareRC  ; RRC vs PRC
        I Q'="" S Qt=Qt+1_Q
      S Q=$$XX  ; Compare NIX, PIX
        I Q'="" S Qt=QT+1_Q
      Q Qt
;*
;*$$Q  Compare RRC with PRC
compareRC()   NEW Q,R,C,rc,P1,P2 S Q=""
       F R=1:1:9 F C=1:1:9 S rc=R_C DO
         .S P1=RRC(rc),P2=PRC(rc) 
         .I P1'=P2 D b^dv("Err RRC/P1 vs PRC/P2","P1,P2,rc") S Q=Q+1
       Q Q
;*
;*$$Q  Compare NIX, PIX  - actually this is done on fly in CIX now.
XX()   S n1=0,n2=0,Q=""
       F ni=0:1 S n1=$O(NIX(n1)),n2=$O(PIX(n2)) Q:(n1="")&(n2="")  DO  ;
         .I n1'=n2 D b^dv("Error NIX vs PIX","n1,n2") S Q=Q+1_(n1)
         .D X2
       Q Q
X2     S r1=0,r2=0 F ri=0:1 S r1=$O(NIX(n1,r1)),r2=$O(PIX(n2,r2)) Q:r1=""&(r2="")  DO
         .I r1'=r2 D b^dv("Error NIX vs PIX rc","r1,r2,n1,n2") S Q=Q+1_"rc:"_r1
       Q
;*       