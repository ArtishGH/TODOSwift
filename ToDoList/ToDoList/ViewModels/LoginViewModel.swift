//
//  LoginViewModel.swift
//  ToDoList
//
//  Created by Bartek Prejs on 05/06/2024.
//

import Foundation
import FirebaseAuth

class LoginViewModel: ObservableObject {
    
    @Published var email = ""
    @Published var password = ""
    
    @Published var errorMessage = ""
    
    init(email: String = "", password: String = "") {
        self.email = email
        self.password = password
    }
    
    func login() {
        errorMessage = ""
        
        guard validateInputs() else {
            return
        }
        
        Auth.auth().signIn(withEmail: email, password: password)
        
        print("Logged In")
    }
    
    private func validateInputs() -> Bool {
        guard !email.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty else {
            errorMessage = "Email cannot be empty."
            return false
        }
        
        guard isValidEmail(email) else {
            errorMessage = "Email is not valid."
            return false
        }
        
        guard !password.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty else {
            errorMessage = "Password cannot be empty."
            return false
        }
        
        return true
    }
    
    private func isValidEmail(_ email: String) -> Bool {
        let emailRegEx = "^[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}$"
        let emailPred = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailPred.evaluate(with: email)
    }
}
