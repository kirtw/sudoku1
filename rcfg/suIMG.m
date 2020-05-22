suIMG ;CKW/ESC  i16may20 kj7r/ sudoku/ rcfg/ ; 20200516-29 ; MGbl *FL and Var Doc
;
;
;
;
A     S subFL=""
      Q
;*
VAR  ;
;;GM    81char string, N vs - Plays  R x C  or B x K  or E=1:1:81   N=$E(E)
;;nMV   Num Moves so far, calc or kept
;;R   1:9 Row
;;C   1:9 Col
;;E     Char position in GM, ~RxC ~ BxK
;;B   1:9 Box (small box, one digit) num within Area Box
;;K   position within Box
;;N   is digit played from GM
;;Ng  alt name for N in some places, ?why not both Ng
;;
;;L0  constant "123456789"  for LR, LC, LB init
ARRAYS  ; Arrays
;;LR(R)   Remaining N digits to play in Row R, init=L0
;;LC(C)   Remaining N digits to play in COl C
;;LB(B)   Remaining N digits to play in Box B
;;RRC(RC)  Remaining N digits for one square, replaced LRC
;;PRC(RC)  alt Remianing calc from GM, compareRC^suTES
;;nN(N)  Number of digit N played already, sic vs Remaining 9-nN
;;NIX(nN,rc)  Sort of RRC by number left, $L(PN) =PN for no good reason
;;PIX  alt vers, from GM vs incremental
;;
;;      Conversion Arrays (temp)  vs calc in x*^sus sr working now, no args: implicit in/out
;;
;;
;;Log(nMV)=RCN  Play log, may or may not include start position 'plays', nMV=1:1:30 or so
;;SQLG(sqi)  debug array ^suHSQ