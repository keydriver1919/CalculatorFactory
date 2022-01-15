//
//  File.swift
//  CalculatorFactory
//
//  Created by change on 2022/1/16.
//

//工廠方法
import UIKit

//計算機：存放工廠會使用到的運算邏輯方法
class Calculator {
    
    var label: UILabel
    init(label: UILabel){
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




