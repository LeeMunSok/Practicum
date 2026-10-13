//
//  ViewController.swift
//  Counter
//
//  Created by Виталий  on 28.08.2026.
//

import UIKit

var number = 0

class ViewController: UIViewController {
    
    @IBOutlet weak var counterTitle: UILabel!
    
    @IBOutlet weak var counterButton: UIButton!
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        number = UserDefaults.standard.integer(forKey: "counterValue")
        counterTitle.text = "Значение счётчика: \(number)"
        
      
    }

    @IBAction func increaseNumber(_ sender: Any) {
        var newNumber = number
        newNumber += 1
        number = newNumber
        counterTitle.text = "Значение счётчика: \(number)"
        UserDefaults.standard.set(number, forKey: "counterValue")
    }
   
    
}
// Пример сохранения значения счетчика

