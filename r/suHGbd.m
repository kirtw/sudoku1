suHGbd  ;CKW/ESC  i16may20 kj7r/ sudoku/ r/ ; 20200516-27 ; HGen Bd  HT()
;
;
;
;* * *  from ^sudoku
;*$$Q  GM, nMV, LR-LC-LB		was WL
RRCh(GM)   NEW h,R,C,B,sp,sp3,br  S Q=""
      S h="<div class='lrc'>"
      S sp="&nbsp;",sp3=sp_sp_sp,br="<br/>"
      S h=h_nMV_" Moves- "_br DO  ;
         .F Ie=1:9:81 S h=h_$E(GM,Ie,Ie+8)_br
      S h=h_br_"LR " F R=1:1:9 D BXh(LR(R))
      S h=h_br_"LC " F C=1:1:9 D BXh(LC(C))
      S h=h_br_"LB " F B=1:1:9 D BXh(LB(B))
      S h=h_br_"</div>"
      S Q=$$hg^hgh(h)  ; : HT()
      Q ""
;*
BXh(bc)   S h=h_"<div class='bx'>"_bc_sp_"</div>"
      Q
;*
;*
;*
