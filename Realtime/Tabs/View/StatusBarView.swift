//
//  StatusBarView.swift
//  Realtime
//
//  Created by Andrew Levy on 9/30/20.
//  Copyright © 2020 Rootstrap. All rights reserved.
//

import SwiftUI

struct StatusBarView: View {
    var client: String
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("\(client)")
                .font(.system(size: 30))
                .fontWeight(.heavy)
                .foregroundColor(.primary)
            GeometryReader { geometry in
                ZStack(alignment: .leading) {
                    Rectangle().frame(width: geometry.size.width, height: 5)
                        .opacity(0.3)
                        .foregroundColor(Color(UIColor.systemTeal))
                    
                    Rectangle().frame(width: min(CGFloat(10.0)*geometry.size.width, geometry.size.width), height: 5)
                        .foregroundColor(Color(UIColor.systemBlue))
                        .animation(.linear)
                }.cornerRadius(45.0)
            }
        }
    }
}

struct StatusBarView_Previews: PreviewProvider {
    static var previews: some View {
        StatusBarView(client: "Peter")
    }
}
