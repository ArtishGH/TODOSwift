//
//  LoginView.swift
//  ToDoList
//
//  Created by Bartek Prejs on 05/06/2024.
//

import SwiftUI

struct LoginView: View {
    
    @StateObject var viewModel = LoginViewModel()
    
    var body: some View {
        NavigationView {
            VStack {
                // Header
                HeaderView(title: "To Do List", subtitle: "Get shit done", angle: 15, backgroundColor: Color.orange)
                
                // Login Form
                Form {
                    TextField("Email Adress", text: $viewModel.email)
                        .textFieldStyle(DefaultTextFieldStyle())
                        .autocapitalization(.none)
                        .autocorrectionDisabled()
                        .textContentType(.emailAddress)
                    
                    SecureField("Password", text: $viewModel.password)
                        .textFieldStyle(DefaultTextFieldStyle())
                        .textContentType(.password)
                    
                    TDLButton(title: "Log in", backgroundColor: Color.orange, titleColor: Color.white) {
                        viewModel.login()
                    }
                    if !viewModel.errorMessage.isEmpty {
                        Text(viewModel.errorMessage)
                            .foregroundStyle(Color.red)
                            .frame(maxWidth: .infinity, alignment: .center)
                    }
                }.offset(y: -80)
                
                // Create Account
                VStack{
                    Text("New around here?")
                    NavigationLink("Create an account", destination: RegisterView())
                    
                }
                .padding(.bottom, 30)
                
                Spacer()
            }
        }
    }
}

#Preview {
    LoginView()
}
