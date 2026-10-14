//
//  QuestionFactoryDelegate.swift
//  MovieQuiz
//
//  Created by Виталий  on 10.10.2026.
//

import UIKit
protocol QuestionFactoryDelegate: AnyObject {
    func didReceiveNextQuestion(question: QuizQuestion?)    
}
