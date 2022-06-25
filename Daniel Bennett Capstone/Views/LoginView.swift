//
//  LoginView.swift
//  Daniel Bennett Capstone
//
//  Created by Danny Bennett on 4/30/22.
//

import SwiftUI

struct LoginView: View {
    
    @State private var username = ""
    @State private var password = ""
    @State private var wrongUsername = 0
    @State private var wrongPassword = 0
    @State private var showingLoginScreen = false
    @State private var showingAlert = false
    
    
    var body: some View {
        
        NavigationView {
            ZStack {
                VStack {
                    Image("EarlyAlert")
                        .resizable()
                        .scaledToFit()
                    Spacer()
                    VStack(alignment: .leading){
                        Text("Username: ").foregroundColor(Color.white)
                        TextField("", text: $username)
                            .padding(.leading)
                            .background(Color.black)
                            .cornerRadius(6)
                            .border(.red, width: CGFloat(wrongUsername))
                            //.padding(/*@START_MENU_TOKEN@*/[.leading, .bottom, .trailing]/*@END_MENU_TOKEN@*/)
                            .font(Font.system(size: 30))
                            .disableAutocorrection(true)
                            .textInputAutocapitalization(.never)
                            .foregroundColor(Color(red: 0.9647058823529412, green: 0.6823529411764706, blue: 0.5176470588235295))
                            .padding(.bottom)
                        
                        Text("Password: ").foregroundColor(Color.white)
                        SecureField("", text: $password)
                            .padding(.leading)
                            .background(Color.black)
                            .cornerRadius(6)
                            .border(.red, width: CGFloat(wrongPassword))
                            //.padding(/*@START_MENU_TOKEN@*/[.leading, .bottom, .trailing]/*@END_MENU_TOKEN@*/)
                            .font(Font.system(size: 30))
                            .disableAutocorrection(true)
                            .textInputAutocapitalization(.never)
                            .foregroundColor(Color(red: 0.9647058823529412, green: 0.6823529411764706, blue: 0.5176470588235295))

                    }
                    .padding(.horizontal)
                    .foregroundColor(Color(red: 0.9647058823529412, green: 0.6823529411764706, blue: 0.5176470588235295))
                    
                    
                    Button("Login              ") {
                        authenticateUser(username: username, password: password)
                    }
                    .padding(.top, 40.0)
                    .font( .title)
                    .tint(Color(red: 0.9647058823529412, green: 0.6823529411764706, blue: 0.5176470588235295))
                    .buttonStyle(.borderedProminent)
                    .buttonBorderShape(.capsule)
                    .controlSize(.regular)
                    
                    
                    Spacer()
                    
                    Button("Sign up") {
                        showingAlert = true
                    }
                    .alert("Please contact your IT department to sign up.", isPresented: $showingAlert) {
                        Button("OK", role: .cancel) {}
                    }
                    .foregroundColor(Color(red: 0.9647058823529412, green: 0.6823529411764706, blue: 0.5176470588235295))
                    
                    NavigationLink(destination: SurveyView(radius: 0, texture: 0, perimeter: 0, area: 0, smoothness: 0, percentage: 0, wrongPercentage: 0), isActive: $showingLoginScreen){}
                       
                    
                }
            }
            .background(Color(red: 0.28627450980392155, green: 0.37254901960784315, blue: 0.6509803921568628))
            .navigationBarHidden(true)
        }
        .navigationBarBackButtonHidden(true)
        .navigationBarHidden(true)
        
    }
        
    func authenticateUser(username: String, password: String) {
        if username.lowercased() == "admin" {
            wrongUsername = 0
            if password.lowercased() == "admin" {
                wrongPassword = 0
                showingLoginScreen = true
            } else {
                wrongPassword = 2
            }
        } else {
            wrongUsername = 2
        }
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
