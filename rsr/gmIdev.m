gmIdev  ;CKW/ESC  i13aug16 ; 20160813-30 ; agenMProj s/r  rsr/
  ;
  ;  stems:  h,w,r,log
  D ih,ir  ; No Fil arg -> *Fil=""  ok for here, no leftwovers
  Q
;*
;     h (hgen) vs w (write or www) stems really same  HGen  -- combine, eliminate one ---
;     Eliminate w in uCal, aGMP
;*
B0     S homeBase="/home/kw/km7r/gmsa/"  Q       ; Should be only ref in ka* to km7r or gmsa/
;
;
;*  ; rBase, rFol, rFil
ir(iFil)  D B0 S rBase=homeBase,rFol="dAcct/",rFil=$G(iFil) Q
;
;      Read File, readonly  RDF   ^kas, ^kah
devr(rsFil,rsFol)
       I $G(rsFil)="",$G(rFil)="" D ^dvsch,b^dv("Bug No arg or rFil","rsFil,rFil") S rsFil="ReadFile.txt"
       I $G(rsFol)="" S rsFol=$G(rFol) I rsFol="" S rsFol="db/"
       I rsFol="/" S rsFol=""  ;only way to be null  token "/"
       D B0 S rBase=homeBase
       S devr=rBase_rsFol_rsFil
       Q
;*  : hBase, hFol, hFil (defined if null or iFil)
ih(iFil)  D B0 S hBase=homeBase,hFol="www/BE/",hFil=$G(iFil) Q
;*    HGen
devh(hsFil,hsFol)
       I $G(hsFil)="" S hsFil=$G(hFil)  ;default var hFil if no argument
         I hsFil="" D ^dvsch,b^dv("Bug No arg or hFil","hsFil,hFil")  S hsFil="HGenFile.html"
       I $G(hsFol)="" S hsFol=$G(hFol) 
       I hsFol="/" S hsFol=""  ; token "/" forces null Fol
       S devh=hBase_hsFol_hsFil
       Q
;*            sic Logic is nasty tricky to remember later ... ---
;      $D/$G dependence sucks,  default fallback upon undef/null  also sucks probably
;      May matter more when HGen creating files...  have to clean up errors
;
;*
devlog(iFil,iFol)
       I $G(iFol)="" S iFol=$G(logFol)  ; may be null
       I $G(iFil)="" S iFil=$G(logFil)  ; cant be null
       I iFil="" D ^dvsch,b^dv("Bug No arg or logFil","logsFil,logFil") S logsFil="ReadFile.txt"
       D B0 S logBase=homeBase
       I iFol="" S iFol="log/"      ;  default vs others
       S devlog=logBase_iFol_iFil
       Q
;*