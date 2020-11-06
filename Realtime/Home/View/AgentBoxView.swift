//
//  AgentBoxView.swift
//  Realtime
//
//  Created by Andrew Levy on 9/27/20.
//  Copyright © 2020 Rootstrap. All rights reserved.
//

import SwiftUI

struct AgentBoxView: View {
    var color: Color = Color(UIColor.systemBlue).opacity(0.8)
    var body: some View {
        VStack {
            VStack {
              HStack (alignment: .top, spacing: 20) {
                    Image(systemName: "person.crop.circle.fill")
                        .resizable()
                        .frame(width: 40, height: 40)
                        .foregroundColor(color)
                    
                    VStack (alignment: .leading, spacing: 4) {
                        Text("Agent")
                            .font(.headline)
                            .bold()
                        Text("Sign in to manage your clients' progress.")
                            .font(.subheadline)
                    }
              }
              .padding(.bottom, 30)
                NavigationLink(destination: LoginView()){
                    HStack {
                        Text("Sign In")
                            .foregroundColor(.white)
                            .bold()
                        Image(systemName: "arrow.right")
                            .foregroundColor(.white)
                    }
                    .frame(width: 280, height: 50)
                    .background(color)
                    .cornerRadius(12)
                    .padding(.bottom, 10)
                }
                HStack {
                    Text("No account yet?")
                        .font(.system(size: 15))
                    NavigationLink(destination: SignUpView()){
                        Text("Sign Up")
                            .font(.system(size: 15))
                    }
                }
            }.padding(.all, 20)
        }
        .background(Color(UIColor.systemGray6))
        .cornerRadius(20)
    }
}

struct AgentBoxView_Previews: PreviewProvider {
    static var previews: some View {
        AgentBoxView()
    }
}
