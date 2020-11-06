//
//  ContentView.swift
//  Realtime
//
//  Created by Germán Stábile on 3/10/20.
//  Copyright © 2020 Rootstrap. All rights reserved.
//

import SwiftUI

struct HomeView: View {
        var color: Color = Color(UIColor.systemBlue).opacity(0.8)
        var body: some View {
            NavigationView {
                ZStack {
//                    Color(UIColor.systemGray6).edgesIgnoringSafeArea(.all)
                    VStack (alignment: .center) {
                        HeroView()
                        Spacer()
                        ClientBoxView()
                        AgentBoxView()
                        Spacer()
                    }.padding(.all, 40)
                }
            }
        }
}

struct HomeView_Previews: PreviewProvider {
  static var previews: some View {
    HomeView()
  }
}
