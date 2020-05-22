suHSQ ;CKW/ESC i16may20 kj7r/ sudoku/ rgm/ ; 20200518-94 ; HGen 3 x 3 x 3 x 3  Nested Boxes
;
;
;  Entry:  BD
   D b^dv("No top entry","mSYs") Q
;*
;Nested divs 
;  cls=.bd  outside
;  cls=.bxrow  row x 3 Boxes
CSlayout  
     S Q=$$css^hgh(".BD","background-color:gray;display:flex; flex-direction:column; max-width:800px;")
     S Q=$$css^hgh(".BXrow","flex-basis:33%; display:flex; flex-direction:row; border:2px solid lightblue; padding:3px;")
     S Q=$$css^hgh(".box","flex-basis:33%; display:flex; flex-direction:column;border:2px solid pink;padding:5px;")
     S Q=$$css^hgh(".brw","flex-basis:33%; display:flex; flex-direction:row;")
     S Q=$$css^hgh(".sq","flex-basis:33%;")
     ;
       S Q=$$css^hgh(".sq","border: 1px solid black; padding: 3px")
       S Q=$$css^hgh(".bxT","font-family:Helvetica;font-size:8em;")
       S Q=$$css^hgh(".bxNg","font-family:Helvetica;font-size:12em;")
       S Q=$$css^hgh(".bxsPD","font-family:Helvetica;font-size:8em;")
       S Q=$$css^hgh(".bx1","font-size:16em;")
     Q
;;*
BD   D CSlayout  ; buffer in CS() until WH, not by HTS as previously (by HG1)
     S SQn=0 KILL SQLG
     S sp="&nbsp;",sp3=sp_sp_sp,br="<br/>"
     S Q=$$ot(".BD")     
     F BXR=1:1:3 DO
       .S Q=$$ot(".BXrow") 
       .F BXC=1:1:3 D BX
       .S Q=$$ct(".BXrow")
     S Q=$$ct(".BD")
     Q
;*
BX   ;BXC is B
     S Q=$$ot(".box")
     F bi=1:1:3 DO
       .S Q=$$ot(".brw")
       .F bc=1:1:3 D SQ
       .S Q=$$ct(".brw")
     S Q=$$ct(".box")
     Q
;*  
SQ   S B=(BXR-1)*3+BXC
     S K=(bi-1)*3+bc
     S L1=BXR_BXC_bi_bc_"-"_B_K_"-BXR,BXC,bi,bc-BK"  KILL R,C,E
     D xBKE^sus  ; : E
     D xERC^sus  ; : R,C
     D xEN^sus   ; E : Ng
     S L2=R_C_Ng_B_K_"-"_E_"-RCNBK-E"
     S PD=$G(RRC(R_C))
     S SQn=SQn+1 F vn="L1","L2" S SQLG(SQn,vn)=@vn  ;  ,"PD"
     ;
     S Q=$$ot(".sq")
     ;
     D ^dv("Log SQ","R,C,Ng,B,K,E,L1,L2")
     D sqb1  ;D sqb0  ; : h  guts of sq
     S Q=$$hg^hgh(h)
     S Q=$$ct(".sq")
     Q
;*  Alt sq filling  - this is general     
sqb0 S h="<span class='.bxT'>"_R_C_" - "_B_K_"</span>"_br
     S h=h_"<span class='.bxNg'>"_Ng_"</span>"_br   ; os^hgh(".bxNg"), cs()  close span
     S h=h_"<span class='.bxsPD'>"_PD_"</span>"
     Q
;*
sqb1 S h="<span class='.bx1'>"_K_"</span>"
     Q
     
;*$$Q  Short name refs
ot(sel) Q $$ot^hgh($G(sel)) 
;*$$Q
ct(sel) Q $$ct^hgh($G(sel))
;*