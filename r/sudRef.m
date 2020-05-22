sudRef  ;CKW/ESC  i3Jun16  ; 20160603-80 ; Reference Table fo Sudoku
  ;
  ;
;*  Operational Arrays Ebk(E)=BK  Ref By xEBK  until formulas fixed
IREF  KILL RT,Ebk,BKe,BKrc
      D FT
      DO  ;  opt
        .W:$X ! W "Completed ^sudRef.",!
	.W " and " 
	.W:$D(Ebk) "Ebk(e)=B_K   "  
	.W:$D(BKe) " BKe(b,k)=e  "  
	.W:$D(BKrc) "  BKrc(b,k)=r_c "
	.W:$X !
      Q
; Create RT(e) RCBKE  Std Vectors implicit Transforms
FT    F T=11111,12122,13133,14214,15225,16236,17317,18328,19339 D ST
      F T=211410,221511,231612,242413,252514,262615,273416,283517,293618 D ST
      F T=311719,321820,331921,342722,352823,362924,373725,383826,393927 D ST
      ;
      F T=414128,424229,434330,445131,455232,465333,476134,486235,496336  D ST
      F T=514437,524538,534639,545440,555541,565642,576443,586544,596645  D ST
      F T=614746,624847,634948,645749,655850,665951,676752,686853,696954  D ST
      ;
      F T=717155,727256,737357,748158,758259,768360,779161,789262,799363  D ST
      F T=817464,827565,837666,848467,858568,868669,879470,889571,899672  D ST
      F T=917773,927874,937975,948776,958877,968978,979779,989880,999981  D ST
      Q
; T : r,c,b,k,e   for each littleBox  Reference Relationship
ST    S r=$E(T),c=$E(T,2),b=$E(T,3),k=$E(T,4),e=$E(T,5,6)    
      I $D(RT(e)) D b^dv("Dupl e","e,T,RT(e)")
      S RT(e)=T
      ;S Ebk(e)=b_k    S BKe(b_k)=e   S BKrc(b_k)=r_c
      Q
;
;*  Test  tref.  Conversion SR x*  vs Array Conversion
Tx    S Q=$$TxSR("")
      USE $P W:$X ! W " Tests of converrsion SR vs Array ref- "
      I Q'="" W "Failed ",Q,!
      E  W " Passed.",!
      Q
;*     Test x* conversion sr's vs Array RT 
TxSR(Qt)  S Qt=$G(Qt)
      D IREF  ; RT  and  Ebk, BKe, BKrc
      F e=1:1:81 S T=RT(e),r=$E(T),c=$E(T,2),b=$E(T,3),k=$E(T,4),E=+$E(T,5,6)  DO
        .S R=r,C=c D xRCE^sus  ; R,C : E
        .I e'=E D b^dv("xRCE error ","e,E,R,C")  S Qt=Qt+1_" xRCE"
        .S B=b,K=k D xBKE^sus  ; B, K : E
        .I e'=E D b^dv("xBKE error ","e,E,B,K")   S Qt=Qt+1_" xBKE"
        .S E=e D xERC^sus  ; E : R,C
        .I r_c'=(R_C) D b^dv("xERC error ","e,E,r,R,c,C")  S Qt=Qt+1_" xERC"
        .S E=e D xEBK^sus  
        .I b_k'=(B_K) D b^dv("xEBK error ","e,B,b,K,k,E,r,c")  S Qt=Qt+1_" xEBK"
      Q Qt
;*



      