//
//  AlertModel.swift
//  MovieQuiz
//
//  Created by Виталий  on 12.10.2026.
//

import UIKit
struct AlertModel {
    var title: String
    var message: String
    var buttonText: String
    var completion: () -> Void
}
