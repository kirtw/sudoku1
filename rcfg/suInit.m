suInit ;CKW/ESC i16may20 kj7r/ sudoku/ rcfg/ ; 2020051631 ; Init Arrays, Vars
;
;
;
;*  Ref by ^sugm , ^suIGM  Game Init
III D IIGM
    Q
;* Init  GM, Ebk, BKe, BKrc(b,k)=r_c
IIGM  D Init^hgh
    S X="---------",GM="" F C=1:1:9 S GM=GM_X
    S nMV=0 KILL Log  
    KILL tb S t=3 F i=1:1:9 S tb(i)=t,t=t+10
      S tb(10)=t
    ;D IREF^sudRef  ; Ebk(E)=B_K, BKe(B,K)=e,  BKrc(B,K)=r_c
    ;D GM2^sus(GM)  ;
    D ILL
    Q
;*	Init LR, LC, LB, RRC
ILL   S L0=123456789,nMV=0
    F R=1:1:9 S LR(R)=L0
    F C=1:1:9 S LC(C)=L0
    F B=1:1:9 S LB(B)=L0
    F R=1:1:9 F C=1:1:9 S RRC(R_C)=L0
    Q
