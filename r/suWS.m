suWS   ;CKW/ESC  i3Jun16 ; 20160603-99 ; Misc Write sr of ^sudoku
  ;
  ;  See ^suHGbd  for HGen variants
  ;  EntryPoints:   WLLL,  WGX(GM)
  ;
;
;*
;* * *  from ^sudoku
;*  GM, nMV, LR-LC-LB		was WL
WLLL  W !!,nMV," Moves-",!,GM,!
      W:$X ! W "LR " F R=1:1:9 W ?tb(R),LR(R)," "
      W:$X ! W "LC " F C=1:1:9 W ?tb(C),LR(C)," "
      W:$X ! W "LB " F B=1:1:9 W ?tb(B),LB(B)," "
      Q
;*  Write GM
WGX(G)  W ! F R=1:1:9 W:$X ! DO
	  .I R=4!(R=7) W:$X ! W " - - -  - - -  - - -",!
	  .F C=1:1:3 D W1
	  .W "| " F C=4:1:6 D W1
	  .W "| " F C=7:1:9 D W1
	W !," '",G,"' ",!
	Q
; R,C : E Ng
W1	D xRCE^sudoku,xEN^sudoku W Ng," "
        Q
;*
WnN     W !,"  num N " I '$D(nN) W " nN() UNDEF. ",! Q
	F N=1:1:9 W " N",N<"- ",nN(N),"  "
        W ! Q
;*
;*  NIX()    No refs
WIX   W !,"Remaining-",!
      F N=1:1:9 W:$X ! W "  ",N,":  " DO
        .S rc=0 F ni=0:1 S rc=$O(NIX(N,rc)) Q:rc=""  W rc," "
      W !
      Q
;*

;*   No refs
WV    W:$X ! W R,C," ",?4,"E=",E,",  B=",B,"  "
      Q
;*
