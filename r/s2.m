s2	;CKW/ESC  3Feb14  ;   20160208-52  ;  Starter for Sudoku in mHSTA
	;.02	See ^dmnu   menu
	;
	I $zro'["mHSTA/r" B  B  Q  ; fix $zro in *-profile.sh
	;
A	D 3; 
	Q  ;safety
;*
;
1	D ^sudoku Q; 
2	D ^sudRef Q
3	D ^sugm Q
	Q
;* Test Procedures
110	KILL  D Tx^sudoku Q  ;Test xERC  etc s/r   PASSed
111     D Tx^sudRef Q   ;Test s/rs using Ref Vectors    PASSed
;* debug test
T0	D T0^sudoku Q
;*
	;
zb	;
	Q
	;*
zl	D zl0  ;variants...
	Q
	;
zl0	U 0 W !!,"performing ZLINK of  ^td* KA1/- in ^",$T(+0),!!
	S ZCmd="rm  ../o/*.o"  W !,ZCmd,!  ZSY ZCmd
	zl "sudoku.m","sudRef.m"
	zl "sus.m","sugm.m"
	;
	zl "dv.m"  ;  $zro  gmsa/rdv/   vs local copy...
	;zl "GP2.m" zl "GP.m"
	;
SR	; 
	;
	;
	W:$X ! W "Finished zl List in zl^",$T(+0),!!
	Q
	;*


