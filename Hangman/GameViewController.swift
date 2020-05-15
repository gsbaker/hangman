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

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        print(game.word)
    }


}

