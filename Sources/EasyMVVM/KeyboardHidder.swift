//
//  KeyboardHidder.swift
//  
//
//  Created by Serguei on 25/01/22.
//

import Foundation
import SwiftUI

struct KeyboardHidder: ViewModifier {
    
    func body(content: Content) -> some View {
        content
            .onTapGesture {
                UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
            }
    }
    
}

extension View {
    
    func hideKeyboard() -> some View {
        self.modifier(KeyboardHidder())
    }
    
}
