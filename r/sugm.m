sugm  ;CKW/ESC  i4jun16  ; 20160604-10 ; Init Games
  ;
A   D III^suInit
    D Trip  ; not reqd now: D GM2^sus(GM) 
    ; D WGX^sus(GM)   D WLRC^sus
    D FIN^suCGM
  Q
  ;   SOLVED 1st Order
  ;  GPL is list or RCN moves to initialize game 
  ;   vs GX as if stuffing, but still translate to RCN plays via SG1 and SGU^suIGM
  ;
pVIII  S GPL="115,159,187,192,212,227,263,276,338,364" D SG1   ;  Gentle Book, p VIII intro  Twins
      S GPL="411,434,448,517,555,599,669,672,691" D SG1
      S GPL="746,773,832,849,884,897,913,921,954,996" D SG1 
      Q

;Trip   pIX Tripletts
Trip  S GX="..46...../......386/3...97..2/.1..89.7./9.......1/.5.37..2./6..84...7/281....../.....52.."
      D XL(GX)  ; : GPL
      D SG1
      Q
; GX : GPL triples
XL(GX) I $L(GX)'=89!($L(GX,"/")'=9) D b^dv("GX invalid","GX") Q
       S GPL=""
       F R=1:1:9 S X=$P(GX,"/",R) DO
	 .I $L(X)'=9 D b^dv("Sub len not 9","X,R") Q
	 .F C=1:1:9 S rc=R_C,N=$E(X,C) I N S GPL=GPL_","_R_C_N
       S GPL=$E(GPL,2,999)
       Q
;*
;  GPL list of play triples
SG1   S Q=$$SGU^suIGM(GPL) ; : GM'
        I Q'="" D b^dv("Error in Play SetUp","PER,GPL") Q
      Q
;*      