//
//  ScrollEnabler.swift
//  
//
//  Created by Serguei on 25/01/22.
//

import Foundation
import SwiftUI

struct ScrollEnabler: ViewModifier {
    
    let showIndicators: Bool

    func body(content: Content) -> some View {
        ScrollView(showsIndicators: showIndicators) {
            content
        }
    }
    
}

extension View {
    
    func enableScroll(showIndicators: Bool = false) -> some View {
        self.modifier(ScrollEnabler(showIndicators: showIndicators))
    }
    
}
