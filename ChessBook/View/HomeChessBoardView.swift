//
//  SandBoxView.swift
//  ChessBook
//
//  Created by Laurent Klein on 12/02/2022.
//

import SwiftUI

struct HomeChessBoardView: View {
    
    @State private var cellWidth: Double = 0
    @State private var inputMove: String = ""
    @State private var playedLine: String = "Moves will be here"
    @State private var playedLineName: String = "Line Name"
    @State private var suggestion: String = "Play First!"
    @State private var whitePlayer: Bool = true
    
    var line = InputLine()
    
    
    @State var pieces: [String: CGPoint] = [
        "whitePawn1": .zero,
        "whitePawn2": .zero,
        "whitePawn3": .zero,
        "whitePawn4": .zero,
        "whitePawn5": .zero,
        "whitePawn6": .zero,
        "whitePawn7": .zero,
        "whitePawn8": .zero,
        
        "whiteRook1": .zero,
        "whiteNight1": .zero,
        "whiteBishop1": .zero,
        "whiteQueen": .zero,
        "whiteKing": .zero,
        "whiteBishop2": .zero,
        "whiteNight2": .zero,
        "whiteRook2": .zero,
        
        "blackPawn1": .zero,
        "blackPawn2": .zero,
        "blackPawn3": .zero,
        "blackPawn4": .zero,
        "blackPawn5": .zero,
        "blackPawn6": .zero,
        "blackPawn7": .zero,
        "blackPawn8": .zero,
        
        "blackRook1": .zero,
        "blackNight1": .zero,
        "blackBishop1": .zero,
        "blackQueen": .zero,
        "blackKing": .zero,
        "blackBishop2": .zero,
        "blackNight2": .zero,
        "blackRook2": .zero,
    ]
    
    @State var piecesCopy: [String: CGPoint] = ["": .zero]
    
    func centerPiece(piecePosition: CGPoint) -> CGPoint{
        let cellY = 8 - Double(Int(piecePosition.y / cellWidth))
        let cellX = 1 + Double(Int(piecePosition.x / cellWidth))
        
        return CGPoint( //This value is meant to replace the piece in the center of the cell
            x: cellX * cellWidth - cellWidth / 2, y: (8 - cellY) * cellWidth + cellWidth / 2)
        
        
    }
    
    func movePiece(piecePosition: CGPoint ,pieceDestination: CGPoint) -> CGPoint {
        
        let pieceStartPosition: CGPoint = piecePosition
        let pieceStartName: String = piecePositionToName(piecePosition: piecePosition)
        let pieceStartCell: String = piecePositionToCell(piecePosition: piecePosition).lowercased()
        var pieceDestinationCentered: CGPoint = centerPiece(piecePosition: pieceDestination)
        var attackedPieceName: String = ""
        var isTaking: Bool = false
        var isTryCastle: Bool = false
        var isShortCastle: Bool = false
        var isLongCastle: Bool = false
        var friendlyFire: Bool = false
        let resetPosition: CGPoint = centerPiece(piecePosition: piecePosition)
        var isPieceMoving: Bool = true
        var castleKingPosition: CGPoint = centerPiece(piecePosition: piecePosition)
    
        
        //Check if piece stay at the same place
        if pieceStartCell == piecePositionToCell(piecePosition: pieceDestinationCentered)
        {
            isPieceMoving = false
        }
        
        
        //Check if pieces is attacked and wich one
        for (name, pos) in pieces {
            if pieceDestinationCentered == pos {
                attackedPieceName = name
                isTaking = true
                
                //Check friendly fire
                if attackedPieceName.contains("white") && pieceStartName.contains("white") {
                    
                    friendlyFire = true
                }
                else if attackedPieceName.contains("black") && pieceStartName.contains("black") {
                    friendlyFire = true
                }
                //If friendly dont take
                if !friendlyFire {
                    pieces[name] = CGPoint(x: 667, y: 667)
                }
            }
        }
        
        
        //Check for castle and castle if needed
        if pieceStartName[5] == "K" && attackedPieceName[5] == "R"
        {
            isTryCastle = true
            //White short castle
            if pieceStartPosition == pieceCellToPosition(cell: "e1") && attackedPieceName == "whiteRook2"{
                print("started from e1 to rook h1")
                if pieces["whiteBishop2"] != pieceCellToPosition(cell: "f1") && pieces["whiteNight2"] != pieceCellToPosition(cell: "g1") {
                    castleKingPosition = pieceCellToPosition(cell: "g1")
                    pieces["whiteRook2"] = pieceCellToPosition(cell: "f1")
                    isShortCastle = true
                    
                }
            }
            
            //white long castle
            if pieceStartPosition == pieceCellToPosition(cell: "e1") && attackedPieceName == "whiteRook1"{
                print("started from e1 to rook a1")
                if pieces["whiteBishop1"] != pieceCellToPosition(cell: "c1") && pieces["whiteNight1"] != pieceCellToPosition(cell: "b1") && pieces["whiteQueen"] != pieceCellToPosition(cell: "d4") {
                    print("king goes in c1")
                    castleKingPosition = pieceCellToPosition(cell: "c1")
                    pieces["whiteRook1"] = pieceCellToPosition(cell: "d1")
                    isLongCastle = true
                    
                }
            }
            
  
            //black short castle
            if pieceStartPosition == pieceCellToPosition(cell: "e8") && attackedPieceName == "blackRook1"{
                print("started from e8 to rook h8")
                if pieces["blackBishop1"] != pieceCellToPosition(cell: "f8") && pieces["blackNight1"] != pieceCellToPosition(cell: "g8") {
                    castleKingPosition = pieceCellToPosition(cell: "g8")
                    pieces["blackRook1"] = pieceCellToPosition(cell: "f8")
                    isShortCastle = true
                    
                }
            }
            
            //black long castle
            if pieceStartPosition == pieceCellToPosition(cell: "e8") && attackedPieceName == "blackRook2"{
                print("started from e8 to rook a8")
                if pieces["blackBishop2"] != pieceCellToPosition(cell: "c8") && pieces["blackNight2"] != pieceCellToPosition(cell: "b8") && pieces["blackQueen"] != pieceCellToPosition(cell: "d8") {
       
                    castleKingPosition = pieceCellToPosition(cell: "c8")
                    pieces["blackRook2"] = pieceCellToPosition(cell: "d8")
                    isLongCastle = true
                }
            }
        }
        
        //Check if castled before
        if !isShortCastle && !isLongCastle && !isTryCastle && !friendlyFire && isPieceMoving {
            //change the state var (this var is sent to the line recognition logic in the format Nf3, c2, O-O, etc)
            if isTaking {
                switch pieceStartName[5] {
                case "P":
                    //If pawn takes we need only the attacker file letter
                    inputMove =  pieceStartCell[0] + "x" + piecePositionToCell(piecePosition: pieceDestinationCentered)
                
                default:
                    //When we take with another piece we need the attacker first letter
                    inputMove =  pieceStartName[5] + "x" + piecePositionToCell(piecePosition: pieceDestinationCentered)
                }
                
            }
            else {
                switch pieceStartName[5] {
                case "P":
                    //If pawn moves no more info is needed
                    inputMove = piecePositionToCell(piecePosition: pieceDestinationCentered)
                    
                default:
                    //If Piece move we need the first letter of the piece
                    inputMove = pieceStartName[5] + piecePositionToCell(piecePosition: pieceDestinationCentered)
                }
            }
            //Need update only when a move is executed till the end
            updateUI()
        }
        else {
            if isShortCastle {
                inputMove = "O-O"
                pieceDestinationCentered = castleKingPosition
                //Need update only when a move is executed till the end
                updateUI()

            }
            else if isLongCastle {
                inputMove = "O-O-O"
                pieceDestinationCentered = castleKingPosition
                //Need update only when a move is executed till the end
                updateUI()
            }
            else if friendlyFire {
                pieceDestinationCentered = resetPosition
                print("got here")
            }
            else if !isPieceMoving {
                pieceDestinationCentered = resetPosition
            }
        }
        
        
        

      
        print(pieceDestinationCentered)
        return pieceDestinationCentered
    }
    
    
    func piecePositionToName(piecePosition: CGPoint) -> String {
        var pieceName: String = ""
    
        for (name, pos) in piecesCopy {
            if pos == piecePosition {
                pieceName = name
            }
        }
        return pieceName
    }
    
    func piecePositionToCell(piecePosition: CGPoint) -> String {
        let cellY = 8 - (Int(piecePosition.y / cellWidth))
        let cellX = 1 + (Int(piecePosition.x / cellWidth))
        var retVal: String = "Not found"
        
        switch cellX {
        case 1:
            retVal = "a\(cellY)"
        case 2:
            retVal = "b\(cellY)"
        case 3:
            retVal = "c\(cellY)"
        case 4:
            retVal = "d\(cellY)"
        case 5:
            retVal = "e\(cellY)"
        case 6:
            retVal = "f\(cellY)"
        case 7:
            retVal = "g\(cellY)"
        case 8:
            retVal = "h\(cellY)"
            default:
                print("Not in the board")
        }
        
        return retVal
    }
    
    func pieceCellToPosition(cell: String) -> CGPoint {
        
        let col = cell[0]
        let row = Double(cell[1])

        
        var x: CGFloat = 0
        var y: CGFloat = 0
        
        
        switch col {
        case "a":
            x = 1 * cellWidth - cellWidth / 2
            y = (9 - row!) * cellWidth - cellWidth / 2
        case "b":
            x = 2 * cellWidth - cellWidth / 2
            y = (9 - row!) * cellWidth - cellWidth / 2
        case "c":
            x = 3 * cellWidth - cellWidth / 2
            y = (9 - row!) * cellWidth - cellWidth / 2
        case "d":
            x = 4 * cellWidth - cellWidth / 2
            y = (9 - row!) * cellWidth - cellWidth / 2
        case "e":
            x = 5 * cellWidth - cellWidth / 2
            y = (9 - row!) * cellWidth - cellWidth / 2
        case "f":
            x = 6 * cellWidth - cellWidth / 2
            y = (9 - row!) * cellWidth - cellWidth / 2
        case "g":
            x = 7 * cellWidth - cellWidth / 2
            y = (9 - row!) * cellWidth - cellWidth / 2
        case "h":
            x = 8 * cellWidth - cellWidth / 2
            y = (9 - row!) * cellWidth - cellWidth / 2
            
            
        default:
            print("Not found")
        }
        
        return CGPoint(x:x,y:y)
    }
    
    struct ChessBoard: Shape {
        let rows: Int
        let columns: Int

        func path(in rect: CGRect) -> Path {
            var path = Path()

            // figure out how big each row/column needs to be
            let rowSize = rect.height / CGFloat(rows)
            let columnSize = rect.width / CGFloat(columns)

            // loop over all rows and columns, making alternating squares colored
            for row in 0 ..< rows {
                for column in 0 ..< columns {
                    if (row + column).isMultiple(of: 2) {
                        // this square should be colored; add a rectangle here
                        let startX = columnSize * CGFloat(column)
                        let startY = rowSize * CGFloat(row)

                        let rect = CGRect(x: startX, y: startY, width: columnSize, height: rowSize)
                        path.addRect(rect)
                    }
                }
            }

            return path
        }
    }
    
    func updateUI()
    {
        var uiText: [String]
        
        //Adding a move
        self.line.addMove(inputMove: inputMove)
        //Request data
        uiText = self.line.getUIData(inputMove: inputMove)
        
        //Affecting the data to UIObjects
        self.playedLine = uiText[0]
        self.playedLineName = uiText[1]
        self.suggestion = uiText[2]
        
        //Updating the piecesCopy
        piecesCopy = pieces
    }
    
    func restartGame() {
        line.restart()
        
        pieces["whitePawn1"] = CGPoint(x: cellWidth * 1 - cellWidth / 2 , y: cellWidth * 7 - cellWidth / 2)
        pieces["whitePawn2"] = CGPoint(x: cellWidth * 2 - cellWidth / 2 , y: cellWidth * 7 - cellWidth / 2)
        pieces["whitePawn3"] = CGPoint(x: cellWidth * 3 - cellWidth / 2 , y: cellWidth * 7 - cellWidth / 2)
        pieces["whitePawn4"] = CGPoint(x: cellWidth * 4 - cellWidth / 2 , y: cellWidth * 7 - cellWidth / 2)
        pieces["whitePawn5"] = CGPoint(x: cellWidth * 5 - cellWidth / 2 , y: cellWidth * 7 - cellWidth / 2)
        pieces["whitePawn6"] = CGPoint(x: cellWidth * 6 - cellWidth / 2 , y: cellWidth * 7 - cellWidth / 2)
        pieces["whitePawn7"] = CGPoint(x: cellWidth * 7 - cellWidth / 2 , y: cellWidth * 7 - cellWidth / 2)
        pieces["whitePawn8"] = CGPoint(x: cellWidth * 8 - cellWidth / 2 , y: cellWidth * 7 - cellWidth / 2)
        
        pieces["whiteRook1"] = CGPoint(x: cellWidth * 1 - cellWidth / 2 , y: cellWidth * 8 - cellWidth / 2)
        pieces["whiteNight1"] = CGPoint(x: cellWidth * 2 - cellWidth / 2 , y: cellWidth * 8 - cellWidth / 2)
        pieces["whiteBishop1"] = CGPoint(x: cellWidth * 3 - cellWidth / 2 , y: cellWidth * 8 - cellWidth / 2)
        pieces["whiteQueen"] = CGPoint(x: cellWidth * 4 - cellWidth / 2 , y: cellWidth * 8 - cellWidth / 2)
        pieces["whiteKing"] = CGPoint(x: cellWidth * 5 - cellWidth / 2 , y: cellWidth * 8 - cellWidth / 2)
        pieces["whiteBishop2"] = CGPoint(x: cellWidth * 6 - cellWidth / 2 , y: cellWidth * 8 - cellWidth / 2)
        pieces["whiteNight2"] = CGPoint(x: cellWidth * 7 - cellWidth / 2 , y: cellWidth * 8 - cellWidth / 2)
        pieces["whiteRook2"] = CGPoint(x: cellWidth * 8 - cellWidth / 2 , y: cellWidth * 8 - cellWidth / 2)

        pieces["blackPawn1"] = CGPoint(x: cellWidth * 8 - cellWidth / 2 , y: cellWidth * 2 - cellWidth / 2)
        pieces["blackPawn2"] = CGPoint(x: cellWidth * 7 - cellWidth / 2 , y: cellWidth * 2 - cellWidth / 2)
        pieces["blackPawn3"] = CGPoint(x: cellWidth * 6 - cellWidth / 2 , y: cellWidth * 2 - cellWidth / 2)
        pieces["blackPawn4"] = CGPoint(x: cellWidth * 5 - cellWidth / 2 , y: cellWidth * 2 - cellWidth / 2)
        pieces["blackPawn5"] = CGPoint(x: cellWidth * 4 - cellWidth / 2 , y: cellWidth * 2 - cellWidth / 2)
        pieces["blackPawn6"] = CGPoint(x: cellWidth * 3 - cellWidth / 2 , y: cellWidth * 2 - cellWidth / 2)
        pieces["blackPawn7"] = CGPoint(x: cellWidth * 2 - cellWidth / 2 , y: cellWidth * 2 - cellWidth / 2)
        pieces["blackPawn8"] = CGPoint(x: cellWidth * 1 - cellWidth / 2 , y: cellWidth * 2 - cellWidth / 2)
        
        pieces["blackRook1"] = CGPoint(x: cellWidth * 8 - cellWidth / 2 , y: cellWidth * 1 - cellWidth / 2)
        pieces["blackNight1"] = CGPoint(x: cellWidth * 7 - cellWidth / 2 , y: cellWidth * 1 - cellWidth / 2)
        pieces["blackBishop1"] = CGPoint(x: cellWidth * 6 - cellWidth / 2 , y: cellWidth * 1 - cellWidth / 2)
        pieces["blackKing"] = CGPoint(x: cellWidth * 5 - cellWidth / 2 , y: cellWidth * 1 - cellWidth / 2)
        pieces["blackQueen"] = CGPoint(x: cellWidth * 4 - cellWidth / 2 , y: cellWidth * 1 - cellWidth / 2)
        pieces["blackBishop2"] = CGPoint(x: cellWidth * 3 - cellWidth / 2 , y: cellWidth * 1 - cellWidth / 2)
        pieces["blackNight2"] = CGPoint(x: cellWidth * 2 - cellWidth / 2 , y: cellWidth * 1 - cellWidth / 2)
        pieces["blackRook2"] = CGPoint(x: cellWidth * 1 - cellWidth / 2 , y: cellWidth * 1 - cellWidth / 2)
        
        piecesCopy = pieces
        
        inputMove = ""
        
        updateUI() //
    }

    
    var body: some View {
        
        VStack {
            Spacer()
            Text(playedLineName)
                .font(.system(size: 30))
                .minimumScaleFactor(0.01)
                .lineLimit(1)
            Text("[\(playedLine) ]")
                .font(.system(size: 20))
            
            Text("Next Opening Move: \(suggestion)")
                .font(.system(size: 30))
                .minimumScaleFactor(0.01)
                .lineLimit(1)
                .foregroundColor(.blue)
            Spacer()
        
            ZStack(alignment: .bottom){
                ChessBoard(rows: 8, columns: 8)
                    .fill(Color.white)
                    .frame(
                        minWidth: 0, maxWidth: .infinity, minHeight: 0
                    )
                    .aspectRatio(contentMode: .fit)
                    .background(.blue)
                    .cornerRadius(8)
      

                    
                    .onAppear {
                        cellWidth = UIScreen.main.bounds.width / 8
                        
                        pieces["whitePawn1"] = CGPoint(x: cellWidth * 1 - cellWidth / 2 , y: cellWidth * 7 - cellWidth / 2)
                        pieces["whitePawn2"] = CGPoint(x: cellWidth * 2 - cellWidth / 2 , y: cellWidth * 7 - cellWidth / 2)
                        pieces["whitePawn3"] = CGPoint(x: cellWidth * 3 - cellWidth / 2 , y: cellWidth * 7 - cellWidth / 2)
                        pieces["whitePawn4"] = CGPoint(x: cellWidth * 4 - cellWidth / 2 , y: cellWidth * 7 - cellWidth / 2)
                        pieces["whitePawn5"] = CGPoint(x: cellWidth * 5 - cellWidth / 2 , y: cellWidth * 7 - cellWidth / 2)
                        pieces["whitePawn6"] = CGPoint(x: cellWidth * 6 - cellWidth / 2 , y: cellWidth * 7 - cellWidth / 2)
                        pieces["whitePawn7"] = CGPoint(x: cellWidth * 7 - cellWidth / 2 , y: cellWidth * 7 - cellWidth / 2)
                        pieces["whitePawn8"] = CGPoint(x: cellWidth * 8 - cellWidth / 2 , y: cellWidth * 7 - cellWidth / 2)
                        
                        pieces["whiteRook1"] = CGPoint(x: cellWidth * 1 - cellWidth / 2 , y: cellWidth * 8 - cellWidth / 2)
                        pieces["whiteNight1"] = CGPoint(x: cellWidth * 2 - cellWidth / 2 , y: cellWidth * 8 - cellWidth / 2)
                        pieces["whiteBishop1"] = CGPoint(x: cellWidth * 3 - cellWidth / 2 , y: cellWidth * 8 - cellWidth / 2)
                        pieces["whiteQueen"] = CGPoint(x: cellWidth * 4 - cellWidth / 2 , y: cellWidth * 8 - cellWidth / 2)
                        pieces["whiteKing"] = CGPoint(x: cellWidth * 5 - cellWidth / 2 , y: cellWidth * 8 - cellWidth / 2)
                        pieces["whiteBishop2"] = CGPoint(x: cellWidth * 6 - cellWidth / 2 , y: cellWidth * 8 - cellWidth / 2)
                        pieces["whiteNight2"] = CGPoint(x: cellWidth * 7 - cellWidth / 2 , y: cellWidth * 8 - cellWidth / 2)
                        pieces["whiteRook2"] = CGPoint(x: cellWidth * 8 - cellWidth / 2 , y: cellWidth * 8 - cellWidth / 2)

                        pieces["blackPawn1"] = CGPoint(x: cellWidth * 8 - cellWidth / 2 , y: cellWidth * 2 - cellWidth / 2)
                        pieces["blackPawn2"] = CGPoint(x: cellWidth * 7 - cellWidth / 2 , y: cellWidth * 2 - cellWidth / 2)
                        pieces["blackPawn3"] = CGPoint(x: cellWidth * 6 - cellWidth / 2 , y: cellWidth * 2 - cellWidth / 2)
                        pieces["blackPawn4"] = CGPoint(x: cellWidth * 5 - cellWidth / 2 , y: cellWidth * 2 - cellWidth / 2)
                        pieces["blackPawn5"] = CGPoint(x: cellWidth * 4 - cellWidth / 2 , y: cellWidth * 2 - cellWidth / 2)
                        pieces["blackPawn6"] = CGPoint(x: cellWidth * 3 - cellWidth / 2 , y: cellWidth * 2 - cellWidth / 2)
                        pieces["blackPawn7"] = CGPoint(x: cellWidth * 2 - cellWidth / 2 , y: cellWidth * 2 - cellWidth / 2)
                        pieces["blackPawn8"] = CGPoint(x: cellWidth * 1 - cellWidth / 2 , y: cellWidth * 2 - cellWidth / 2)
                        
                        pieces["blackRook1"] = CGPoint(x: cellWidth * 8 - cellWidth / 2 , y: cellWidth * 1 - cellWidth / 2)
                        pieces["blackNight1"] = CGPoint(x: cellWidth * 7 - cellWidth / 2 , y: cellWidth * 1 - cellWidth / 2)
                        pieces["blackBishop1"] = CGPoint(x: cellWidth * 6 - cellWidth / 2 , y: cellWidth * 1 - cellWidth / 2)
                        pieces["blackKing"] = CGPoint(x: cellWidth * 5 - cellWidth / 2 , y: cellWidth * 1 - cellWidth / 2)
                        pieces["blackQueen"] = CGPoint(x: cellWidth * 4 - cellWidth / 2 , y: cellWidth * 1 - cellWidth / 2)
                        pieces["blackBishop2"] = CGPoint(x: cellWidth * 3 - cellWidth / 2 , y: cellWidth * 1 - cellWidth / 2)
                        pieces["blackNight2"] = CGPoint(x: cellWidth * 2 - cellWidth / 2 , y: cellWidth * 1 - cellWidth / 2)
                        pieces["blackRook2"] = CGPoint(x: cellWidth * 1 - cellWidth / 2 , y: cellWidth * 1 - cellWidth / 2)
                        
                        piecesCopy = pieces
                        
                        updateUI()
                        
                    }

                Group {
                    Group {
                        Image("whitePawn")
                            .resizable()
                            .rotationEffect(.degrees(whitePlayer ? 0 : 180))
                            .frame(width: cellWidth, height: cellWidth)
                            .position(pieces["whitePawn1"]!)
                            .gesture(
                                DragGesture()
                                    .onChanged { value in
                                        pieces["whitePawn1"]! = value.location
                                    }
                                    .onEnded {_ in
                                        pieces["whitePawn1"] = movePiece(piecePosition: piecesCopy["whitePawn1"]!, pieceDestination: pieces["whitePawn1"]!)
                                        
                                    }
                            )
                            

                        Image("whitePawn")
                            .resizable()
                            .rotationEffect(.degrees(whitePlayer ? 0 : 180))
                            .frame(width: cellWidth, height: cellWidth)
                            .position(pieces["whitePawn2"]!)
                            .gesture(
                                DragGesture()
                                    .onChanged { value in
                                        pieces["whitePawn2"]! = value.location
                                    }
                                    .onEnded {_ in
                                        pieces["whitePawn2"] = movePiece(piecePosition: piecesCopy["whitePawn2"]!, pieceDestination: pieces["whitePawn2"]!)
                                    }
                            )
                            

                        Image("whitePawn")
                            .resizable()
                            .rotationEffect(.degrees(whitePlayer ? 0 : 180))
                            .frame(width: cellWidth, height: cellWidth)
                            .position(pieces["whitePawn3"]!)
                            .gesture(
                                DragGesture()
                                    .onChanged { value in
                                        pieces["whitePawn3"]! = value.location
                                    }
                                    .onEnded {_ in
                                        pieces["whitePawn3"] = movePiece(piecePosition: piecesCopy["whitePawn3"]!, pieceDestination: pieces["whitePawn3"]!)



                                    }
                            )
                            

                        Image("whitePawn")
                            .resizable()
                            .rotationEffect(.degrees(whitePlayer ? 0 : 180))
                            .frame(width: cellWidth, height: cellWidth)
                            .position(pieces["whitePawn4"]!)
                            .gesture(
                                DragGesture()
                                    .onChanged { value in
                                        pieces["whitePawn4"]! = value.location
                                    }
                                    .onEnded {_ in
                                        pieces["whitePawn4"] = movePiece(piecePosition: piecesCopy["whitePawn4"]!, pieceDestination: pieces["whitePawn4"]!)
                                    }
                            )
                            

                        Image("whitePawn")
                            .resizable()
                            .rotationEffect(.degrees(whitePlayer ? 0 : 180))
                            .frame(width: cellWidth, height: cellWidth)
                            .position(pieces["whitePawn5"]!)
                            .gesture(
                                DragGesture()
                                    .onChanged { value in
                                        pieces["whitePawn5"]! = value.location
                                    }
                                    .onEnded {_ in
                                        pieces["whitePawn5"] = movePiece(piecePosition: piecesCopy["whitePawn5"]!, pieceDestination: pieces["whitePawn5"]!)



                                    }
                            )
                            

                        Image("whitePawn")
                            .resizable()
                            .rotationEffect(.degrees(whitePlayer ? 0 : 180))
                            .frame(width: cellWidth, height: cellWidth)
                            .position(pieces["whitePawn6"]!)
                            .gesture(
                                DragGesture()
                                    .onChanged { value in
                                        pieces["whitePawn6"]! = value.location
                                    }
                                    .onEnded {_ in
                                        pieces["whitePawn6"] = movePiece(piecePosition: piecesCopy["whitePawn6"]!, pieceDestination: pieces["whitePawn6"]!)
                                    }
                            )
                            

                        Image("whitePawn")
                            .resizable()
                            .rotationEffect(.degrees(whitePlayer ? 0 : 180))
                            .frame(width: cellWidth, height: cellWidth)
                            .position(pieces["whitePawn7"]!)
                            .gesture(
                                DragGesture()
                                    .onChanged { value in
                                        pieces["whitePawn7"]! = value.location
                                    }
                                    .onEnded {_ in
                                        pieces["whitePawn7"] = movePiece(piecePosition: piecesCopy["whitePawn7"]!, pieceDestination: pieces["whitePawn7"]!)



                                    }
                            )
                            

                        Image("whitePawn")
                            .resizable()
                            .rotationEffect(.degrees(whitePlayer ? 0 : 180))
                            .frame(width: cellWidth, height: cellWidth)
                            .position(pieces["whitePawn8"]!)
                            .gesture(
                                DragGesture()
                                    .onChanged { value in
                                        pieces["whitePawn8"]! = value.location
                                    }
                                    .onEnded {_ in
                                        pieces["whitePawn8"] = movePiece(piecePosition: piecesCopy["whitePawn8"]!, pieceDestination: pieces["whitePawn8"]!)
                                    }
                            )
                            
                    }
                    

                    Group {
                        Image("whiteRook")
                            .resizable()
                            .rotationEffect(.degrees(whitePlayer ? 0 : 180))
                            .frame(width: cellWidth, height: cellWidth)
                            .position(pieces["whiteRook1"]!)
                            .gesture(
                                DragGesture()
                                    .onChanged { value in
                                        pieces["whiteRook1"]! = value.location
                                    }
                                    .onEnded {_ in
                                        pieces["whiteRook1"] = movePiece(piecePosition: piecesCopy["whiteRook1"]!, pieceDestination: pieces["whiteRook1"]!)



                                    }
                            )
                            

                        Image("whiteKnight")
                            .resizable()
                            .rotationEffect(.degrees(whitePlayer ? 0 : 180))
                            .frame(width: cellWidth, height: cellWidth)
                            .position(pieces["whiteNight1"]!)
                            .gesture(
                                DragGesture()
                                    .onChanged { value in
                                        pieces["whiteNight1"]! = value.location
                                    }
                                    .onEnded {_ in
                                        pieces["whiteNight1"] = movePiece(piecePosition: piecesCopy["whiteNight1"]!, pieceDestination: pieces["whiteNight1"]!)
                                    }
                            )
                            

                        Image("whiteBishop")
                            .resizable()
                            .rotationEffect(.degrees(whitePlayer ? 0 : 180))
                            .frame(width: cellWidth, height: cellWidth)
                            .position(pieces["whiteBishop1"]!)
                            .gesture(
                                DragGesture()
                                    .onChanged { value in
                                        pieces["whiteBishop1"]! = value.location
                                    }
                                    .onEnded {_ in
                                        pieces["whiteBishop1"] = movePiece(piecePosition: piecesCopy["whiteBishop1"]!, pieceDestination: pieces["whiteBishop1"]!)



                                    }
                            )
                            

                        Image("whiteQueen")
                            .resizable()
                            .rotationEffect(.degrees(whitePlayer ? 0 : 180))
                            .frame(width: cellWidth, height: cellWidth)
                            .position(pieces["whiteQueen"]!)
                            .gesture(
                                DragGesture()
                                    .onChanged { value in
                                        pieces["whiteQueen"]! = value.location
                                    }
                                    .onEnded {_ in
                                        pieces["whiteQueen"] = movePiece(piecePosition: piecesCopy["whiteQueen"]!, pieceDestination: pieces["whiteQueen"]!)
                                    }
                            )
                            

                        Image("whiteKing")
                            .resizable()
                            .rotationEffect(.degrees(whitePlayer ? 0 : 180))
                            .frame(width: cellWidth, height: cellWidth)
                            .position(pieces["whiteKing"]!)
                            .gesture(
                                DragGesture()
                                    .onChanged { value in
                                        pieces["whiteKing"]! = value.location
                                    }
                                    .onEnded {_ in
                                        pieces["whiteKing"] = movePiece(piecePosition: piecesCopy["whiteKing"]!, pieceDestination: pieces["whiteKing"]!)



                                    }
                            )
                            

                        Image("whiteBishop")
                            .resizable()
                            .rotationEffect(.degrees(whitePlayer ? 0 : 180))
                            .frame(width: cellWidth, height: cellWidth)
                            .position(pieces["whiteBishop2"]!)
                            .gesture(
                                DragGesture()
                                    .onChanged { value in
                                        pieces["whiteBishop2"]! = value.location
                                    }
                                    .onEnded {_ in
                                        pieces["whiteBishop2"] = movePiece(piecePosition: piecesCopy["whiteBishop2"]!, pieceDestination: pieces["whiteBishop2"]!)
                                    }
                            )
                            

                        Image("whiteKnight")
                            .resizable()
                            .rotationEffect(.degrees(whitePlayer ? 0 : 180))
                            .frame(width: cellWidth, height: cellWidth)
                            .position(pieces["whiteNight2"]!)
                            .gesture(
                                DragGesture()
                                    .onChanged { value in
                                        pieces["whiteNight2"]! = value.location
                                    }
                                    .onEnded {_ in
                                        pieces["whiteNight2"] = movePiece(piecePosition: piecesCopy["whiteNight2"]!, pieceDestination: pieces["whiteNight2"]!)



                                    }
                            )
                            

                        Image("whiteRook")
                            .resizable()
                            .rotationEffect(.degrees(whitePlayer ? 0 : 180))
                            .frame(width: cellWidth, height: cellWidth)
                            .position(pieces["whiteRook2"]!)
                            .gesture(
                                DragGesture()
                                    .onChanged { value in
                                        pieces["whiteRook2"]! = value.location
                                    }
                                    .onEnded {_ in
                                        pieces["whiteRook2"] = movePiece(piecePosition: piecesCopy["whiteRook2"]!, pieceDestination: pieces["whiteRook2"]!)
                                    }
                            )
                            
                    }




                    Group {
                        Image("blackPawn")
                            .resizable()
                            .rotationEffect(.degrees(whitePlayer ? 0 : 180))
                            .frame(width: cellWidth, height: cellWidth)
                            .position(pieces["blackPawn1"]!)
                            .gesture(
                                DragGesture()
                                    .onChanged { value in
                                        pieces["blackPawn1"]! = value.location
                                    }
                                    .onEnded {_ in
                                        pieces["blackPawn1"]! = movePiece(piecePosition: piecesCopy["blackPawn1"]!, pieceDestination: pieces["blackPawn1"]!)
                                    }
                            )
                            

                        Image("blackPawn")
                            .resizable()
                            .rotationEffect(.degrees(whitePlayer ? 0 : 180))
                            .frame(width: cellWidth, height: cellWidth)
                            .position(pieces["blackPawn2"]!)
                            .gesture(
                                DragGesture()
                                    .onChanged { value in
                                        pieces["blackPawn2"]! = value.location
                                    }
                                    .onEnded {_ in
                                        pieces["blackPawn2"]! = movePiece(piecePosition: piecesCopy["blackPawn2"]!, pieceDestination: pieces["blackPawn2"]!)
                                    }
                            )
                            

                        Image("blackPawn")
                            .resizable()
                            .rotationEffect(.degrees(whitePlayer ? 0 : 180))
                            .frame(width: cellWidth, height: cellWidth)
                            .position(pieces["blackPawn3"]!)
                            .gesture(
                                DragGesture()
                                    .onChanged { value in
                                        pieces["blackPawn3"]! = value.location
                                    }
                                    .onEnded {_ in
                                        pieces["blackPawn3"]! = movePiece(piecePosition: piecesCopy["blackPawn3"]!, pieceDestination: pieces["blackPawn3"]!)
                                    }
                            )
                            

                        Image("blackPawn")
                            .resizable()
                            .rotationEffect(.degrees(whitePlayer ? 0 : 180))
                            .frame(width: cellWidth, height: cellWidth)
                            .position(pieces["blackPawn4"]!)
                            .gesture(
                                DragGesture()
                                    .onChanged { value in
                                        pieces["blackPawn4"]! = value.location
                                    }
                                    .onEnded {_ in
                                        pieces["blackPawn4"]! = movePiece(piecePosition: piecesCopy["blackPawn4"]!, pieceDestination: pieces["blackPawn4"]!)
                                    }
                            )
                            

                        Image("blackPawn")
                            .resizable()
                            .rotationEffect(.degrees(whitePlayer ? 0 : 180))
                            .frame(width: cellWidth, height: cellWidth)
                            .position(pieces["blackPawn5"]!)
                            .gesture(
                                DragGesture()
                                    .onChanged { value in
                                        pieces["blackPawn5"]! = value.location
                                    }
                                    .onEnded {_ in
                                        pieces["blackPawn5"]! = movePiece(piecePosition: piecesCopy["blackPawn5"]!, pieceDestination: pieces["blackPawn5"]!)
                                    }
                            )
                            

                        Image("blackPawn")
                            .resizable()
                            .rotationEffect(.degrees(whitePlayer ? 0 : 180))
                            .frame(width: cellWidth, height: cellWidth)
                            .position(pieces["blackPawn6"]!)
                            .gesture(
                                DragGesture()
                                    .onChanged { value in
                                        pieces["blackPawn6"]! = value.location
                                    }
                                    .onEnded {_ in
                                        pieces["blackPawn6"]! = movePiece(piecePosition: piecesCopy["blackPawn6"]!, pieceDestination: pieces["blackPawn6"]!)
                                    }
                            )
                            
                        

                        Image("blackPawn")
                            .resizable()
                            .rotationEffect(.degrees(whitePlayer ? 0 : 180))
                            .frame(width: cellWidth, height: cellWidth)
                            .position(pieces["blackPawn7"]!)
                            .gesture(
                                DragGesture()
                                    .onChanged { value in
                                        pieces["blackPawn7"]! = value.location
                                    }
                                    .onEnded {_ in
                                        pieces["blackPawn7"]! = movePiece(piecePosition: piecesCopy["whitePawn7"]!, pieceDestination: pieces["blackPawn7"]!)
                                    }
                            )
                            

                        Image("blackPawn")
                            .resizable()
                            .rotationEffect(.degrees(whitePlayer ? 0 : 180))
                            .frame(width: cellWidth, height: cellWidth)
                            .position(pieces["blackPawn8"]!)
                            .gesture(
                                DragGesture()
                                    .onChanged { value in
                                        pieces["blackPawn8"]! = value.location
                                    }
                                    .onEnded {_ in
                                        pieces["blackPawn8"]! = movePiece(piecePosition: piecesCopy["blackPawn8"]!, pieceDestination: pieces["blackPawn8"]!)
                                    }
                            )
                            
                    }
                    

                    Group {
                        Image("blackRook")
                            .resizable()
                            .rotationEffect(.degrees(whitePlayer ? 0 : 180))
                            .frame(width: cellWidth, height: cellWidth)
                            .position(pieces["blackRook1"]!)
                            .gesture(
                                DragGesture()
                                    .onChanged { value in
                                        pieces["blackRook1"]! = value.location
                                    }
                                    .onEnded {_ in
                                        pieces["blackRook1"] = movePiece(piecePosition: piecesCopy["blackRook1"]!, pieceDestination: pieces["blackRook1"]!)
                                    }
                            )
                            

                        Image("blackKnight")
                            .resizable()
                            .rotationEffect(.degrees(whitePlayer ? 0 : 180))
                            .frame(width: cellWidth, height: cellWidth)
                            .position(pieces["blackNight1"]!)
                            .gesture(
                                DragGesture()
                                    .onChanged { value in
                                        pieces["blackNight1"]! = value.location
                                    }
                                    .onEnded {_ in
                                        pieces["blackNight1"] = movePiece(piecePosition: piecesCopy["blackNight1"]!, pieceDestination: pieces["blackNight1"]!)
                                    }
                            )
                            

                        Image("blackBishop")
                            .resizable()
                            .rotationEffect(.degrees(whitePlayer ? 0 : 180))
                            .frame(width: cellWidth, height: cellWidth)
                            .position(pieces["blackBishop1"]!)
                            .gesture(
                                DragGesture()
                                    .onChanged { value in
                                        pieces["blackBishop1"]! = value.location
                                    }
                                    .onEnded {_ in
                                        pieces["blackBishop1"] = movePiece(piecePosition: piecesCopy["blackBishop1"]!, pieceDestination: pieces["blackBishop1"]!)



                                    }
                            )
                            

                        Image("blackQueen")
                            .resizable()
                            .rotationEffect(.degrees(whitePlayer ? 0 : 180))
                            .frame(width: cellWidth, height: cellWidth)
                            .position(pieces["blackQueen"]!)
                            .gesture(
                                DragGesture()
                                    .onChanged { value in
                                        pieces["blackQueen"]! = value.location
                                    }
                                    .onEnded {_ in
                                        pieces["blackQueen"] = movePiece(piecePosition: piecesCopy["blackQueen"]!, pieceDestination: pieces["blackQueen"]!)
                                    }
                            )
                            

                        Image("blackKing")
                            .resizable()
                            .rotationEffect(.degrees(whitePlayer ? 0 : 180))
                            .frame(width: cellWidth, height: cellWidth)
                            .position(pieces["blackKing"]!)
                            .gesture(
                                DragGesture()
                                    .onChanged { value in
                                        pieces["blackKing"]! = value.location
                                    }
                                    .onEnded {_ in
                                        pieces["blackKing"] = movePiece(piecePosition: piecesCopy["blackKing"]!, pieceDestination: pieces["blackKing"]!)



                                    }
                            )
                            

                        Image("blackBishop")
                            .resizable()
                            .rotationEffect(.degrees(whitePlayer ? 0 : 180))
                            .frame(width: cellWidth, height: cellWidth)
                            .position(pieces["blackBishop2"]!)
                            .gesture(
                                DragGesture()
                                    .onChanged { value in
                                        pieces["blackBishop2"]! = value.location
                                    }
                                    .onEnded {_ in
                                        pieces["blackBishop2"] = movePiece(piecePosition: piecesCopy["blackBishop2"]!, pieceDestination: pieces["blackBishop2"]!)
                                    }
                            )
                            

                        Image("blackKnight")
                            .resizable()
                            .rotationEffect(.degrees(whitePlayer ? 0 : 180))
                            .frame(width: cellWidth, height: cellWidth)
                            .position(pieces["blackNight2"]!)
                            .gesture(
                                DragGesture()
                                    .onChanged { value in
                                        pieces["blackNight2"]! = value.location
                                    }
                                    .onEnded {_ in
                                        pieces["blackNight2"] = movePiece(piecePosition: piecesCopy["blackNight2"]!, pieceDestination: pieces["blackNight2"]!)



                                    }
                            )
                            

                        Image("blackRook")
                            .resizable()
                            .rotationEffect(.degrees(whitePlayer ? 0 : 180))
                            .frame(width: cellWidth, height: cellWidth)
                            .position(pieces["blackRook2"]!)
                            .gesture(
                                DragGesture()
                                    .onChanged { value in
                                        pieces["blackRook2"]! = value.location
                                    }
                                    .onEnded {_ in
                                        pieces["blackRook2"] = movePiece(piecePosition: piecesCopy["blackRook2"]!, pieceDestination: pieces["blackRook2"]!)
                                    }
                            )
                            
                    }
                }//Group parent
                .frame(width: cellWidth*8, height: cellWidth*8)
              
                
            }//.border(.red) //ZSTACK CLOSING HERE
            .rotationEffect(.degrees(whitePlayer ? 0 : 180))
            Spacer()
            HStack {
                Button(action: {whitePlayer.toggle()}) {
                    Label("Flip Board", systemImage: "arrow.clockwise")
                }
                Spacer()
                Button(action: {restartGame()}) {
                    Label("Restart Game", systemImage: "restart")
                }
            }
            Spacer()

        }
    }
}
