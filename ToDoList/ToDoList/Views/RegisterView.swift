//
//  RegisterView.swift
//  ToDoList
//
//  Created by Bartek Prejs on 05/06/2024.
//

import SwiftUI

struct RegisterView: View {
    
    @State var email = ""
    @State var username = ""
    @State var password = ""
    @State var repeatPassword = ""
    
    var body: some View {
        NavigationView {
            VStack {
                // Header
                HeaderView(title: "Register", subtitle: "Start orginizing time", angle: -15, backgroundColor: Color.green)
                
                // Register Form
                Form {
                    TextField("Username", text: $username)
                        .textFieldStyle(DefaultTextFieldStyle())
                        .autocorrectionDisabled()
                        .textContentType(.username)
                    
                    TextField("Email Adress", text: $email)
                        .textFieldStyle(DefaultTextFieldStyle())
                        .autocapitalization(/*@START_MENU_TOKEN@*/.none/*@END_MENU_TOKEN@*/)
                        .autocorrectionDisabled()
                        .textContentType(.emailAddress)
                    
                    SecureField("Password", text: $password)
                        .textFieldStyle(DefaultTextFieldStyle())
                        .autocorrectionDisabled()
                        .textContentType(.password)
                    
                    SecureField("Repeat Password", text: $repeatPassword)
                        .textFieldStyle(DefaultTextFieldStyle())
                        .autocorrectionDisabled()
                        .textContentType(.password)
                    
                    TDLButton(title: "Create an account", backgroundColor: Color.green, titleColor: Color.white) {
                        // Action
                    }
                }.offset(y: -80)
                
                // Already have an account
                VStack{
                    Text("Already have an account?")
                    NavigationLink("Log into it", destination: LoginView())
                    
                }
                .padding(.bottom, 30)
                
                Spacer()
            }
        }
    }
}

#Preview {
    RegisterView()
}
