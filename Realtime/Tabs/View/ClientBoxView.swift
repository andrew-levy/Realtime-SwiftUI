//
//  ClientBoxView.swift
//  Realtime
//
//  Created by Andrew Levy on 9/30/20.
//  Copyright © 2020 Rootstrap. All rights reserved.
//

import SwiftUI

struct ClientBoxView: View {
    var body: some View {
        NavigationView {
            VStack(alignment: .leading) {
                
                Text("Clients")
                    .font(.system(size: 30))
                    .fontWeight(.heavy)
                    .foregroundColor(.primary)
                
                VStack {
                    
                }
            }
        }
    }
}

struct ClientBoxView_Previews: PreviewProvider {
    static var previews: some View {
        ClientBoxView()
    }
}
