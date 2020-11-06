//
//  TabBarView.swift
//  Realtime
//
//  Created by Andrew Levy on 9/27/20.
//  Copyright © 2020 Rootstrap. All rights reserved.
//

import SwiftUI

struct TabBarView: View {
    @State var selectedView = 0
    
    var body: some View {
        NavigationView {
            TabView(selection: $selectedView) {
                ClientsView()
                    .tabItem {
                        Image(systemName: "list.bullet")
                        Text("Clients")
                    }
                    .tag(0)
                ProfileView()
                    .tabItem {
                        Image(systemName: "person")
                        Text("Profile")
                    }
                    .tag(1)
            }
        }
    }
}

struct TabBarView_Previews: PreviewProvider {
    static var previews: some View {
        TabBarView()
    }
}
