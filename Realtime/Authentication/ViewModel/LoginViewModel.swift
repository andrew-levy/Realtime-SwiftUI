//
//  LoginViewModel.swift
//  Realtime
//
//  Created by Germán Stábile on 3/12/20.
//  Copyright © 2020 Rootstrap. All rights reserved.
//

import Foundation
import SwiftUI
import Combine
import Firebase

enum LoginViewModelState {
  case loading
  case idle
  case signedIn
  case error(String)
}

class LoginViewModel: ObservableObject, Identifiable {
  
  @Published var emailData = TextFieldData(
    title: "Email",
    validationType: .email,
    errorMessage: "Please enter a valid email"
  )
  
  @Published var passwordData = TextFieldData(
    title: "Password",
    validationType: .nonEmpty,
    isSecure: true,
    errorMessage: "Please enter a valid password"
  )
  
  @Published var isLoading = false
  @Published var errored = false
    
  var error: String = ""
  
  var isValidData: Bool {
    return [emailData, passwordData].allSatisfy { $0.isValid }
  }
  
  func attemptSignin() {
    isLoading = true
    Auth.auth().signIn(
        withEmail: emailData.value,
        password: passwordData.value
    ) { [weak self] authResult, error in
            guard let strongSelf = self else { return }
            if (authResult != nil) {
                strongSelf.isLoading = false
                ViewRouter.shared.currentRoot = .tabs
            } else {
                strongSelf.isLoading = false
                strongSelf.errored = true
                strongSelf.error = error?.localizedDescription ?? "Something went wrong..."
            }
        }
  }
}

