//
//  CalculatorApp.swift
//  calculator
//
//  Created by Самир Джафари on 20.09.2023.
//

import SwiftUI

@main
struct CalculatorApp: App {
    @StateObject var viewModel = ViewModel()
    
    var body: some Scene {
        WindowGroup {
            MainView()
                .environmentObject(viewModel)
        }
    }
}
