//
//  SandBoxView.swift
//  ChessBook
//
//  Created by Laurent Klein on 12/02/2022.
//

import SwiftUI

struct SandBoxView: View {
    
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
        
        var pieceDestinationCentered = centerPiece(piecePosition: pieceDestination)
        print("------------")
        //Code to fix, this should delete the piece if taked
        for (name, position) in pieces {
            if pieceDestinationCentered == position {
                pieces[name] = CGPoint(x: 0, y: 0)
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
            Color.clear //(Color.clear expands to fill all available space, so this forces your ZStack to be as large as the enclosing view without needing to add a .frame().)
            ChessBoard(rows: 8, columns: 8)
                .fill(Color.blue)
                .frame(
                    minWidth: 0, maxWidth: .infinity, minHeight: 0
                )
                .aspectRatio(contentMode: .fit)
                
                .onAppear {
                    cellWidth = UIScreen.main.bounds.width / 8
                    pieces["whitePawn1"] = CGPoint(x: cellWidth * 1 - cellWidth / 2 , y: cellWidth * 7 - cellWidth / 2)
                    pieces["whitePawn2"] = CGPoint(x: cellWidth * 2 - cellWidth / 2 , y: cellWidth * 7 - cellWidth / 2)
                }

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
        }
        
       
    }
    
    
}

struct SandBoxView_Previews: PreviewProvider {
    static var previews: some View {
        SandBoxView()
    }
}
