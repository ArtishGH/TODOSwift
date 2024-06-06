//
//  RegisterView.swift
//  ToDoList
//
//  Created by Bartek Prejs on 05/06/2024.
//

import SwiftUI
import FirebaseAuth

struct RegisterView: View {
    
    @StateObject var viewModel = RegisterViewModel()
    
    var body: some View {
        NavigationView {
            VStack {
                // Header
                HeaderView(title: "Register", subtitle: "Start orginizing time", angle: -15, backgroundColor: Color.green)
                
                // Register Form
                Form {
                    TextField("Username", text: $viewModel.username)
                        .textFieldStyle(DefaultTextFieldStyle())
                        .autocorrectionDisabled()
                        .textContentType(.username)
                    
                    TextField("Email Adress", text: $viewModel.email)
                        .textFieldStyle(DefaultTextFieldStyle())
                        .autocapitalization(.none)
                        .autocorrectionDisabled()
                        .textContentType(.emailAddress)
                    
                    SecureField("Password", text: $viewModel.password)
                        .textFieldStyle(DefaultTextFieldStyle())
                        .autocorrectionDisabled()
                        .textContentType(.password)
                    
                    SecureField("Repeat Password", text: $viewModel.repeatPassword)
                        .textFieldStyle(DefaultTextFieldStyle())
                        .autocorrectionDisabled()
                        .textContentType(.password)
                    
                    TDLButton(title: "Create an account", backgroundColor: Color.green, titleColor: Color.white) {
                        viewModel.register()
                    }
                    if !viewModel.errorMessage.isEmpty {
                        Text(viewModel.errorMessage)
                            .foregroundStyle(Color.red)
                            .frame(maxWidth: .infinity, alignment: .center)
                    }
                }.offset(y: -80)
                
                // Already have an account
//                VStack{
//                    Text("Already have an account?")
//                    NavigationLink("Log into it", destination: LoginView())
//                    
//                }
//                .padding(.bottom, 30)
                
                Spacer()
            }
        }
    }
}

#Preview {
    RegisterView()
}
