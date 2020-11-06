//
//  ClientBoxView.swift
//  Realtime
//
//  Created by Andrew Levy on 9/27/20.
//  Copyright © 2020 Rootstrap. All rights reserved.
//

import SwiftUI

struct ClientBoxView: View {
    var color: Color = Color(UIColor.systemBlue).opacity(0.8)
    var body: some View {
        VStack {
            VStack {
                HStack (alignment: .top, spacing: 20) {
                    Image(systemName: "house.fill")
                        .resizable()
                        .frame(width: 40, height: 40)
                        .foregroundColor(color)
                    
                    VStack (alignment: .leading, spacing: 4) {
                        Text("Buyer or Renter")
                            .font(.headline)
                            .bold()
                        Text("Easily track the progress of your realestate deal.")
                            .font(.subheadline)
                    }
                }
                .padding(.bottom, 30)
                NavigationLink(destination: ClientSearchView()){
                    HStack {
                        Text("View Status")
                            .foregroundColor(.white)
                            .bold()
                        Image(systemName: "arrow.right").foregroundColor(.white)
                    }
                    .frame(width: 280, height: 50)
                    .background(color)
                    .cornerRadius(12)
                }

            }
            .padding(.all, 20)
        }
        .background(Color(UIColor.systemGray6))
        .cornerRadius(20)
        .padding(.bottom, 30)
    }
}

struct ClientBoxView_Previews: PreviewProvider {
    static var previews: some View {
        ClientBoxView()
    }
}
