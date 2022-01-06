//工廠方法
import UIKit

protocol CalculatorProtocol {
    var label: UILabel { get }
    func count()
}

//計算機：存放會使用到的運算邏輯方法
class Calculator: CalculatorProtocol {
    
    var label: UILabel
    init(label:UILabel){
        self.label = label
    }
    //執行計算
    func count() {
    }

    //調整數字顯示
    func oKNumberString(from number:Double){
        var okText:String
        if floor(number) == number{
            okText = "\(Int(number))"
        }else{
            okText = "\(number)"
        }
        if okText.count >= 9{
            okText = String(okText.prefix(9))
        }
        label.text = okText
    }
    
    //目前數字
    func nowAnswer() {
        if performingMath == true{
            if operation == "add"{
                screenNumber = beforeNumber + screenNumber
            }else if operation == "substract"{
                screenNumber = beforeNumber - screenNumber
            }else if operation == "multiply"{
                screenNumber = beforeNumber * screenNumber
            }else if operation == "divide"{
                if screenNumber == 0{
                    let alert = UIAlertController(title: "Error", message: nil, preferredStyle: .alert)
                    alert.addAction(UIAlertAction(title: "OK", style: .default))
                    
                    let present = UIViewController()
                    present.present(alert, animated: true, completion: nil)
                    
                }else{
                    screenNumber = beforeNumber / screenNumber
                }
            }else if operation == "none"{
                label.text = "0"
            }
        }
    }
}


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
    
    func create(_ calculators: Calculators) -> CalculatorProtocol {
        
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
    //方法一
    static func createCalculator(_ calculators: Calculators, on label: UILabel, in sender: UIButton) {
        let shapeFactory = CalculatorsFactory(label: label, sender: sender)
        shapeFactory.create(calculators).count()
        
    }
    //方法二
    static func getCalculator(_ calculators: Calculators, on label: UILabel, in sender: UIButton) -> CalculatorProtocol {
        let calculatorsFactory = CalculatorsFactory(label: label, sender: sender)
        return calculatorsFactory.create(calculators)
    }
}









