//
//  BoardView.swift
//  ChessBook
//
//  Created by Laurent Klein on 09/02/2022.
//

import SwiftUI

struct HomeChessBoardView: View {
  
    @State var lastMove = ".."
    @State var cellWidth: CGFloat = 0
    @State var boardHeight: CGFloat = 0
    @State var chessBoardYStart: CGFloat = 0
    
    //White Pieces
    @State var whitePawnAPosition: CGPoint = CGPoint(x: 0, y:0)
    @State var whitePawnBPosition: CGPoint = CGPoint(x: 0, y:0)
    @State var whitePawnCPosition: CGPoint = CGPoint(x: 0, y:0)
    @State var whitePawnDPosition: CGPoint = CGPoint(x: 0, y:0)
    @State var whitePawnEPosition: CGPoint = CGPoint(x: 0, y:0)
    @State var whitePawnFPosition: CGPoint = CGPoint(x: 0, y:0)
    @State var whitePawnGPosition: CGPoint = CGPoint(x: 0, y:0)
    @State var whitePawnHPosition: CGPoint = CGPoint(x: 0, y:0)

    @State var whiteRookAPosition: CGPoint = CGPoint(x: 0, y:0)
    @State var whiteKnightBPosition: CGPoint = CGPoint(x: 0, y:0)
    @State var whiteBishopCPosition: CGPoint = CGPoint(x: 0, y:0)
    @State var whiteQueenPosition: CGPoint = CGPoint(x: 0, y:0)
    @State var whiteKingPosition: CGPoint = CGPoint(x: 0, y:0)
    @State var whiteBishopFPosition: CGPoint = CGPoint(x: 0, y:0)
    @State var whiteKnightGPosition: CGPoint = CGPoint(x: 0, y:0)
    @State var whiteRookHPosition: CGPoint = CGPoint(x: 0, y:0)
    
    
    //Black Pieces
    @State var blackPawnAPosition: CGPoint = CGPoint(x: 0, y:0)
    @State var blackPawnBPosition: CGPoint = CGPoint(x: 0, y:0)
    @State var blackPawnCPosition: CGPoint = CGPoint(x: 0, y:0)
    @State var blackPawnDPosition: CGPoint = CGPoint(x: 0, y:0)
    @State var blackPawnEPosition: CGPoint = CGPoint(x: 0, y:0)
    @State var blackPawnFPosition: CGPoint = CGPoint(x: 0, y:0)
    @State var blackPawnGPosition: CGPoint = CGPoint(x: 0, y:0)
    @State var blackPawnHPosition: CGPoint = CGPoint(x: 0, y:0)
    
    @State var blackRookAPosition: CGPoint = CGPoint(x: 0, y:0)
    @State var blackKnightBPosition: CGPoint = CGPoint(x: 0, y:0)
    @State var blackBishopCPosition: CGPoint = CGPoint(x: 0, y:0)
    @State var blackQueenPosition: CGPoint = CGPoint(x: 0, y:0)
    @State var blackKingPosition: CGPoint = CGPoint(x: 0, y:0)
    @State var blackBishopFPosition: CGPoint = CGPoint(x: 0, y:0)
    @State var blackKnightGPosition: CGPoint = CGPoint(x: 0, y:0)
    @State var blackRookHPosition: CGPoint = CGPoint(x: 0, y:0)
    
    
    
    
    var body: some View {
        
        ZStack (alignment: .top){
            
                GeometryReader{ geometry in
                    ChessBoard(rows: 8, columns: 8)
                        .fill(Color.blue)
                        .frame(
                            minWidth: 0, maxWidth: .infinity, minHeight: 0
                        )
                        .aspectRatio(contentMode: .fit)
                        
                        .onAppear {

                            cellWidth = UIScreen.main.bounds.width / 8
                            print("CellWidth: \(cellWidth)")
                            
                            
                            //White
                            whitePawnAPosition = CGPoint(x: cellWidth * 1 - cellWidth / 2 , y: cellWidth * 7 - cellWidth / 2)
                            whitePawnBPosition = CGPoint(x: cellWidth * 2 - cellWidth / 2 , y: cellWidth * 7 - cellWidth / 2)
                            whitePawnCPosition = CGPoint(x: cellWidth * 3 - cellWidth / 2 , y: cellWidth * 7 - cellWidth / 2)
                            whitePawnDPosition = CGPoint(x: cellWidth * 4 - cellWidth / 2 , y: cellWidth * 7 - cellWidth / 2)
                            whitePawnEPosition = CGPoint(x: cellWidth * 5 - cellWidth / 2 , y: cellWidth * 7 - cellWidth / 2)
                            whitePawnFPosition = CGPoint(x: cellWidth * 6 - cellWidth / 2 , y: cellWidth * 7 - cellWidth / 2)
                            whitePawnGPosition = CGPoint(x: cellWidth * 7 - cellWidth / 2 , y: cellWidth * 7 - cellWidth / 2)
                            whitePawnHPosition = CGPoint(x: cellWidth * 8 - cellWidth / 2 , y: cellWidth * 7 - cellWidth / 2)
                            
                            whiteRookAPosition = CGPoint(x: cellWidth * 1 - cellWidth / 2 , y: cellWidth * 8 - cellWidth / 2)
                            whiteKnightBPosition = CGPoint(x: cellWidth * 2 - cellWidth / 2 , y: cellWidth * 8 - cellWidth / 2)
                            whiteBishopCPosition = CGPoint(x: cellWidth * 3 - cellWidth / 2 , y: cellWidth * 8 - cellWidth / 2)
                            whiteQueenPosition = CGPoint(x: cellWidth * 4 - cellWidth / 2 , y: cellWidth * 8 - cellWidth / 2)
                            whiteKingPosition = CGPoint(x: cellWidth * 5 - cellWidth / 2 , y: cellWidth * 8 - cellWidth / 2)
                            whiteBishopFPosition = CGPoint(x: cellWidth * 6 - cellWidth / 2 , y: cellWidth * 8 - cellWidth / 2)
                            whiteKnightGPosition = CGPoint(x: cellWidth * 7 - cellWidth / 2 , y: cellWidth * 8 - cellWidth / 2)
                            whiteRookHPosition = CGPoint(x: cellWidth * 8 - cellWidth / 2 , y: cellWidth * 8 - cellWidth / 2)
                            
                            //Black
                            blackPawnAPosition = CGPoint(x: cellWidth * 8 - cellWidth / 2 , y: cellWidth * 2 - cellWidth / 2)
                            blackPawnBPosition = CGPoint(x: cellWidth * 7 - cellWidth / 2 , y: cellWidth * 2 - cellWidth / 2)
                            blackPawnCPosition = CGPoint(x: cellWidth * 6 - cellWidth / 2 , y: cellWidth * 2 - cellWidth / 2)
                            blackPawnDPosition = CGPoint(x: cellWidth * 5 - cellWidth / 2 , y: cellWidth * 2 - cellWidth / 2)
                            blackPawnEPosition = CGPoint(x: cellWidth * 4 - cellWidth / 2 , y: cellWidth * 2 - cellWidth / 2)
                            blackPawnFPosition = CGPoint(x: cellWidth * 3 - cellWidth / 2 , y: cellWidth * 2 - cellWidth / 2)
                            blackPawnGPosition = CGPoint(x: cellWidth * 2 - cellWidth / 2 , y: cellWidth * 2 - cellWidth / 2)
                            blackPawnHPosition = CGPoint(x: cellWidth * 1 - cellWidth / 2 , y: cellWidth * 2 - cellWidth / 2)
                            
                            blackRookAPosition = CGPoint(x: cellWidth * 8 - cellWidth / 2 , y: cellWidth * 1 - cellWidth / 2)
                            blackKnightBPosition = CGPoint(x: cellWidth * 7 - cellWidth / 2 , y: cellWidth * 1 - cellWidth / 2)
                            blackBishopCPosition = CGPoint(x: cellWidth * 6 - cellWidth / 2 , y: cellWidth * 1 - cellWidth / 2)
                            blackQueenPosition = CGPoint(x: cellWidth * 5 - cellWidth / 2 , y: cellWidth * 1 - cellWidth / 2)
                            blackKingPosition = CGPoint(x: cellWidth * 4 - cellWidth / 2 , y: cellWidth * 1 - cellWidth / 2)
                            blackBishopFPosition = CGPoint(x: cellWidth * 3 - cellWidth / 2 , y: cellWidth * 1 - cellWidth / 2)
                            blackKnightGPosition = CGPoint(x: cellWidth * 2 - cellWidth / 2 , y: cellWidth * 1 - cellWidth / 2)
                            blackRookHPosition = CGPoint(x: cellWidth * 1 - cellWidth / 2 , y: cellWidth * 1 - cellWidth / 2)
                            
                            boardHeight = geometry.size.width
                            
                            
                        }

                }

                .border(.blue)
           
                        

                    
                VStack {
                    Text("cellWidth: \(cellWidth)")
                    Text("boardHeight: \(boardHeight)")
                    Text("Last move: \(lastMove)")
                    Text("x: \(whiteQueenPosition.x) y: \(whiteQueenPosition.y)")

                }
            

                Group {
                    Image("whitePawn")
                        .resizable()
                        .frame(width: cellWidth, height: cellWidth)
                        .position(whitePawnAPosition)
                        .gesture(
                            DragGesture()
                                .onChanged { value in
                                    whitePawnAPosition = value.location
                                }
                                .onEnded {_ in
                                    whitePawnAPosition = identifyCell(piecePosition: whitePawnAPosition)
                                }
                        )
                    
                    Image("whitePawn")
                        .resizable()
                        .frame(width: cellWidth, height: cellWidth)
                        .position(whitePawnBPosition)
                        .gesture(
                            DragGesture()
                                .onChanged { value in
                                    whitePawnBPosition = value.location
                                }
                                .onEnded {_ in
                                    whitePawnBPosition = identifyCell(piecePosition: whitePawnBPosition)
                                }
                        )
                    
                    Image("whitePawn")
                        .resizable()
                        .frame(width: cellWidth, height: cellWidth)
                        .position(whitePawnCPosition)
                        .gesture(
                            DragGesture()
                                .onChanged { value in
                                    whitePawnCPosition = value.location
                                }
                                .onEnded {_ in
                                    whitePawnCPosition = identifyCell(piecePosition: whitePawnCPosition)
                                }
                        )
                    
                    Image("whitePawn")
                        .resizable()
                        .frame(width: cellWidth, height: cellWidth)
                        .position(whitePawnDPosition)
                        .gesture(
                            DragGesture()
                                .onChanged { value in
                                    whitePawnDPosition = value.location
                                }
                                .onEnded {_ in
                                    whitePawnDPosition = identifyCell(piecePosition: whitePawnDPosition)
                                }
                        )
                    
                    Image("whitePawn")
                        .resizable()
                        .frame(width: cellWidth, height: cellWidth)
                        .position(whitePawnEPosition)
                        .gesture(
                            DragGesture()
                                .onChanged { value in
                                    whitePawnEPosition = value.location
                                }
                                .onEnded {_ in
                                    whitePawnEPosition = identifyCell(piecePosition: whitePawnEPosition)
                                }
                        )
                    
                    Image("whitePawn")
                        .resizable()
                        .frame(width: cellWidth, height: cellWidth)
                        .position(whitePawnFPosition)
                        .gesture(
                            DragGesture()
                                .onChanged { value in
                                    whitePawnFPosition = value.location
                                }
                                .onEnded {_ in
                                    whitePawnFPosition = identifyCell(piecePosition: whitePawnFPosition)
                                }
                        )
                    
                    Image("whitePawn")
                        .resizable()
                        .frame(width: cellWidth, height: cellWidth)
                        .position(whitePawnGPosition)
                        .gesture(
                            DragGesture()
                                .onChanged { value in
                                    whitePawnGPosition = value.location
                                }
                                .onEnded {_ in
                                    whitePawnGPosition = identifyCell(piecePosition: whitePawnGPosition)
                                }
                        )
                    
                    Image("whitePawn")
                        .resizable()
                        .frame(width: cellWidth, height: cellWidth)
                        .position(whitePawnHPosition)
                        .gesture(
                            DragGesture()
                                .onChanged { value in
                                    whitePawnHPosition = value.location
                                }
                                .onEnded {_ in
                                    whitePawnHPosition = identifyCell(piecePosition: whitePawnHPosition)
                                }
                        )
                }
            
                Group {
                    
                    Image("whiteRook")
                        .resizable()
                        .frame(width: cellWidth, height: cellWidth)
                        .position(whiteRookAPosition)
                        .gesture(
                            DragGesture()
                                .onChanged { value in
                                    whiteRookAPosition = value.location
                                }
                                .onEnded {_ in
                                    whiteRookAPosition = identifyCell(piecePosition: whiteRookAPosition)
                                }
                        )

                    
                    Image("whiteKnight")
                        .resizable()
                        .frame(width: cellWidth, height: cellWidth)
                        .position(whiteKnightGPosition)
                        .gesture(
                            DragGesture()
                                .onChanged { value in
                                    whiteKnightGPosition = value.location
                                }
                                .onEnded {_ in
                                    whiteKnightGPosition = identifyCell(piecePosition: whiteKnightGPosition)
                                }
                        )
                    
                    Image("whiteBishop")
                        .resizable()
                        .frame(width: cellWidth, height: cellWidth)
                        .position(whiteBishopCPosition)
                        .gesture(
                            DragGesture()
                                .onChanged { value in
                                    whiteBishopCPosition = value.location
                                }
                                .onEnded {_ in
                                    whiteBishopCPosition = identifyCell(piecePosition: whiteBishopCPosition)
                                }
                        )

                    
                    Image("whiteQueen")
                        .resizable()
                        .frame(width: cellWidth, height: cellWidth)
                        .position(whiteQueenPosition)
                        .gesture(
                            DragGesture()
                                .onChanged { value in
                                    whiteQueenPosition = value.location
                                }
                                .onEnded {_ in
                                    whiteQueenPosition = identifyCell(piecePosition: whiteQueenPosition)
                                }
                        )
                    
                    Image("whiteKing")
                        .resizable()
                        .frame(width: cellWidth, height: cellWidth)
                        .position(whiteKingPosition)
                        .gesture(
                            DragGesture()
                                .onChanged { value in
                                    whiteKingPosition = value.location
                                }
                                .onEnded {_ in
                                    whiteKingPosition = identifyCell(piecePosition: whiteKingPosition)
                                }
                        )
                    
                    Image("whiteBishop")
                        .resizable()
                        .frame(width: cellWidth, height: cellWidth)
                        .position(whiteBishopFPosition)
                        .gesture(
                            DragGesture()
                                .onChanged { value in
                                    whiteBishopFPosition = value.location
                                }
                                .onEnded {_ in
                                    whiteBishopFPosition = identifyCell(piecePosition: whiteBishopFPosition)
                                }
                        )
                    
                    Image("whiteKnight")
                        .resizable()
                        .frame(width: cellWidth, height: cellWidth)
                        .position(whiteKnightBPosition)
                        .gesture(
                            DragGesture()
                                .onChanged { value in
                                    whiteKnightBPosition = value.location
                                }
                                .onEnded {_ in
                                    whiteKnightBPosition = identifyCell(piecePosition: whiteKnightBPosition)
                                }
                        )
                    
                    Image("whiteRook")
                        .resizable()
                        .frame(width: cellWidth, height: cellWidth)
                        .position(whiteRookHPosition)
                        .gesture(
                            DragGesture()
                                .onChanged { value in
                                    whiteRookHPosition = value.location
                                }
                                .onEnded {_ in
                                    whiteRookHPosition = identifyCell(piecePosition: whiteRookHPosition)
                                }
                        )

                }
            
            // MARK: Black section
                Group {
                    Image("blackPawn")
                        .resizable()
                        .frame(width: cellWidth, height: cellWidth)
                        .position(blackPawnAPosition)
                        .gesture(
                            DragGesture()
                                .onChanged { value in
                                    blackPawnAPosition = value.location
                                }
                                .onEnded {_ in
                                    blackPawnAPosition = identifyCell(piecePosition: blackPawnAPosition)
                                }
                        )
                    
                    Image("blackPawn")
                        .resizable()
                        .frame(width: cellWidth, height: cellWidth)
                        .position(blackPawnBPosition)
                        .gesture(
                            DragGesture()
                                .onChanged { value in
                                    blackPawnBPosition = value.location
                                }
                                .onEnded {_ in
                                    blackPawnBPosition = identifyCell(piecePosition: blackPawnBPosition)
                                }
                        )
                    
                    Image("blackPawn")
                        .resizable()
                        .frame(width: cellWidth, height: cellWidth)
                        .position(blackPawnCPosition)
                        .gesture(
                            DragGesture()
                                .onChanged { value in
                                    blackPawnCPosition = value.location
                                }
                                .onEnded {_ in
                                    blackPawnCPosition = identifyCell(piecePosition: blackPawnCPosition)
                                }
                        )
                    
                    Image("blackPawn")
                        .resizable()
                        .frame(width: cellWidth, height: cellWidth)
                        .position(blackPawnDPosition)
                        .gesture(
                            DragGesture()
                                .onChanged { value in
                                    blackPawnDPosition = value.location
                                }
                                .onEnded {_ in
                                    blackPawnDPosition = identifyCell(piecePosition: blackPawnDPosition)
                                }
                        )
                    
                    Image("blackPawn")
                        .resizable()
                        .frame(width: cellWidth, height: cellWidth)
                        .position(blackPawnEPosition)
                        .gesture(
                            DragGesture()
                                .onChanged { value in
                                    blackPawnEPosition = value.location
                                }
                                .onEnded {_ in
                                    blackPawnEPosition = identifyCell(piecePosition: blackPawnEPosition)
                                }
                        )
                    
                    Image("blackPawn")
                        .resizable()
                        .frame(width: cellWidth, height: cellWidth)
                        .position(blackPawnFPosition)
                        .gesture(
                            DragGesture()
                                .onChanged { value in
                                    blackPawnFPosition = value.location
                                }
                                .onEnded {_ in
                                    blackPawnFPosition = identifyCell(piecePosition: blackPawnFPosition)
                                }
                        )
                    
                    Image("blackPawn")
                        .resizable()
                        .frame(width: cellWidth, height: cellWidth)
                        .position(blackPawnGPosition)
                        .gesture(
                            DragGesture()
                                .onChanged { value in
                                    blackPawnGPosition = value.location
                                }
                                .onEnded {_ in
                                    blackPawnGPosition = identifyCell(piecePosition: blackPawnGPosition)
                                }
                        )
                    
                    Image("blackPawn")
                        .resizable()
                        .frame(width: cellWidth, height: cellWidth)
                        .position(blackPawnHPosition)
                        .gesture(
                            DragGesture()
                                .onChanged { value in
                                    blackPawnHPosition = value.location
                                }
                                .onEnded {_ in
                                    blackPawnHPosition = identifyCell(piecePosition: blackPawnHPosition)
                                }
                        )
                }
            
                Group {
                    
                    Image("blackRook")
                        .resizable()
                        .frame(width: cellWidth, height: cellWidth)
                        .position(blackRookAPosition)
                        .gesture(
                            DragGesture()
                                .onChanged { value in
                                    blackRookAPosition = value.location
                                }
                                .onEnded {_ in
                                    blackRookAPosition = identifyCell(piecePosition: blackRookAPosition)
                                }
                        )

                    
                    Image("blackKnight")
                        .resizable()
                        .frame(width: cellWidth, height: cellWidth)
                        .position(blackKnightGPosition)
                        .gesture(
                            DragGesture()
                                .onChanged { value in
                                    blackKnightGPosition = value.location
                                }
                                .onEnded {_ in
                                    blackKnightGPosition = identifyCell(piecePosition: blackKnightGPosition)
                                }
                        )
                    
                    Image("blackBishop")
                        .resizable()
                        .frame(width: cellWidth, height: cellWidth)
                        .position(blackBishopCPosition)
                        .gesture(
                            DragGesture()
                                .onChanged { value in
                                    blackBishopCPosition = value.location
                                }
                                .onEnded {_ in
                                    blackBishopCPosition = identifyCell(piecePosition: blackBishopCPosition)
                                }
                        )

                    
                    Image("blackQueen")
                        .resizable()
                        .frame(width: cellWidth, height: cellWidth)
                        .position(blackQueenPosition)
                        .gesture(
                            DragGesture()
                                .onChanged { value in
                                    blackQueenPosition = value.location
                                }
                                .onEnded {_ in
                                    blackQueenPosition = identifyCell(piecePosition: blackQueenPosition)
                                }
                        )
                    
                    Image("blackKing")
                        .resizable()
                        .frame(width: cellWidth, height: cellWidth)
                        .position(blackKingPosition)
                        .gesture(
                            DragGesture()
                                .onChanged { value in
                                    blackKingPosition = value.location
                                }
                                .onEnded {_ in
                                    blackKingPosition = identifyCell(piecePosition: blackKingPosition)
                                }
                        )
                    
                    Image("blackBishop")
                        .resizable()
                        .frame(width: cellWidth, height: cellWidth)
                        .position(blackBishopFPosition)
                        .gesture(
                            DragGesture()
                                .onChanged { value in
                                    blackBishopFPosition = value.location
                                }
                                .onEnded {_ in
                                    blackBishopFPosition = identifyCell(piecePosition: blackBishopFPosition)
                                }
                        )
                    
                    Image("blackKnight")
                        .resizable()
                        .frame(width: cellWidth, height: cellWidth)
                        .position(blackKnightBPosition)
                        .gesture(
                            DragGesture()
                                .onChanged { value in
                                    blackKnightBPosition = value.location
                                }
                                .onEnded {_ in
                                    blackKnightBPosition = identifyCell(piecePosition: blackKnightBPosition)
                                }
                        )
                    
                    Image("blackRook")
                        .resizable()
                        .frame(width: cellWidth, height: cellWidth)
                        .position(blackRookHPosition)
                        .gesture(
                            DragGesture()
                                .onChanged { value in
                                    blackRookHPosition = value.location
                                }
                                .onEnded {_ in
                                    blackRookHPosition = identifyCell(piecePosition: blackRookHPosition)
                                }
                        )
                }
            }
    }
    
    //Not using at the moment
    func getChessBoardYStartPoint() -> CGFloat {
        let f = UIScreen.main.bounds.height
        let c = boardHeight
        let x = (f - c) / 2
        print(x)
        return x
    }
    
    
    func identifyCell(piecePosition: CGPoint) -> CGPoint {
        let cellY = 8 - (Int(piecePosition.y / cellWidth))
        let cellX = 1 + (Int(piecePosition.x / cellWidth))
        
        let cellWidthDouble: Double = Double(cellWidth)
        
        switch cellX {
        case 1:
            lastMove = "A\(cellY)"
        case 2:
            lastMove = "B\(cellY)"
        case 3:
            lastMove = "C\(cellY)"
        case 4:
            lastMove = "D\(cellY)"
        case 5:
            lastMove = "E\(cellY)"
        case 6:
            lastMove = "F\(cellY)"
        case 7:
            lastMove = "G\(cellY)"
        case 8:
            lastMove = "H\(cellY)"
            default:
                print("Not in the board")
        }
        
        return CGPoint(x: Double(cellX) * cellWidthDouble - cellWidthDouble / 2, y: (8 - Double(cellY)) * cellWidthDouble + cellWidthDouble / 2) //This value is meant to replace the piece in the center of the cell
    }
    
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


struct BoardView_Previews: PreviewProvider {
    static var previews: some View {
        HomeChessBoardView()
    }
}
