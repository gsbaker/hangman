//
//  GuessViewController.swift
//  Hangman
//
//  Created by George Baker on 15/05/2020.
//  Copyright © 2020 gsbaker. All rights reserved.
//

import UIKit

class GuessViewController: UIViewController {
    
    var letterPressed: Character?
    var lettersToDisable: [Character]!
    
    // MARK: - Outlets
    @IBOutlet var letterButtons: [UIButton]!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        disableGuessedLetters(lettersToDisable)
    }
    
    
    func disableGuessedLetters(_ guessedLetters: [Character]) {
        if let buttons = letterButtons {
            print("Hello world")
            for button in buttons {
                let stringButton = button.title(for: .normal)!
                let characterButton = Character(stringButton.lowercased())
                if guessedLetters.contains(characterButton) {
                    button.isEnabled = false
                }
            }
        } else {
            print("Getting to else")
        }
        
        
    }
    
    // MARK: - Actions
    @IBAction func letterButtonPressed(_ sender: UIButton) {
        sender.isEnabled = false // disable the button so the same letter can't be guessed again
        let letterString = sender.title(for: .normal)!
        letterPressed = Character(letterString.lowercased())
    }
    

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        
        // Pass the selected object to the new view controller.
    }
    

}
