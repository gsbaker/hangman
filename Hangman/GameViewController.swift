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
    
    // MARK: - Outlets
    @IBOutlet weak var wordLabel: UILabel!
    @IBOutlet weak var guessButton: UIButton!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        updateUI()
    }
    
    func updateUI() {
        // create wordLabel
        var letters = [String]()
        for letter in game.formattedWord {
            letters.append(String(letter))
        }
        let wordWithSpacing = letters.joined(separator: " ")
        wordLabel.text = wordWithSpacing
    }


}

