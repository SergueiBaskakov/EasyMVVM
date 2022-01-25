//
//  ViewModel.swift
//  
//
//  Created by Serguei on 25/01/22.
//

import Foundation
import Combine

open class EasyViewModel: EasyViewModelProtocol {
    
    public var alertTitle = ""
    public var alertMessage = ""
    public var alertLeftButtonText = ""
    public var alertRightButtonText = ""
    public var alertActionLeftButton: () -> Void = {}
    public var alertActionRightButton: () -> Void = {}
    @Published public var showAlert: Bool = false
    @Published public var isLoading: Bool = false
    
    public init() {
        
    }
    
    public func showAlertDialog(title: String = "Error", message: String, leftButtonText: String = "", rightButtonText: String, leftButtonAction: @escaping () -> Void = {}, rightButtonAction: @escaping () -> Void = {}) {
        self.alertTitle = title
        self.alertMessage = message
        self.alertLeftButtonText = leftButtonText
        self.alertRightButtonText = rightButtonText
        self.alertActionLeftButton = leftButtonAction
        self.alertActionRightButton = rightButtonAction
        self.showAlert = true
    }
    
    public func handleCompletion<T>(completion: Subscribers.Completion<Error>, errorType: T.Type, defaultErrorMessage: String, title: String = "Error", leftButtonText: String = "", rightButtonText: String, leftButtonAction: @escaping () -> Void = {}, rightButtonAction: @escaping () -> Void = {}) where T : EasyErrorProtocol {
        if case .failure(let err) = completion {
            if let error = err as? T {
                self.showAlertDialog(title: title, message: error.getErrorMessage(), leftButtonText: leftButtonText, rightButtonText: rightButtonText, leftButtonAction: leftButtonAction, rightButtonAction: rightButtonAction)
            }
            else {
                self.showAlertDialog(title: title, message: defaultErrorMessage, leftButtonText: leftButtonText, rightButtonText: rightButtonText, leftButtonAction: leftButtonAction, rightButtonAction: rightButtonAction)
            }
            self.isLoading = false
        }
    }
    
}
