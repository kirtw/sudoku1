suCGM ;CKW/ESC i16may20 kj7r/ sudoku/ rcfg/ ; 20200516-34 ; Computer Generated Plays
;
;
;
;  from sudoku
;   GM
FIN  ; Finish Playing
  F  Q:'$D(NIX(1))  DO  ;
     .D PL1
     .D WGX^sus(GM)
  I nMV<81 USE $P W !!,"Can't Finish- Move ",nMV,!
  Q
;
;  This is Easy Play where there is only one digit remaining in a Square 
;  NIX(nN,rc) is index of num of poss digits remaining
;* Play where only one possible in NIX(1,rc)=PN
PL1  S rc="" F pi=0:1 S rc=$O(NIX(1,rc)) Q:rc=""  DO  ;
	.S N=NIX(1,rc)
	.S Q=$$PLY^sus(rc_N)
	.  I Q'="" D b^dv("Play One Error","P,rc,N")
     Q
;*
