//
//  ViewModelProtocol.swift
//  
//
//  Created by Serguei on 25/01/22.
//

import Foundation
import Combine

public protocol EasyViewModelProtocol: ObservableObject {
    
    var alertTitle: String { get set }
    var alertMessage: String { get set }
    var alertLeftButtonText: String { get set }
    var alertRightButtonText: String { get set }
    var alertActionLeftButton: () -> Void { get set }
    var alertActionRightButton: () -> Void { get set }
    var showAlert: Bool { get set }
    var isLoading: Bool { get set }
    
    func showAlertDialog(title: String, message: String, leftButtonText: String, rightButtonText: String, leftButtonAction: @escaping () -> Void, rightButtonAction: @escaping () -> Void) -> Void
    
    func handleCompletion<T: EasyErrorProtocol>(completion: Subscribers.Completion<Error>, errorType: T.Type, defaultErrorMessage: String, title: String, leftButtonText: String, rightButtonText: String, leftButtonAction: @escaping () -> Void, rightButtonAction: @escaping () -> Void) -> Void
    
}
