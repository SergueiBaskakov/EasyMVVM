//
//  EasyAlert.swift
//  
//
//  Created by Serguei on 25/01/22.
//

import Foundation
import SwiftUI

struct EasyAlert: ViewModifier {
    
    @ObservedObject var viewModel: EasyViewModel
    
    func body(content: Content) -> some View {
        content
            .alert(isPresented: $viewModel.showAlert) {
                if viewModel.alertLeftButtonText == "" {
                    return Alert(title: Text(viewModel.alertTitle), message: Text(viewModel.alertMessage), dismissButton: .default(Text(viewModel.alertRightButtonText), action: viewModel.alertActionRightButton))
                }
                else {
                    return Alert(title: Text(viewModel.alertTitle), message: Text(viewModel.alertMessage), primaryButton: .default(Text(viewModel.alertLeftButtonText)){
                        viewModel.alertActionLeftButton()
                    }, secondaryButton: .default(Text(viewModel.alertRightButtonText)){
                        viewModel.alertActionRightButton()
                    })
                }
            }
    }
    
}

public extension View {
    
    func alert(viewModel: EasyViewModel) -> some View {
        self.modifier(EasyAlert(viewModel: viewModel))
    }
    
}
