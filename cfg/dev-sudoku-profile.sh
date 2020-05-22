#!/home/kw/kj7r/sudoku/cfg/dev-sudoku-profile.sh    # 13sep16, 22Jan15 on TP7r
#
#

 export SB="/home/kw/kj7r"   # System Base
 export PB="$SB/sudoku"         # Project Base
 export GB="/home/kw/km7r/gmsa"        # gmsa Utility base

# source $GB/cfg/az.sh
export gtm_dist="$PB/gtm"
export gtm_log="/var/log/gtm"

#  $PB/rH
 export gtmroutines="$gtm_dist $PB/o($PB/rcfg $PB/r $PB/rsr) $PB/ou($GB/rd2mrou $GB/rMenu2 $GB/rd2vl $GB/rd2c $GB/rd2io $GB/rd3hg $GB/rd2mg)"   
 #  $GB/rH $GB/rQTP $GB/rQTX $GB/rTOI $GB/rG $GB/rdv

export gtmgbldir="$PB/cfg/gsud-mumps.gld"		#  New 22Jan15

export gtmcfgsrc='$PB/cfg/dev-sudoku-profile.sh'

alias gtmpro="cd $PB/p  ;source $PB/cfg/m-profile.sh"
alias gtm="cd $PB/p; $gtm_dist/mumps -direct "

alias gde="gtmpro  ;cd /home/kw/kj7r/cfg ; $gtm_dist/mumps -R GDE"
alias mupip="gtmpro ; $gtm_dist/mupip "
alias mur=". $PB/cfg/mur-sud.sh"     #rundown
#
#alias bkupsud=". $PB/cfg/bkup-sud.sh"

alias s="cd $PB/p;  $gtm_dist/mumps -run ^sud"
echo " alias s for sudoku"
