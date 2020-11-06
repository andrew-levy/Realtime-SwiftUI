//
//  ClientsView.swift
//  Realtime
//
//  Created by Andrew Levy on 9/30/20.
//  Copyright © 2020 Rootstrap. All rights reserved.
//

import SwiftUI

struct ClientsView: View {
    var color: Color = Color(UIColor.systemBlue).opacity(0.8)
    var body: some View {
        VStack(alignment: .leading) {
            HStack(alignment: .center) {
                Text("Clients")
                    .font(.system(size: 30))
                    .fontWeight(.heavy)
                    .foregroundColor(.primary)
                    .padding(.bottom, 20)
                Spacer()
                Button(action: {}) {
                    Image(systemName: "person.crop.circle.fill.badge.plus")
                }
            }
            ScrollView {
                VStack {
                    ClientView()
                    ClientView()
                    ClientView()
                }
            }
        }.padding(.horizontal, 30)
    }
}

struct ClientsView_Previews: PreviewProvider {
    static var previews: some View {
        ClientsView()
    }
}
