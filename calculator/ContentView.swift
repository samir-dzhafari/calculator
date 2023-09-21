//
//  ContentView.swift
//  calculator
//
//  Created by Самир Джафари on 20.09.2023.
//

import SwiftUI

private struct ButtonItem: Identifiable {
    let name: String
    
    var id: String { name }
}

private let buttons = [
    ButtonItem(name: "1"),
    ButtonItem(name: "2"),
    ButtonItem(name: "3"),
    ButtonItem(name: "4"),
    ButtonItem(name: "5"),
    ButtonItem(name: "6"),
    ButtonItem(name: "7"),
    ButtonItem(name: "8"),
    ButtonItem(name: "9")
]

struct ContentView: View {
    var body: some View {
        VStack {
            Text("0")
                .font(.system(size: 32, weight: .medium, design: .default))
                .frame(maxWidth: .infinity, alignment: .trailing)
                .padding()
            Spacer()
            ForEach(buttons) { buttonTitle in
                Button(buttonTitle.name) {
                    print(buttonTitle.name)
                }
            }
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
