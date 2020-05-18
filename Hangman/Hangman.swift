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
    var usedWords: [String]
    var word: String
    var guessed: Bool
    var totalRounds: Int
    var guessedLetters: [Character]
    var formattedWord: String {
        var guessedWord = ""
        for letter in word {
            if guessedLetters.contains(letter) {
                guessedWord += "\(letter)"
            } else {
                guessedWord += "_"
            }
        }
        
        return guessedWord
    }
    var gameOver: Bool
    
    
    init() {
        words = ["swift", "rain", "train", "map", "initialisation", "jazz"]
        usedWords = []
        word = words.randomElement()!
        totalRounds = words.count
        guessedLetters = []
        guessed = false
        gameOver = false
    }
    
    mutating func makeGuess(val: Character) {
        guessedLetters.append(val)
        print(guessedLetters)
        // check if guessed
        if formattedWord == word {
            guessed = true
            usedWords.append(word)
        }
    }
    
    mutating func nextWord() {
        if usedWords.count < totalRounds {
            var valueFound = false
            while !valueFound {
                let newWord = words.randomElement()!
                if !usedWords.contains(newWord) {
                    word = newWord
                    guessed = false
                    guessedLetters = []
                    valueFound = true
                }
            }
            
        } else {
            gameOver = true
        }
    }
    
}
