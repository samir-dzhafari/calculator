//
//  MainView.swift
//  calculator
//
//  Created by Самир Джафари on 20.09.2023.
//

import SwiftUI

struct MainView: View {
    
    @EnvironmentObject var viewModel: ViewModel
    
    var body: some View {
        ZStack {
            // MARK: Background
            Color(.black)
                .ignoresSafeArea()
            
            VStack(spacing: 12) {
                Spacer()
                
                // MARK: Display
                HStack {
                    Spacer()
                    Text(viewModel.value)
                        .foregroundColor(.white)
                        .font(.system(size: 90))
                        .fontWeight(.light)
                        .padding(.horizontal, 26)
                }
                
                // MARK: Buttons
                ForEach(viewModel.buttonsArray, id: \.self) { row in
                    HStack(spacing: 12) {
                        ForEach(row, id: \.self) { button in
                            Button {
                                viewModel.didTap(button)
                            } label: {
                                Text(button.rawValue)
                                    .frame(
                                        width: viewModel.buttonWidth(button),
                                        height: viewModel.buttonHeight()
                                    )
                                    .foregroundColor(button.buttonFontColor)
                                    .background(button.buttonColor)
                                    .font(.system(size: 35))
                                    .cornerRadius(40)
                            }
                        }
                    }
                }
            }
            .padding(.bottom)
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
            .environmentObject(ViewModel())
    }
}
