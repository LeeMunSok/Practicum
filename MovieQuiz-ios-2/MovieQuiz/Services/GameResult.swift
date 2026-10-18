//
//  GameResult.swift
//  MovieQuiz
//
//  Created by Виталий  on 13.10.2026.
//

import UIKit
struct GameResult {
    let correct: Int
    let total: Int
    let date: Date
    func isBetter(_ another: GameResult) -> Bool{
        correct > another.correct
    }
}
