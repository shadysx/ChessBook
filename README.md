Hello, this is app is going to be a tool that can visually save your chess openings.


	v0.1  
		-Basic interface (CLI)
		-The app can track moves and say the name of line that I give as input.(Only show 1 name if multiple possibilities)

	v0.1.1 
		-Improved UI exeperience with a "decent" theme
	
	v0.1.2
		-Added Next Move feature (only 1 suggestion, this may be enhanced in the future)

	v0.2 
		-Refactoring all the code according in a more evolution friendly way

	v0.2.1
		-Implementing the first draw of the chessboard

	v0.2.2
		-Added the function that can recognize wich cell the piece is draged on. 

	v0.2.3
		-Added pieces takes function

	v0.3
		-The UI is "full functionnal", the line recognition also. Next patch will probably make them work together
	
	v0.3.1
		-Fixing the UI blank spaces bug
		-The board is now fully interactive and we can move the pieces to enter the inputs to line struct

	v0.3.2 
		-Added the official moves notations: only need to fix the ambiguity when 2 pieces can move at the same cell, the castle notation and the check/mate notation (if legal moves are implemented)
	
	v0.3.3
		-Added castle move and notation, castle need to be improved with the correct move logic (very easy dont worry to come back on this code)
		-Added forbiden move: friendly fire
		-Added board flip (need to implement a button to trigger it)
	
	v0.4
		-The playview is done! (almost) little things are messing up but still playable
		-Added flip button trigger
		-Added restart game button

	Expected for v0.5:
		-Chessboard view need a huge code refactor for reusability (for the recordChessView)
		
	Expected for v0.6:
		-Book tab MVP
		-Fix ambiguity when 2 identical pieces can move at the same location
		-Multiple suggestions returned to the view, with percentage from a dataset (ChessDB)
		-ScrollView for line suggestions
		-Playing white then black 
		-Castle Function

	Expected for 1.0:
		-Flip chessboard
		-Clean UI
		-Interactive chessboard interface with drag an drop.
		-Save personal lines (Local and/or Database) 
		-Huge datasets with a lot of existing openings
		-Multiple suggestions
		-Legal moves(not sure if it's worth the time :D)
	 
