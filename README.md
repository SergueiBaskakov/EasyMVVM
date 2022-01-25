# EasyMVVM

EasyMVVM is a package created to save time in the app development under the MVVM architecture.

## Features

- [x] EasyViewModel class with predefined structure for alert dialogs, loading state and an API completion handling
- [x] Loader modifier for SwiftUI
- [x] Alert modifier for SwiftUI

## Usage

import EasyMVVM
...

struct MyEasyError: EasyErrorProtocol {
    ...

    func getErrorMessage() -> String {
        return myMessage
    }
    
    ...
}

class MyEasyViewModel: EasyViewModel {
    ...
        
    func myFunction() {
        ...
        // Change state to loading
        self.isLoading = true
        ...
        
        apiCall()
        .sink { completion in
            ...
            // Handle completion
            self.handleCompletion(completion: completion, errorType: MyEasyError.self, defaultErrorMessage: "My default error message", rightButtonText: "Ok") 
            ...
            // Change state to no loading
            self.isLoading = false
            ...
        } receiveValue: { response in
            ...
            // Show alert dialog
            self.showAlertDialog(message: "My message", rightButtonText: "Ok")
            ...
        }
        .store(in: &subscriptions)
    }
    
    ...
}

struct MyView: View {
    ...
    @StateObject var myEasyViewModel: EasyViewModel = MyEasyViewModel()
    ...
    
    var body: some View {
        ...
        someView()
            // Adding a loader modifier
            .loader(viewModel: myEasyViewModel)
            // Adding an alert modifier
            .alert(viewModel: myEasyViewModel)
    }
}


