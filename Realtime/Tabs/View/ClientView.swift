//
//  ClientView.swift
//  Realtime
//
//  Created by Andrew Levy on 9/30/20.
//  Copyright © 2020 Rootstrap. All rights reserved.
//

import SwiftUI

struct ClientView: View {
    
    func getAgentData() -> Void {
        
    }
    var body: some View {
        VStack {
            VStack(alignment: .leading, spacing: 10){
                HStack {
                    NavigationLink(destination: StatusBarView(client: "name here")) {
                        Text("Client Name")
                            .font(.system(size: 15))
                            .fontWeight(.heavy)
                            .foregroundColor(.primary)
                    }
                    Spacer()
                    Button(action: {}) {
                        Image(systemName: "doc.on.doc")
                    }
                    Button(action: {}) {
                        Image(systemName: "square.and.pencil")
                    }
                    Button(action: {}) {
                        Image(systemName: "trash")
                    }
                    
                }
                Text("Property")
                    .font(.system(size: 15))
                    .foregroundColor(.primary)
                Text("100%")
                    .font(.system(size: 15))
                    .foregroundColor(.primary)
                
                StatusBarView(client: "name here")
            }.padding(.all, 30)
        }
        .background(Color(UIColor.systemGray6))
        .padding(.all, 10)
        .cornerRadius(45.0)
        .onAppear(perform: getAgentData)
    }
}

struct ClientView_Previews: PreviewProvider {
    static var previews: some View {
        ClientView()
    }
}
