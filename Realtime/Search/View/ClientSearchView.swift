//
//  ClientSearchView.swift
//  Realtime
//
//  Created by Andrew Levy on 9/27/20.
//  Copyright © 2020 Rootstrap. All rights reserved.
//

import SwiftUI
import Firebase

struct ClientSearchView: View {
    @ObservedObject var viewModel = ClientSearchViewModel()
    @ObservedObject var propertiesManager = PropertiesManager()
    @State var showResults = false
    @State var showNoResults = false
    @State var showAlreadyAddedAlert = false
    @State var disableButton = false
    @State var fname = ""
    @State var lname = ""
    
    
    var color: Color = Color(UIColor.systemBlue).opacity(0.8)
    
    func searchForClientByID() -> Void {
        if !viewModel.clientIdData.value.isEmpty {
            let db = Firestore.firestore()
            let clientCollection = db.collection("clients")
            let docRef = clientCollection.document(viewModel.clientIdData.value)
            docRef.getDocument { (snapshot, error) in
                if (snapshot?.exists == true) {
                    let data = snapshot?.data()
                    fname = data?["fname"] as! String
                    lname = data?["lname"] as! String
                    showResults = true
                    showNoResults = false
                } else {
                    showResults = false
                    showNoResults = true
                    print("no user found")
                }
            }
        }
    }
    
    func addProperty() -> Void {
        print(propertiesManager.existingProperties)
        let isntFull = propertiesManager.existingProperties.count <= 5
        let doesntAlreadyExist = !propertiesManager.existingProperties.contains("\(fname) \(lname)")
        if (isntFull && doesntAlreadyExist) {
            propertiesManager.existingProperties.append("\(fname) \(lname)")
            disableButton = true
        } else {
            showAlreadyAddedAlert = true
        }
    }
    func removeProperty(property: String) -> Void {
        let index = propertiesManager.existingProperties.firstIndex(of: property)
        if (index != nil) {
            propertiesManager.existingProperties.remove(at: index!)
        }
    }
    
    var body: some View {
        VStack {
            
            VStack(alignment: .leading) {
                Text("Search for your")
                    .font(.system(size: 30))
                    .fontWeight(.heavy)
                    .foregroundColor(.primary)
                Text("Realtime ID")
                    .font(.system(size: 30))
                    .fontWeight(.heavy)
                    .foregroundColor(color)
                    .padding(.bottom, 20)
                
                TextFieldView(fieldData: $viewModel.clientIdData)
                Button(action: searchForClientByID) {
                    HStack {
                        Text("Submit")
                        Image(systemName: "arrow.right")
                            .foregroundColor(.accentColor)
                    }
                }
            }
            Spacer()
            
            showResults
                ? VStack {
                    VStack(alignment: .leading) {
                        Text("Results")
                            .font(.system(size: 30))
                            .fontWeight(.heavy)
                            .foregroundColor(.primary)
                            .padding(.bottom, 20)
                        HStack {
                            Text("\(fname) \(lname)")
                                .font(.system(size: 20))
                                .foregroundColor(.primary)
                            
                            Spacer()
                            
                            Button(action: addProperty) {
                                Image(systemName: "plus")
                                    .resizable()
                                    .padding(6)
                                    .frame(width: 24, height: 24)
                                    .background(Color.blue)
                                    .clipShape(Circle())
                                    .foregroundColor(.white)
                                    .disabled(disableButton)
                                    .alert(isPresented: $showAlreadyAddedAlert) {
                                        Alert(title: Text("Oops!"), message: Text("Looks like you have already added this property."), dismissButton: .default(Text("Got it!")))
                                    }
                            }
                            
                            NavigationLink(destination: StatusBarView(client: "\(fname) \(lname)")) {
                                Image(systemName: "arrow.right")
                                    .resizable()
                                    .padding(6)
                                    .frame(width: 24, height: 24)
                                    .background(Color.blue)
                                    .clipShape(Circle())
                                    .foregroundColor(.white)
                                
                            }
                        
                        }
                    }.padding(.all, 20)
                }
                .background(Color(UIColor.systemGray6))
                .cornerRadius(20)
                
                : nil
            
            showNoResults
                ? VStack {
                    VStack {
                        Text("No Results")
                        .font(.system(size: 20))
                        .foregroundColor(.primary)
                    }.padding(.all, 20)
                }
                .background(Color(UIColor.systemGray6))
                .cornerRadius(20)
            : nil
            
            
            Spacer()
            VStack(alignment: .leading){
                VStack{
                    Text(!propertiesManager.existingProperties.isEmpty ? "Current Properties" : "No Properties Yet")
                        .font(.system(size: 30))
                        .fontWeight(.heavy)
                        .foregroundColor(.primary)
                        .padding(.bottom, 20)
                    ForEach(propertiesManager.existingProperties, id: \.self) { property in
                        NavigationLink(destination: StatusBarView(client: property)) {
                            HStack {
                                Text(property)
                                    .font(.system(size: 20))
                                    .foregroundColor(.primary)
                                Spacer()
                                Button(action: { removeProperty(property: property) }) {
                                    Image(systemName: "xmark")
                                        .resizable()
                                        .padding(6)
                                        .frame(width: 24, height: 24)
                                        .background(Color.blue)
                                        .clipShape(Circle())
                                        .foregroundColor(.white)
                                        .disabled(disableButton)
                                }
                                Image(systemName: "arrow.right")
                                    .resizable()
                                    .padding(6)
                                    .frame(width: 24, height: 24)
                                    .background(Color.blue)
                                    .clipShape(Circle())
                                    .foregroundColor(.white)
                            }.padding([.top, .bottom], 1)
                            
                        }
        
                    }
                }.padding(.all, 20)
                
            }
            .background(Color(UIColor.systemGray6))
            .cornerRadius(20)
            
            
        }
        .padding(.all, 40)
        Spacer()
    }
}

struct ClientSearchView_Previews: PreviewProvider {
    static var previews: some View {
        ClientSearchView()
    }
}
