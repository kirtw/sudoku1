suMenu  ;CKW/ESC  i1nov16  kj/ sudoku/ r/; 20200515-65; Menu for ^sud   kj7r/ sudoku
      ;ref from alias s, ^sud    was  20161101-80 
  ;
  ;
SRM	KILL RM NEW ri S ri=0,RM=0
        F I=1:1 S L=$T(tdDev+I) Q:L["***"  Q:L=""  DO  
          .S L=$TR(L,$C(9,13)," ")  ; tab -> space, remove cr
          .S T=$P(L,";;",2,9) I T'="" S ri=ri+1,RM(ri)=T,RM=ri
        ;zwr RM
        S mSys="sud1"   S mpreLR="dis^suMenu"
        D ^dmnCom(mSys)  ; RM() -> ^MNU("sud1") and set "curmSys")="sud1"
        Q
;*
dis     ;pre-Menu Status  of Cur  etc.
        S evdt=$ZD($H,"YYYYMMDD") ;D Cur^cqVers  ; : evdt
        W:$X ! W "Event Date:",$G(evdt),",  gid=",$G(gid),!
        ;KILL devr W !
        Q
;*
tdDev	;Text for tdDev  Menu  	Compile  RM()
        ;LineSyntax:  No-indent is mnu, Indent is an option, 
        ;    No stray (.) periods in op descr
        ;mab. dPRP_dDE  
        ;  op.  dopLR  dopDE	# where dopLR contains ^  or menu mab./exists
        ;  dnxt1  or dnxt2 Syntax: | pipe prefix
        ;  $test makes menu transfer a numbered option
        ;
  ;;mm. Select from MProj Main: _Main sudoku MProj Menu  |mm
  ;;  g2.	G2^suMa  Init G2 and Display 
  ;;  tref.	^sudRef  Test Conversion sr vs ref Arrays
  ;;  trc.    TRC^suTES  Test RPC vs PRC algorithms, same if Passes
  ;;  t1.      Tx^suTES  Run Logic Tests  
  ;;  t2.    Tx^sudRef Q   ;Test s/rs using Ref Vectors    PASSed  
  ;;  g3. 	^sugm   Play Book Games
  ;;  cg.  FIN^suMa  Complete Game by Computing Plays
  ;;  $test  Test Menu
  ;;
  ;;test.      sudoku test menu  Test Procedures

  ;;  ***