//
//  Extension.swift
//  calculator
//
//  Created by Самир Джафари on 20.09.2023.
//

import SwiftUI

extension Color {
    static let darkGrayCalc = Color("darkGrayCalc")
    static let grayCalc = Color("grayCalc")
    static let orangeCalc = Color("orangeCalc")
}

extension Buttons {
    func buttonToOperation() -> Operation {
        switch self {
        case .plus:
            return .addition
        case .minus:
            return .substarct
        case .multiple:
            return .multiple
        case .divide:
            return .divide
        default:
            return .none
        }
    }
}
