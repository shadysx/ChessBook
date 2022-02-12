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

	
	Expected for v0.4:
		-Implement a function that can recognize wich piece is moving, and wich piece is taked so the input can have the format ["e4, e5, kc3"] instead of [e4, e5, c3]
		-Implement a function that can return the input in the kxc3 ()

		
	Expected for v0.5:
		-Multiple suggestions returned to the view, with percentage from a dataset (ChessDB)
		-Playing black or white 
		-Castle Function

	Expected for 1.0:
		-Clean UI
		-Interactive chessboard interface with drag an drop.
		-Save personal lines (Local and/or Database)
		-Huge datasets with a lot of existing openings
		-Multiple suggestions
		-Legal moves(not sure if it's worth the time :D)
	 
