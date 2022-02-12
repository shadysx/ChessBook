//
//  SandBoxView.swift
//  ChessBook
//
//  Created by Laurent Klein on 12/02/2022.
//

import SwiftUI

struct HomeChessBoardView: View {
    
    @State var cellWidth: Double = 0
    @State var lastMove = ".."
    
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
        "whiteKnight1": .zero,
        "whiteBishop1": .zero,
        "whiteQueen": .zero,
        "whiteKing": .zero,
        "whiteBishop2": .zero,
        "whiteKnight2": .zero,
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
        "blackKnight1": .zero,
        "blackBishop1": .zero,
        "blackQueen": .zero,
        "blackKing": .zero,
        "blackBishop2": .zero,
        "blackKnight2": .zero,
        "blackRook2": .zero,
    ]
    
    func centerPiece(piecePosition: CGPoint) -> CGPoint{
        let cellY = 8 - Double(Int(piecePosition.y / cellWidth))
        let cellX = 1 + Double(Int(piecePosition.x / cellWidth))
        
        return CGPoint( //This value is meant to replace the piece in the center of the cell
            x: cellX * cellWidth - cellWidth / 2, y: (8 - cellY) * cellWidth + cellWidth / 2)
        
        
    }
    
    func movePiece(pieceDestination: CGPoint) -> CGPoint {
        
        let pieceDestinationCentered = centerPiece(piecePosition: pieceDestination)
        print("------------")
        //Code to fix, this should delete the piece if taked
        for (name, position) in pieces {
            if pieceDestinationCentered == position {
                pieces[name] = CGPoint(x: 667, y: 667)
            }
        }
        
        return pieceDestinationCentered
    }
    
    func identifyCell(piecePosition: CGPoint) -> String {
        let cellY = 8 - (Int(piecePosition.y / cellWidth))
        let cellX = 1 + (Int(piecePosition.x / cellWidth))
        var retVal: String = "Not found"
        
        switch cellX {
        case 1:
            retVal = "A\(cellY)"
        case 2:
            retVal = "B\(cellY)"
        case 3:
            retVal = "C\(cellY)"
        case 4:
            retVal = "D\(cellY)"
        case 5:
            retVal = "E\(cellY)"
        case 6:
            retVal = "F\(cellY)"
        case 7:
            retVal = "G\(cellY)"
        case 8:
            retVal = "H\(cellY)"
            default:
                print("Not in the board")
        }
        
        return retVal
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

    
    var body: some View {
        ZStack(alignment: .top){
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
                    pieces["whiteKnight1"] = CGPoint(x: cellWidth * 2 - cellWidth / 2 , y: cellWidth * 8 - cellWidth / 2)
                    pieces["whiteBishop1"] = CGPoint(x: cellWidth * 3 - cellWidth / 2 , y: cellWidth * 8 - cellWidth / 2)
                    pieces["whiteQueen"] = CGPoint(x: cellWidth * 4 - cellWidth / 2 , y: cellWidth * 8 - cellWidth / 2)
                    pieces["whiteKing"] = CGPoint(x: cellWidth * 5 - cellWidth / 2 , y: cellWidth * 8 - cellWidth / 2)
                    pieces["whiteBishop2"] = CGPoint(x: cellWidth * 6 - cellWidth / 2 , y: cellWidth * 8 - cellWidth / 2)
                    pieces["whiteKnight2"] = CGPoint(x: cellWidth * 7 - cellWidth / 2 , y: cellWidth * 8 - cellWidth / 2)
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
                    pieces["blackKnight1"] = CGPoint(x: cellWidth * 7 - cellWidth / 2 , y: cellWidth * 1 - cellWidth / 2)
                    pieces["blackBishop1"] = CGPoint(x: cellWidth * 6 - cellWidth / 2 , y: cellWidth * 1 - cellWidth / 2)
                    pieces["blackKing"] = CGPoint(x: cellWidth * 5 - cellWidth / 2 , y: cellWidth * 1 - cellWidth / 2)
                    pieces["blackQueen"] = CGPoint(x: cellWidth * 4 - cellWidth / 2 , y: cellWidth * 1 - cellWidth / 2)
                    pieces["blackBishop2"] = CGPoint(x: cellWidth * 3 - cellWidth / 2 , y: cellWidth * 1 - cellWidth / 2)
                    pieces["blackKnight2"] = CGPoint(x: cellWidth * 2 - cellWidth / 2 , y: cellWidth * 1 - cellWidth / 2)
                    pieces["blackRook2"] = CGPoint(x: cellWidth * 1 - cellWidth / 2 , y: cellWidth * 1 - cellWidth / 2)
                }

            Group {
                Group {
                    Image("whitePawn")
                        .resizable()
                        .frame(width: cellWidth, height: cellWidth)
                        .position(pieces["whitePawn1"]!)
                        .gesture(
                            DragGesture()
                                .onChanged { value in
                                    pieces["whitePawn1"]! = value.location
                                }
                                .onEnded {_ in
                                    pieces["whitePawn1"] = movePiece(pieceDestination: pieces["whitePawn1"]!)



                                }
                        )

                    Image("whitePawn")
                        .resizable()
                        .frame(width: cellWidth, height: cellWidth)
                        .position(pieces["whitePawn2"]!)
                        .gesture(
                            DragGesture()
                                .onChanged { value in
                                    pieces["whitePawn2"]! = value.location
                                }
                                .onEnded {_ in
                                    pieces["whitePawn2"] = movePiece(pieceDestination: pieces["whitePawn2"]!)
                                }
                        )
                    
                    Image("whitePawn")
                        .resizable()
                        .frame(width: cellWidth, height: cellWidth)
                        .position(pieces["whitePawn3"]!)
                        .gesture(
                            DragGesture()
                                .onChanged { value in
                                    pieces["whitePawn3"]! = value.location
                                }
                                .onEnded {_ in
                                    pieces["whitePawn3"] = movePiece(pieceDestination: pieces["whitePawn3"]!)



                                }
                        )

                    Image("whitePawn")
                        .resizable()
                        .frame(width: cellWidth, height: cellWidth)
                        .position(pieces["whitePawn4"]!)
                        .gesture(
                            DragGesture()
                                .onChanged { value in
                                    pieces["whitePawn4"]! = value.location
                                }
                                .onEnded {_ in
                                    pieces["whitePawn4"] = movePiece(pieceDestination: pieces["whitePawn4"]!)
                                }
                        )
                    
                    Image("whitePawn")
                        .resizable()
                        .frame(width: cellWidth, height: cellWidth)
                        .position(pieces["whitePawn5"]!)
                        .gesture(
                            DragGesture()
                                .onChanged { value in
                                    pieces["whitePawn5"]! = value.location
                                }
                                .onEnded {_ in
                                    pieces["whitePawn5"] = movePiece(pieceDestination: pieces["whitePawn5"]!)



                                }
                        )

                    Image("whitePawn")
                        .resizable()
                        .frame(width: cellWidth, height: cellWidth)
                        .position(pieces["whitePawn6"]!)
                        .gesture(
                            DragGesture()
                                .onChanged { value in
                                    pieces["whitePawn6"]! = value.location
                                }
                                .onEnded {_ in
                                    pieces["whitePawn6"] = movePiece(pieceDestination: pieces["whitePawn6"]!)
                                }
                        )
                    
                    Image("whitePawn")
                        .resizable()
                        .frame(width: cellWidth, height: cellWidth)
                        .position(pieces["whitePawn7"]!)
                        .gesture(
                            DragGesture()
                                .onChanged { value in
                                    pieces["whitePawn7"]! = value.location
                                }
                                .onEnded {_ in
                                    pieces["whitePawn7"] = movePiece(pieceDestination: pieces["whitePawn7"]!)



                                }
                        )

                    Image("whitePawn")
                        .resizable()
                        .frame(width: cellWidth, height: cellWidth)
                        .position(pieces["whitePawn8"]!)
                        .gesture(
                            DragGesture()
                                .onChanged { value in
                                    pieces["whitePawn8"]! = value.location
                                }
                                .onEnded {_ in
                                    pieces["whitePawn8"] = movePiece(pieceDestination: pieces["whitePawn8"]!)
                                }
                        )
                }
                
                
                Group {
                    Image("whiteRook")
                        .resizable()
                        .frame(width: cellWidth, height: cellWidth)
                        .position(pieces["whiteRook1"]!)
                        .gesture(
                            DragGesture()
                                .onChanged { value in
                                    pieces["whiteRook1"]! = value.location
                                }
                                .onEnded {_ in
                                    pieces["whiteRook1"] = movePiece(pieceDestination: pieces["whiteRook1"]!)



                                }
                        )

                    Image("whiteKnight")
                        .resizable()
                        .frame(width: cellWidth, height: cellWidth)
                        .position(pieces["whiteKnight1"]!)
                        .gesture(
                            DragGesture()
                                .onChanged { value in
                                    pieces["whiteKnight1"]! = value.location
                                }
                                .onEnded {_ in
                                    pieces["whiteKnight1"] = movePiece(pieceDestination: pieces["whiteKnight1"]!)
                                }
                        )
                    
                    Image("whiteBishop")
                        .resizable()
                        .frame(width: cellWidth, height: cellWidth)
                        .position(pieces["whiteBishop1"]!)
                        .gesture(
                            DragGesture()
                                .onChanged { value in
                                    pieces["whiteBishop1"]! = value.location
                                }
                                .onEnded {_ in
                                    pieces["whiteBishop1"] = movePiece(pieceDestination: pieces["whiteBishop1"]!)



                                }
                        )

                    Image("whiteQueen")
                        .resizable()
                        .frame(width: cellWidth, height: cellWidth)
                        .position(pieces["whiteQueen"]!)
                        .gesture(
                            DragGesture()
                                .onChanged { value in
                                    pieces["whiteQueen"]! = value.location
                                }
                                .onEnded {_ in
                                    pieces["whiteQueen"] = movePiece(pieceDestination: pieces["whiteQueen"]!)
                                }
                        )
                    
                    Image("whiteKing")
                        .resizable()
                        .frame(width: cellWidth, height: cellWidth)
                        .position(pieces["whiteKing"]!)
                        .gesture(
                            DragGesture()
                                .onChanged { value in
                                    pieces["whiteKing"]! = value.location
                                }
                                .onEnded {_ in
                                    pieces["whiteKing"] = movePiece(pieceDestination: pieces["whiteKing"]!)



                                }
                        )

                    Image("whiteBishop")
                        .resizable()
                        .frame(width: cellWidth, height: cellWidth)
                        .position(pieces["whiteBishop2"]!)
                        .gesture(
                            DragGesture()
                                .onChanged { value in
                                    pieces["whiteBishop2"]! = value.location
                                }
                                .onEnded {_ in
                                    pieces["whiteBishop2"] = movePiece(pieceDestination: pieces["whiteBishop2"]!)
                                }
                        )
                    
                    Image("whiteKnight")
                        .resizable()
                        .frame(width: cellWidth, height: cellWidth)
                        .position(pieces["whiteKnight2"]!)
                        .gesture(
                            DragGesture()
                                .onChanged { value in
                                    pieces["whiteKnight2"]! = value.location
                                }
                                .onEnded {_ in
                                    pieces["whiteKnight2"] = movePiece(pieceDestination: pieces["whiteKnight2"]!)



                                }
                        )

                    Image("whiteRook")
                        .resizable()
                        .frame(width: cellWidth, height: cellWidth)
                        .position(pieces["whiteRook2"]!)
                        .gesture(
                            DragGesture()
                                .onChanged { value in
                                    pieces["whiteRook2"]! = value.location
                                }
                                .onEnded {_ in
                                    pieces["whiteRook2"] = movePiece(pieceDestination: pieces["whiteRook2"]!)
                                }
                        )
                }
                
               
                
                
                Group {
                    Image("blackPawn")
                        .resizable()
                        .frame(width: cellWidth, height: cellWidth)
                        .position(pieces["blackPawn1"]!)
                        .gesture(
                            DragGesture()
                                .onChanged { value in
                                    pieces["blackPawn1"]! = value.location
                                }
                                .onEnded {_ in
                                    pieces["blackPawn1"]! = movePiece(pieceDestination: pieces["blackPawn1"]!)
                                }
                        )
                    
                    Image("blackPawn")
                        .resizable()
                        .frame(width: cellWidth, height: cellWidth)
                        .position(pieces["blackPawn2"]!)
                        .gesture(
                            DragGesture()
                                .onChanged { value in
                                    pieces["blackPawn2"]! = value.location
                                }
                                .onEnded {_ in
                                    pieces["blackPawn2"]! = movePiece(pieceDestination: pieces["blackPawn2"]!)
                                }
                        )
                    
                    Image("blackPawn")
                        .resizable()
                        .frame(width: cellWidth, height: cellWidth)
                        .position(pieces["blackPawn3"]!)
                        .gesture(
                            DragGesture()
                                .onChanged { value in
                                    pieces["blackPawn3"]! = value.location
                                }
                                .onEnded {_ in
                                    pieces["blackPawn3"]! = movePiece(pieceDestination: pieces["blackPawn3"]!)
                                }
                        )
                    
                    Image("blackPawn")
                        .resizable()
                        .frame(width: cellWidth, height: cellWidth)
                        .position(pieces["blackPawn4"]!)
                        .gesture(
                            DragGesture()
                                .onChanged { value in
                                    pieces["blackPawn4"]! = value.location
                                }
                                .onEnded {_ in
                                    pieces["blackPawn4"]! = movePiece(pieceDestination: pieces["blackPawn4"]!)
                                }
                        )
                    
                    Image("blackPawn")
                        .resizable()
                        .frame(width: cellWidth, height: cellWidth)
                        .position(pieces["blackPawn5"]!)
                        .gesture(
                            DragGesture()
                                .onChanged { value in
                                    pieces["blackPawn5"]! = value.location
                                }
                                .onEnded {_ in
                                    pieces["blackPawn5"]! = movePiece(pieceDestination: pieces["blackPawn5"]!)
                                }
                        )
                    
                    Image("blackPawn")
                        .resizable()
                        .frame(width: cellWidth, height: cellWidth)
                        .position(pieces["blackPawn6"]!)
                        .gesture(
                            DragGesture()
                                .onChanged { value in
                                    pieces["blackPawn6"]! = value.location
                                }
                                .onEnded {_ in
                                    pieces["blackPawn6"]! = movePiece(pieceDestination: pieces["blackPawn6"]!)
                                }
                        )
                    
                    Image("blackPawn")
                        .resizable()
                        .frame(width: cellWidth, height: cellWidth)
                        .position(pieces["blackPawn7"]!)
                        .gesture(
                            DragGesture()
                                .onChanged { value in
                                    pieces["blackPawn7"]! = value.location
                                }
                                .onEnded {_ in
                                    pieces["blackPawn7"]! = movePiece(pieceDestination: pieces["blackPawn7"]!)
                                }
                        )
                    
                    Image("blackPawn")
                        .resizable()
                        .frame(width: cellWidth, height: cellWidth)
                        .position(pieces["blackPawn8"]!)
                        .gesture(
                            DragGesture()
                                .onChanged { value in
                                    pieces["blackPawn8"]! = value.location
                                }
                                .onEnded {_ in
                                    pieces["blackPawn8"]! = movePiece(pieceDestination: pieces["blackPawn8"]!)
                                }
                        )
                }
                
                Group {
                    Image("blackRook")
                        .resizable()
                        .frame(width: cellWidth, height: cellWidth)
                        .position(pieces["blackRook1"]!)
                        .gesture(
                            DragGesture()
                                .onChanged { value in
                                    pieces["blackRook1"]! = value.location
                                }
                                .onEnded {_ in
                                    pieces["blackRook1"] = movePiece(pieceDestination: pieces["blackRook1"]!)



                                }
                        )

                    Image("blackKnight")
                        .resizable()
                        .frame(width: cellWidth, height: cellWidth)
                        .position(pieces["blackKnight1"]!)
                        .gesture(
                            DragGesture()
                                .onChanged { value in
                                    pieces["blackKnight1"]! = value.location
                                }
                                .onEnded {_ in
                                    pieces["blackKnight1"] = movePiece(pieceDestination: pieces["blackKnight1"]!)
                                }
                        )
                    
                    Image("blackBishop")
                        .resizable()
                        .frame(width: cellWidth, height: cellWidth)
                        .position(pieces["blackBishop1"]!)
                        .gesture(
                            DragGesture()
                                .onChanged { value in
                                    pieces["blackBishop1"]! = value.location
                                }
                                .onEnded {_ in
                                    pieces["blackBishop1"] = movePiece(pieceDestination: pieces["blackBishop1"]!)



                                }
                        )

                    Image("blackQueen")
                        .resizable()
                        .frame(width: cellWidth, height: cellWidth)
                        .position(pieces["blackQueen"]!)
                        .gesture(
                            DragGesture()
                                .onChanged { value in
                                    pieces["blackQueen"]! = value.location
                                }
                                .onEnded {_ in
                                    pieces["blackQueen"] = movePiece(pieceDestination: pieces["blackQueen"]!)
                                }
                        )
                    
                    Image("blackKing")
                        .resizable()
                        .frame(width: cellWidth, height: cellWidth)
                        .position(pieces["blackKing"]!)
                        .gesture(
                            DragGesture()
                                .onChanged { value in
                                    pieces["blackKing"]! = value.location
                                }
                                .onEnded {_ in
                                    pieces["blackKing"] = movePiece(pieceDestination: pieces["blackKing"]!)



                                }
                        )

                    Image("blackBishop")
                        .resizable()
                        .frame(width: cellWidth, height: cellWidth)
                        .position(pieces["blackBishop2"]!)
                        .gesture(
                            DragGesture()
                                .onChanged { value in
                                    pieces["blackBishop2"]! = value.location
                                }
                                .onEnded {_ in
                                    pieces["blackBishop2"] = movePiece(pieceDestination: pieces["blackBishop2"]!)
                                }
                        )
                    
                    Image("blackKnight")
                        .resizable()
                        .frame(width: cellWidth, height: cellWidth)
                        .position(pieces["blackKnight2"]!)
                        .gesture(
                            DragGesture()
                                .onChanged { value in
                                    pieces["blackKnight2"]! = value.location
                                }
                                .onEnded {_ in
                                    pieces["blackKnight2"] = movePiece(pieceDestination: pieces["blackKnight2"]!)



                                }
                        )

                    Image("blackRook")
                        .resizable()
                        .frame(width: cellWidth, height: cellWidth)
                        .position(pieces["blackRook2"]!)
                        .gesture(
                            DragGesture()
                                .onChanged { value in
                                    pieces["blackRook2"]! = value.location
                                }
                                .onEnded {_ in
                                    pieces["blackRook2"] = movePiece(pieceDestination: pieces["blackRook2"]!)
                                }
                        )
                }
            }//Group parent
            .frame(width: cellWidth*8, height: cellWidth*8)
          
            
        }//.border(.red) //ZSTACK CLOSING HERE
        
       
    }
    
    
}
