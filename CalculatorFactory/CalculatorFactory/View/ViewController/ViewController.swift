//計算機：呼叫工廠裡的方法
import Foundation
import UIKit

class ViewController: UIViewController {
    //正常顯示Status
    override var preferredStatusBarStyle: UIStatusBarStyle{
        return .lightContent
    }
    @IBOutlet weak var label: UILabel!
    
    @IBOutlet var buttonCollection: [UIButton]!
    
    override func viewDidLoad() {
        buttonCollection.forEach({ $0.layer.cornerRadius = 20 })
    }
    
    //呼叫工廠方法
    @IBAction func numbers(_ sender: UIButton) {
        CalculatorsFactory.createCalculator(.numbers,on: label, in: sender)
    }
    
    @IBAction func clear(_ sender: UIButton) {
        CalculatorsFactory.createCalculator(.clear,on: label, in: sender)
    }
    
    @IBAction func add(_ sender: UIButton) {
        CalculatorsFactory.createCalculator(.add, on: label, in: sender)
    }
    
    @IBAction func substract(_ sender: UIButton) {
        CalculatorsFactory.createCalculator(.substract, on: label, in: sender)
    }
    
    @IBAction func multiply(_ sender: UIButton) {
        CalculatorsFactory.createCalculator(.multiply, on: label, in: sender)
    }
    
    @IBAction func divide(_ sender: UIButton) {
        let divide = CalculatorsFactory.getCalculator(.divide, on: label, in: sender)
        divide.count()
    }
    
    @IBAction func giveMeAnswer(_ sender: UIButton) {
        let giveMeAnswer = CalculatorsFactory.getCalculator(.giveMeAnswer, on: label, in: sender)
        giveMeAnswer.count()
    }
    
}





