//
//  HeroView.swift
//  Realtime
//
//  Created by Andrew Levy on 9/27/20.
//  Copyright © 2020 Rootstrap. All rights reserved.
//

import SwiftUI

struct HeroView: View {
    var color: Color = Color(UIColor.systemBlue).opacity(0.8)
    var body: some View {
        VStack (alignment: .leading) {
            Text("Realty in")
                .font(.system(size: 50))
                .fontWeight(.heavy)
                .foregroundColor(.primary)
            Text("Realtime")
                .font(.system(size: 50))
                .fontWeight(.heavy)
                .foregroundColor(color)
        }
    }
}

struct HeroView_Previews: PreviewProvider {
    static var previews: some View {
        HeroView()
    }
}
