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
    @IBOutlet weak var livesLabel: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var wordLabel: UILabel!
    @IBOutlet weak var mainActionButton: UIButton!
    @IBOutlet weak var playAgainButton: UIButton!
    @IBOutlet weak var progressView: UIProgressView!
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        updateUI()
    }
    
    func updateUI() {
        if game.gameOver {
            if game.lives > 0 {
                wordLabel.text = "Completed!"
                wordLabel.textColor = UIColor.green
                livesLabel.isHidden = true
                imageView.isHidden = false
            } else {
                wordLabel.text = game.word
                imageView.isHidden = true
                wordLabel.textColor = UIColor.red
                livesLabel.isHidden = true
            }
            mainActionButton.isHidden = true
            playAgainButton.isHidden = false
            livesLabel.isHidden = true
        } else {
            mainActionButton.isHidden = false
            playAgainButton.isHidden = true
            livesLabel.isHidden = false
            imageView.isHidden = true
            wordLabel.textColor = nil
            if game.guessed {
                wordLabel.textColor = UIColor.green
                mainActionButton.setTitle("Next Word", for: .normal)
            } else {
                wordLabel.textColor = nil
                mainActionButton.setTitle("Guess A Letter", for: .normal)
            }
            // create wordLabel
            var letters = [String]()
            
            for letter in game.formattedWord {
                letters.append(String(letter))
            }
            
            let wordWithSpacing = letters.joined(separator: " ")
            wordLabel.text = wordWithSpacing
        }
        livesLabel.text = "Lives: \(game.lives)"
        progressView.isHidden = false
        let progress = Float(game.usedWords.count) / Float(game.totalRounds)
        progressView.setProgress(progress, animated: true)
    }
    
    
    // MARK: - Actions:
    @IBAction func mainAction(_ sender: Any) {
        if game.guessed {
            game.nextWord()
            updateUI()
        } else {
            performSegue(withIdentifier: "guessSegue", sender: nil)
        }
    }
    
    @IBAction func playAgain(_ sender: Any) {
        game.gameOver = false
        game.lives = 8
        game.usedWords = []
        game.nextWord()
        updateUI()
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
        if segue.identifier == "guessSegue" {
            let navigationVC = segue.destination as? NavigationViewController
            let guessVC = navigationVC?.viewControllers.first as? GuessViewController
            guessVC?.lettersToDisable = game.guessedLetters
        }
        
    }

}

