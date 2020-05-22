sus ;CKW/ESC ix 16may20 kj7r/ sudoku/ rsr/ ; 20200518-94 ; Revised SR
;
;
;  See  Separately ^suInit Init Arrays, Init Games ^suIGM
;
;  Execute a Move R,C,N on GM
;*$$Q   GM :  GM'    and Update nMV', nN()
;Make a Play in GM  $$PLY Q-null if successful, else Bug/Err
PLY(RCN)  I $G(RCN)="" D bug^dv("Arg N","N") Q "1arg"
    NEW Q,R,C,N,E,B,K
    I (RCN'?3n)!(RCN["0") D bug^dv("RCN?3n 1-9","RCN,GM") Q "2RCNarg"
    S R=$E(RCN),C=$E(RCN,2),N=$E(RCN,3)
    D xRCE,xEBK  ; R,C : E, B, K
    S X=$E(GM,E) I X D b^dv("Dupl Play ","R,C,N,E,X,GM") Q "2dup"
    S $E(GM,E)=N
    D PL2 ; : 
    Q ""
;
;* R,C,N, GM, nMV : LR',LC',LB', RRC'
;Post Move/PLY necessities
PL2 S nMV=nMV+1,Log(nMV)=R_C_N
    D RNU  ; Update Remaining LR,LC,LB & RRC
    S nN(N)=$G(nN(N))+1
    D CIX  ; RRC : NIX(nRRC,rc)=PN
    Q
;*  Remove N from LR, LC, LB   and RRC
xRN  S LR(R)=$P(LR(R),N)_$P(LR(R),N,2)  ; Removes N from Lists
    S LC(C)=$P(LC(C),N)_$P(LC(C),N,2)
    S LB(B)=$P(LB(B),N)_$P(LB(B),N,2)
    S RRC(R_C)=$P(RRC(R_C),N)_$P(RRC(R_C),N,2)
    Q
;*  Variant ?why    Remove N from LR, LC, LB 
RNU I LR(R)[N S LR(R)=$P(LR(R),N)_$P(LR(R),N,2) ; Removes N from List
      E  D b^dv("Bug N not in LR(R)","N,R,LR(R)")
    I LC(C)[N S LC(C)=$P(LC(C),N)_$P(LC(C),N,2)
      E  D b^dv("Bug N not in LR(R)","N,R,LR(R)")
    I LB(B)[N S LB(B)=$P(LB(B),N)_$P(LB(B),N,2)
      E  D b^dv("Bug N not in LR(R)","N,R,LR(R)")
    I RRC(R_C)'[N S RRCt=RRC(R_C) D b^dv("Bug must be there to remove from RRC","R,C,N,RRCt")
      S RRC(R_C)=$P(RRC(R_C),N)_$P(RRC(R_C),N,2)
    Q
;*
; GM : RRC(R_C)  from GM alone  (was PRC0)
;RefBy: 
GM2(G) KILL RRC  I $G(G)="" D bug^dv("Bug ","G") Q
      NEW ee
      F ee=1:1:81 S E=ee KILL R D xE DO  ;
	.I Ng S RRC(R_C)=""  Q  ; Already set
        .S e=E,r=R,c=C,b=B,k=K  ; Preserve ref cell
        .S PN="123456789"
	.S R=r F C=1:1:9 S rc=R_C I r_c'=rc D xRCE,xEN D Rem(Ng)   ; r_c'=rc skips current box
	.S C=c F R=1:1:9 S rc=R_C I r_c'=rc D xRCE,xEN D Rem(Ng)
	.S B=b F K=1:1:9 D xBKE,xERC S rc=R_C I r_c'=rc D xEN D Rem(Ng)
	.S RRC(r_c)=PN
      Q
Rem(N) S CHG=PN[N Q:'CHG
        S PN0=PN
	S PN=$P(PN,N)_$P(PN,N,2)  ;Remove N from PN
	I PN[N D b^dv("Failed to remove all N?","PN,N")
	S PN2=$TR(PN0,N,"") I PN2'=PN D b^dv("Err Compare","PN0,PN,PN2")  ;who cares ? Test!
	Q
;*
;*  RRC() -> NIX(nn,rc)=PN	No active Refs   nn=0 for already played boxes, skip them
CIX    KILL NIX F R=1:1:9 F C=1:1:9 DO  
         .S PN=RRC(R_C),nn=$L(PN) 
         .  I nn S NIX(nn,R_C)=PN  ;Sort by num remaining
    Q
;*
;*  Analysis  Testng each N for hits in LR, LC, LB  -Backwards !!!?
; Ref only by T2^suTES
;*$$Q  GM : PRC, PIX
PRCx   KILL PIX,PRC  NEW R,C,PN,N,E,B,Q  S Q=""
      F R=1:1:9 F C=1:1:9 S PN="" DO
        .F N=1:1:9 DO
          ..I LR(R)'[N Q
          ..I LC(C)'[N Q
          ..D xRCE,xEBK I LB(B)'[N Q
          ..S PN=PN_N  ;falls thru if Row,Col and Box did not contain N
	.S PRC(R_C)=PN,nn=$L(PN)
	.S PIX(nn,R_C)=PN
      Q
;*
; Rev 2 Conversion sr * * * *
xE    D xERC,xEBK,x2 Q
xRC   D xRCE,xEBK,x2 Q
xBK   D xBKE,xERC,x2 Q
xEN   S Ng=$E(GM,E) Q
x2    D xEN S RNE=R_C_Ng_B_K_E  Q      
;*
xRCE  S E=(R-1)*9+C Q
;*
xBKE  S Ec=((B-1)\3*3)+(K-1)#3+1 Q
;*
xERC  S R=(E-1)\9+1,C=(E-1)#9+1 Q
;*
xEBK    S B2=(R-1)\3*3+((C-1)\3)+1,K2=((R-1)#3*3)+(C-1)#3+1
        I B2'=B D b^dv("Err B2","B,B2,R,C")
        ;I (K2'=K) D b^dv("Inconsistency ","K,K2,R,C")
        S Kr=(R-1)#3*3,Kc=(C-1)#3+1,K3=Kr+Kc
          I K3'=K D b^dv("Err K3","K,K3,Kr,Kc")
        Q
;*
