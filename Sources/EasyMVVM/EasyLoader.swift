//
//  EasyLoader.swift
//  
//
//  Created by Serguei on 25/01/22.
//

import Foundation
import SwiftUI

struct EasyLoader: ViewModifier {
    
    @ObservedObject var viewModel: EasyViewModel
    
    func body(content: Content) -> some View {
        ZStack {
            content
            if viewModel.isLoading {
                Color.black.opacity(0.6).ignoresSafeArea()
                ProgressView()
                    .progressViewStyle(CircularProgressViewStyle(tint: Color.white))
            }
        }
    }
    
}

public extension View {
    
    func loader(viewModel: EasyViewModel) -> some View {
        self.modifier(EasyLoader(viewModel: viewModel))
    }
    
}
