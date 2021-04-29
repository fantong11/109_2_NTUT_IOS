//
//  ViewController.swift
//  CalculatorMVC
//
//  Created by 范桶 on 2021/4/29.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var resultLabel: UILabel!
    @IBOutlet weak var historyLabel: UILabel!
    @IBOutlet var calculatorButtons: [UIButton]!
    
    var calculator = Calculator()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


    @IBAction func selectButton(_ sender: UIButton) {
        if let buttonIndex = calculatorButtons.firstIndex(of: sender) {
            // 拿選擇的按鈕
            if  let button =
                    CalculatorButton(rawValue: calculatorButtons[buttonIndex].titleLabel!.text ?? "") {
                calculator.selectButton(button: button)
                updateViewFromModel()
            }
        }
    }
    
    // 更新畫面
    func updateViewFromModel() {
        resultLabel.text = calculator.getResult()
        historyLabel.text = calculator.getCalculation()
    }
}

