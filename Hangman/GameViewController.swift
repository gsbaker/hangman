//
//  ViewController.swift
//  Hangman
//
//  Created by George Baker on 15/05/2020.
//  Copyright © 2020 gsbaker. All rights reserved.
//

import UIKit

class GameViewController: UIViewController {
    
    var game = Hangman()
    var guess: Character!
    var won = false
    
    // MARK: - Outlets
    @IBOutlet weak var wordLabel: UILabel!
    @IBOutlet weak var guessButton: UIButton!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        updateUI()
    }
    
    func updateUI() {
        if game.gameOver {
            wordLabel.text = "No More Words. Game Finished"
        } else {
            if game.guessed {
                game.nextWord()
            }
            // create wordLabel
            var letters = [String]()
            
            for letter in game.formattedWord {
                letters.append(String(letter))
            }
            
            let wordWithSpacing = letters.joined(separator: " ")
            wordLabel.text = wordWithSpacing
        }
    }
    
    
    
    // MARK: - Navigation:
    @IBAction func unwindToGameViewController(_ sender: UIStoryboardSegue) {
        // pass back information to GameViewController
        // remember to use optionals because of cancel button
        
        if sender.source is GuessViewController {
            if let senderVC = sender.source as? GuessViewController {
                if let letterChosen = senderVC.letterPressed {
                    guess = letterChosen
                    game.makeGuess(val: guess)
                    updateUI()
                }
            }
        }
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "gameToNavigation" {
            let navigationVC = segue.destination as? NavigationViewController
            let guessVC = navigationVC?.viewControllers.first as? GuessViewController
            guessVC?.lettersToDisable = game.guessedLetters
        }
        
    }

}

