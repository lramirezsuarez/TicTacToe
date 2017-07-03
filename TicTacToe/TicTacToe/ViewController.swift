//
//  ViewController.swift
//  TicTacToe
//
//  Created by Luis Ramirez on 6/22/17.
//  Copyright © 2017 Lucho. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    //1. is Nought, 2. is crosses.
    var activePlayer = 1
    
    var gameState = [0, 0, 0, 0, 0, 0, 0, 0, 0] // 0. Empty, 1. Nought, 2. Cross
    
    let winningCombination = [[0,1,2], [3,4,5], [6,7,8], [0,3,6], [1,4,5], [2,5,8], [0,4,8], [2,4,6]]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    
    
    @IBAction func buttonPressed(_ sender: AnyObject) {
        let activePosition = sender.tag - 1
        
        if (gameState[activePosition] == 0) {
            gameState[activePosition] = activePlayer
            if (activePlayer == 1) {
                sender.setImage(UIImage(named: "nought"), for: [])
                activePlayer = 2
            } else {
                sender.setImage(UIImage(named: "cross"), for: [])
                activePlayer = 1
            }
            
            checkWinner(gameState: gameState)
            
        }
        
    }
    
    func checkWinner(gameState: Array<Int>) {
        for combination in winningCombination {
            if (gameState[combination[0]] != 0 && gameState[combination[0]] == gameState[combination[1]] && gameState[combination[1]] == gameState[combination[2]]) {
                // We have a winner.
                var message = ""
                if (gameState[combination[0]] == 1) {
                    message = "Nought has won"
                } else {
                    message = "Cross has won"
                }
                let alert = UIAlertController(title: "Winner!", message: message, preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "Play Again", style: .default, handler : { (alert: UIAlertAction) in
                    self.reset()
                    return
                }))
                self.present(alert, animated: true, completion: nil)
                break
            }
        }
    }
    
    func reset() {
        self.gameState = [0,0,0,0,0,0,0,0,0]
        self.activePlayer = 1
        
        for i in 1..<10 {
            if let button = view.viewWithTag(i) as? UIButton {
                button.setImage(nil, for: [])
            }
        }
        
    }
    
}

