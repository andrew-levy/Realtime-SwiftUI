//
//  PropertiesManager.swift
//  Realtime
//
//  Created by Andrew Levy on 10/1/20.
//  Copyright © 2020 Rootstrap. All rights reserved.
//

import Foundation

class PropertiesManager: ObservableObject {
    @Published var existingProperties: [String] = UserDefaults.standard.stringArray(forKey: "existingProperties") ?? [] {
        didSet {
            UserDefaults.standard.set(self.existingProperties, forKey: "existingProperties")
        }
    }
}
