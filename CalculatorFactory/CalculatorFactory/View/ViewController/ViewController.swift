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
        CalculatorsFactory.createCalculator(.numbers, label, sender)
    }
    
    @IBAction func clear(_ sender: UIButton) {
        CalculatorsFactory.createCalculator(.clear, label, sender)
    }
    
    @IBAction func add(_ sender: UIButton) {
        CalculatorsFactory.createCalculator(.add, label, sender)
    }
    
    @IBAction func substract(_ sender: UIButton) {
        CalculatorsFactory.createCalculator(.substract, label, sender)
    }
    
    @IBAction func multiply(_ sender: UIButton) {
        CalculatorsFactory.createCalculator(.multiply, label, sender)
    }
    
    @IBAction func divide(_ sender: UIButton) {
        CalculatorsFactory.createCalculator(.divide, label, sender)

    }
    
    @IBAction func giveMeAnswer(_ sender: UIButton) {
        CalculatorsFactory.createCalculator(.giveMeAnswer, label, sender)

    }
    
}





