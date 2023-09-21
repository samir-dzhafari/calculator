//
//  ViewModel.swift
//  calculator
//
//  Created by Самир Джафари on 21.09.2023.
//

import SwiftUI

class ViewModel: ObservableObject {
    
    // MARK: Property
    
    @Published var value = "0"
    @Published var number = 0.0
    @Published var currentOperation: Operation = .none
    
    let buttonsArray: [[Buttons]] = [
        [.clear, .negative, .percent, .divide],
        [.seven, .eigth, .nine, .multiple],
        [.four, .five, .six, .minus],
        [.one, .two, .three, .plus],
        [.zero, .decimal, .equal]
    ]
    
    func didTap(_ button: Buttons) {
        switch button {
        case .plus, .minus, .multiple, .divide:
            currentOperation = button.buttonToOperation()
            number = Double(value) ?? 0
            value = "0"
        case .equal:
            if let currentValue = Double(value) {
                value = formatResult(performOperation(currentValue))
            }
        case .decimal:
            if !value.contains(".") {
                value += "."
            }
        case .percent:
            if let currentValue = Double(value) {
                value = formatResult(currentValue / 100)
            }
        case .negative:
            if let currentValue = Double(value) {
                value = formatResult(-currentValue)
            }
        case .clear:
            value = "0"
            number = 0
            currentOperation = .none
        default:
            if value == "0" {
                value = button.rawValue
            } else {
                value += button.rawValue
            }
        }
    }
    
    // MARK: Helper calculate method
    
    func performOperation(_ currentValue: Double) -> Double {
        switch currentOperation {
        case .addition:
            return number + currentValue
        case .substarct:
            return number - currentValue
        case .multiple:
            return number * currentValue
        case .divide:
            return number / currentValue
        default:
            return currentValue
        }
    }
    
    // MARK: Format result method
    
    func formatResult(_ result: Double) -> String {
        return String(format: "%g", result)
    }
    
    // MARK: Size of buttons methods
    
    func buttonWidth(_ button: Buttons) -> CGFloat {
        let spacing: CGFloat = 12
        let totalSpacing = 5 * spacing
        let totalColumns: CGFloat = 4
        let screenWidth = UIScreen.main.bounds.width
        
        if button == .zero {
            return (screenWidth - totalSpacing + spacing) / totalColumns * 2
        }
        
        return (screenWidth - totalSpacing) / totalColumns
    }
    
    func buttonHeight() -> CGFloat {
        let spacing: CGFloat = 12
        let totalSpacing = 5 * spacing
        let totalColumns: CGFloat = 4
        let screenWidth = UIScreen.main.bounds.width
        
        return (screenWidth - totalSpacing) / totalColumns
    }
}
