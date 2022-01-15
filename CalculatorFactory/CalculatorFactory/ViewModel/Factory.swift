//
//  File.swift
//  CalculatorFactory
//
//  Created by change on 2022/1/15.
//

import UIKit

//列舉工廠裡的方法
enum Calculators {
    case add
    case substract
    case multiply
    case divide
    case clear
    case numbers
    case giveMeAnswer
}


//可依照選取生產的生產工廠
class CalculatorsFactory {
    
    let label: UILabel
    let sender: UIButton
    init(label: UILabel, sender: UIButton) {
        self.label = label
        self.sender = sender
    }
    
    func create(_ calculators: Calculators) -> Calculator {
        
        switch calculators {
            
        case .add:
            
            let add = Add(label: label)
            
            return add
            
        case .substract:
            
            let substract = Substract(label: label)
            return substract
            
        case .multiply:
            
            let multiply = Multiply(label: label)
            return multiply
            
        case .divide:
            
            let divide = Divide(label: label)
            return divide
            
        case .clear:
            
            let clear = Clear(label: label)
            return clear
            
        case .giveMeAnswer:
            
            let giveMeAnswer = GiveMeAnswer(label: label)
            return giveMeAnswer
            
        case .numbers:
            
            let numbers = Numbers(label: label, sender: sender)
            return numbers
        }
    }
    
    //實際執行生產方法
    static func createCalculator(_ calculators: Calculators, _ label: UILabel, _ sender: UIButton) {
        let shapeFactory = CalculatorsFactory(label: label, sender: sender)
        shapeFactory.create(calculators).count()
    }
}

