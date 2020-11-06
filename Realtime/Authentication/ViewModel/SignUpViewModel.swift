//
//  SignUpViewModel.swift
//  Realtime
//
//  Created by Germán Stábile on 4/3/20.
//  Copyright © 2020 Rootstrap. All rights reserved.
//

import Foundation
import UIKit
import Firebase

class SignUpViewModel: ObservableObject, Identifiable {
  @Published var emailData = TextFieldData(
    title: "Email",
    validationType: .email,
    errorMessage: "Please enter a valid email"
  )
  
  @Published var passwordData = TextFieldData(
    title: "Password",
    validationType: .nonEmpty,
    isSecure: true,
    errorMessage: "Passwords don't match"
  )
  
  @Published var confirmPasswordData = TextFieldData(
    title: "Confirm Password",
    validationType: .nonEmpty,
    isSecure: true,
    errorMessage: "Passwords don't match"
  )
  
  @Published var isLoading = false
  @Published var errored = false
  var error: String = ""
  
  init() {
    confirmPasswordData.validationType = .custom(isValid: passwordsMatch)
    passwordData.validationType = .custom(isValid: passwordsMatch)
  }
  
  var isValidData: Bool {
    return [emailData, passwordData, confirmPasswordData].allSatisfy { $0.isValid }
  }
  
  func passwordsMatch() -> Bool {
    guard !passwordData.isEmpty else { return false }
    let areValidPasswords = passwordData.value == confirmPasswordData.value
    passwordData.isValid = areValidPasswords
    confirmPasswordData.isValid = areValidPasswords
    return areValidPasswords
  }
  
  func attemptSingUp() {
    isLoading = true
    Auth.auth().createUser(
        withEmail: emailData.value,
        password: passwordData.value
    ) { [weak self] authResult, error in
        // add new user to agents db
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
