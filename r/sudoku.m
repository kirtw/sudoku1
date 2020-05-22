sudoku  ;CKW/ESC  i2Jun16  ; 20160603-55 ; Quickie Sudoku Model & Solution
  ;
  ;
  ; Current R, C, B, E, GM 81 char digit or space/0/any char,  R x C  N from GM
  ;  Note RC eliminated vs R_C
  ;
  ;  N  1-9 (or Ng)
A  D IIGM^suInit
   D ILL^suInit
   D WLLL^sus
   D WGX^sus(GM)   
  D G2^suIGM
  D WLLL^sus
  D WGX^sus(GM)
  KILL Log ;only calc Plays
  D FIN^suCGM
  Q




