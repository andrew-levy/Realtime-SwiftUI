//
//  ClientSearchViewModel.swift
//  Realtime
//
//  Created by Andrew Levy on 9/27/20.
//  Copyright © 2020 Rootstrap. All rights reserved.
//

import Foundation
import SwiftUI
import Combine
import Firebase

enum ClientSearchModelState {
    case loading
    case idle
    case clientID
    case error(String)
}

class ClientSearchViewModel: ObservableObject, Identifiable {
    
    @Published var clientIdData = TextFieldData(
        title: "Realtime ID",
        validationType: .none,
        errorMessage: "Please enter a valid Realtime ID"
    )
    
    @Published var clientEmailData = TextFieldData(
        title: "Realtime ID",
        validationType: .none,
        errorMessage: "Please enter a valid Realtime ID"
    )
    
    
    @Published var isLoading = false
    @Published var errored = false
    var error: String = ""
    
    var isValidData: Bool {
        return [clientIdData].allSatisfy { $0.isValid }
    }
    
    
}

