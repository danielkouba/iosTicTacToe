//
//  ViewController.swift
//  TicTacToe
//
//  Created by Daniel Kouba on 12/1/16.
//  Copyright © 2016 Daniel Kouba. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var gameButtonCollection: [UIButton]!
    
    @IBOutlet weak var winnerOutputLabel: UILabel!
    @IBAction func handleResetButtonClick(_ sender: Any) {
        
        for button in gameButtonCollection{
            button.backgroundColor = UIColor(colorLiteralRed: 221/255, green: 147/255, blue: 224/255, alpha: 1)
            button.isEnabled = true
        }
        
        
        
        currentGame = Game()
        
        
    }
    

    
    
    
    class Game {
        var turn: Int
        var gameBoard: [Int]
        var winner: String?
        var turnCount: Int
        init (){
            gameBoard = [0,0,0,0,0,0,0,0,0]
            turn = 1
            turnCount = 0
        }
        
        func check() {
            
            let d0 = [gameBoard[0],gameBoard[4],gameBoard[8]]
            let d1 = [gameBoard[2],gameBoard[4],gameBoard[6]]
            let h0 = [gameBoard[0],gameBoard[1],gameBoard[2]]
            let h1 = [gameBoard[3],gameBoard[4],gameBoard[5]]
            let h2 = [gameBoard[6],gameBoard[7],gameBoard[8]]
            let v0 = [gameBoard[0],gameBoard[3],gameBoard[6]]
            let v1 = [gameBoard[1],gameBoard[4],gameBoard[7]]
            let v2 = [gameBoard[2],gameBoard[5],gameBoard[8]]
            
            let winningPossibilities = [d0,d1,h0,h1,h2,v0,v1,v2]
            print("This is a new turn")
            print("\(h0)\n\(h1)\n\(h2)")
            for winPos in winningPossibilities{
                if winPos.reduce(0,+) == 3{
                    winner = "Red"
                } else if winPos.reduce(0,+) == -3{
                    winner = "Blue"
                }
            }

            print(self.winner)
            
            if !self.gameBoard.contains(0) && self.winner == nil{
                winner = "cat"
            }
        }
        
        func turnAction(idx: Int) -> Void {
            gameBoard[idx] = turn
            self.check()
        }
        
        func nextTurn(){
            turnCount += 1
            self.turn *= -1
        }
    }
    
    
    
    var currentGame = Game()
    
    
    @IBAction func handleBoardButtonClick(_ sender: UIButton) {
            
            var redOrBlue: String
            
            
            redOrBlue = currentGame.turn == -1 ? "Red" : "Blue"
            
            
            winnerOutputLabel.text = "\(redOrBlue) Player's Turn, round \(currentGame.turnCount)"
            if currentGame.turn == 1 {
                sender.backgroundColor = UIColor.red
            } else if currentGame.turn == -1 {
                sender.backgroundColor = UIColor.blue
            }
            sender.isEnabled = false
            //Submit Player's move to
            currentGame.turnAction(idx: sender.tag)
            currentGame.nextTurn()
        
//        currentGame.check()
        if currentGame.winner != nil {
            winnerOutputLabel.text = "Winner: \(currentGame.winner!)"
            for button in gameButtonCollection{
                button.isEnabled = false
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }


}

