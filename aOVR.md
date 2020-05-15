This is a github collection intended to be cloned into a working docker qewd context.

It will implement a simple Sudoku game with interactions to demonstrate the simplest configuration and capabilities of qewd and mumps in the background.

In qewd terminology-

  * The application is sud1
  * 'Types' for interaction will be
     + play  send a transaction with square and a digit to set
         finish message will be new html for the whole board, id=brd
     + show-log   will request display of a log of plays
         finish message is html to go into id=plog
     + show-help  will redisplay board with legal moves remaining for each box.
         finish message is html to go int id=brd
     + hide-help  will change mode to no help and redisplay
         finish message is html for id=brd
         
         

