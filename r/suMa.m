suMa  ;CKW/ESC i15may20 kj7r/  sudoku/ r/ ; 20200515-72 ; Master Profiles, Parameterized Sequences
;
;
;
;
G2     KILL   D III^suInit
       D G2^suIGM  ; Test Game 'G2'
       S hFil="SU-G2.gm2.html"
       S hBase="/home/kw/kj7r/",hFol="sudoku/www/gm/"
       S devh=hBase_hFol_hFil
       KILL TI S TI("ti")="Sudoku",TI("hd")="Soduku Board"
       D HBD
       Q
HBD    S Q=$$HGS^hgh  ; : HTS()
         I Q'="" D b^dv("HGS?","Q,devh")       
       S Q=$$HGE^hgh  ; : HTE
         I Q'="" D b^dv("HGE?","Q,devh")
       ; now guts to HT()
       ;;S Q=$$RRCh^suHGbd(GM)
         ;;I Q'="" D b^dv("Punt?","Q,devh")
       D BD^suHSQ       ;D b^dv("Log post suHSQ","devh")
       S Q=$$WH^hgh(devh)
         I Q'="" D b^dv("Err writing HT*","Q,devh")
       Q

;*
CalcGM   D FIN^suCGM
         Q
