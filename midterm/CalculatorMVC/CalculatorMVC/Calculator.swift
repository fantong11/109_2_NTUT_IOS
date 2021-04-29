//
//  Calcuator.swift
//  CalculatorMVC
//
//  Created by 范桶 on 2021/4/29.
//

import Foundation

class Calculator {
    // 運算式
    var calculation: String
    // 結果
    var result: Double
    // 運算子
    var op: String
    // 有幾個小數點
    var dotCount: Int
    
    var calculated: Bool
    
    init() {
        calculation = ""
        result = 0
        op = ""
        dotCount = 0
        calculated = false
    }
    
    func selectButton(button: CalculatorButton) -> Void {
        switch button {
        // 清除
        case .reset:
            reset()
        // 正負號
        case .addMinus:
            result = addToMinus(operand: Double(calculation) ?? 0)
            calculation = "±(" + calculation + ")="
        // ％
        case .percent:
            result = toPercent(operand: Double(calculation) ?? 0)
            calculation = calculation + "×100%="
            
        // 按下等於再計算
        case .equal:
            compute()
        // 加減乘除
        case .add, .minus, .div, .mult:
            if calculation == "" {
                calculation += "0"
            }
            if String(calculation.last!) == CalculatorButton.add.rawValue
                || String(calculation.last!) == CalculatorButton.minus.rawValue
                || String(calculation.last!) == CalculatorButton.mult.rawValue
                || String(calculation.last!) == CalculatorButton.div.rawValue {
                calculation.removeLast()
            }
            calculated = true
            dotCount = 0
            calculation += button.rawValue
            op = button.rawValue
        // 小數點
        case .dot:
            if calculation == "" {
                calculation += "0"
            }
            dotCount += 1
            if dotCount > 1 {
                break
            }
            calculation += button.rawValue
        // 數字
        default:
            calculation += button.rawValue
        }
    }
    
    func compute() {
        if !calculated {
            return
        }
        // 切割字串
        let arr = calculation.components(separatedBy: op)
        let operandOne: Double = Double(arr[0]) ?? 0
        let operandTwo: Double = Double(arr[1]) ?? 0
        
        // 判斷op
        switch op {
        case CalculatorButton.add.rawValue:
            result = add(operandOne: operandOne, operandTwo: operandTwo)
        case CalculatorButton.minus.rawValue:
            result = minus(operandOne: operandOne, operandTwo: operandTwo)
        case CalculatorButton.mult.rawValue:
            result = mult(operandOne: operandOne, operandTwo: operandTwo)
        case CalculatorButton.div.rawValue:
            result = div(operandOne: operandOne, operandTwo: operandTwo)
        default:
            break
        }
        
        // 判斷是不是小數，是的話就把".0"去掉
        var temp1: String = String(operandOne)
        var temp2: String = String(operandTwo)
        if floor(operandOne) == operandOne  {
            temp1 = String(Int(operandOne))
        }
        if floor(operandTwo) == operandTwo {
            temp2 = String(Int(operandTwo))
        }
        // 重新組合
        calculation = temp1 + op + temp2 + "="
        
    }
    
    // 加
    func add(operandOne: Double, operandTwo: Double) -> Double {
        return operandOne + operandTwo
    }
    
    // 減
    func minus(operandOne: Double, operandTwo: Double) -> Double {
        return operandOne - operandTwo
    }
    
    // 乘
    func mult(operandOne: Double, operandTwo: Double) -> Double {
        return operandOne * operandTwo
    }
    
    // 除
    func div(operandOne: Double, operandTwo: Double) -> Double {
        // 除以0的話要等於0
        if operandTwo == 0 {
            return 0
        }
        return operandOne / operandTwo
    }
    
    // 正負
    func addToMinus(operand: Double) -> Double {
        return operand * -1
    }
    
    // 轉百分比
    func toPercent(operand: Double) -> Double {
        return Double(operand) * 0.01
    }
    
    // 重置
    func reset() -> Void {
        calculation = ""
        result = 0
        dotCount = 0
        calculated = false
    }
    
    func getResult() -> String {
        // 判斷是不是小數
        if floor(result) == result {
            return String(Int(result))
        }
        return String(result)
    }
    
    func getCalculation() -> String {
        return calculation
    }
    
}
