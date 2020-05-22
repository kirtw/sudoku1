suIGM ;CKW/ESC  i16may20 kj7r/ sudoku/ rcfg/ ; 20200516-31 ; Init particular games GM
;
; : GM             See ^sugm  also
;
;*  from ^sudoku
;* Test Games  List of RCN plays
G1    D SG0 S GPL="117,136,164,214,242,263,289,322,375,391" D SGU(GPL)
      S GPL="412,424,488,515,558,593,621,687,694" D SGU(GPL)
      S GPL="719,735,783,823,845,867,899,943,978,996" D SGU(GPL) 
      ;D GM2^sus(GM)  ; 
      Q
;*
G2    D SG0    ;  ; SOLVED  1st Order RRC
      S GPL="121,146,163,182,229,242,265,283,316,394" D SGU(GPL)  
      S GPL="438,443,464,476,519,593,632,645,666,671" D SGU(GPL)
      S GPL="714,795,828,844,862,886,925,948,961,987" D SGU(GPL) 
      ;D GM2^sus(GM)  ; RRC
      Q
SG0   S GM="",$P(GM,"-",82)="" I $L(GM)'=81 D b^dv("Bug init GM","GM")
      D III^suInit
      D IREF^sudRef  ; Array conversions
      Q
;*  GPL comma list of play triples, RCN, GM : Q', GM'
SGU(GPL)   I $G(GPL)="" D b^dv("Null arg list","GPL") S Q=Q+1 Q
      F mi=1:1:$L(GPL,",") S RCN=$P(GPL,",",mi) DO  ;
        .I RCN'?3n D b^dv("Each list entry must be 3 digits","RCN,mi") S Q=Q+1
        .I RCN["0" D b^dv("zero not allowed in RCN","RCN,mi") S Q=Q+1
        .S R=$E(RCN),C=$E(RCN,2),N=$E(RCN,3)
        .S Q=$$PLY^sus(R_C_N)
        .I Q'="" D b^dv("Err Playing","RCN,mi,GM")
      Q
;*

