//
//  Hangman.swift
//  Hangman
//
//  Created by George Baker on 15/05/2020.
//  Copyright © 2020 gsbaker. All rights reserved.
//

import Foundation

struct Hangman {
    var words: [String]
    var word: String
    var totalRounds: Int
    
    init() {
        words = ["swift", "rain", "train", "map", "initialisation", "jazz"]
        word = words.randomElement()!
        totalRounds = words.count
    }
    
}
