//
//  RegisterViewModel.swift
//  ToDoList
//
//  Created by Bartek Prejs on 05/06/2024.
//

import Foundation
import Combine
import FirebaseAuth
import FirebaseFirestore

class RegisterViewModel: ObservableObject {
    
    @Published var username = ""
    @Published var email = ""
    @Published var password = ""
    @Published var repeatPassword = ""
    
    @Published var errorMessage = ""
    
    init(username: String = "", email: String = "", password: String = "", repeatPassword: String = "") {
        self.email = email
        self.username = username
        self.password = password
        self.repeatPassword = repeatPassword
    }
    
    func register() {
        errorMessage = ""
        
        guard validateInputs() else {
            return
        }
        
        Auth.auth().createUser(withEmail: email, password: password) { [weak self] result, error in
            guard let userId = result?.user.uid else {
                return
            }
            
            self?.insertUserRecord(id: userId)
        }
        
        print("Registered")
    }
    
    private func insertUserRecord(id: String) {
        let newUser = User(id: id, username: username, email: email, joined: Date().timeIntervalSince1970)
        let db = Firestore.firestore()
        
        db.collection("users")
            .document(id)
            .setData(newUser.asDictionary())
    }
    
    private func validateInputs() -> Bool {
        guard !username.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty else {
            errorMessage = "Username cannot be empty."
            return false
        }
        
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
        
        guard isValidPassword(password) else {
            errorMessage = "Password must be at least 8 characters long, contain at least one special character, one number, and one uppercase letter."
            return false
        }
        
        guard password == repeatPassword else {
            errorMessage = "Passwords do not match."
            return false
        }
        
        return true
    }
    
    private func isValidEmail(_ email: String) -> Bool {
        let emailRegEx = "^[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}$"
        let emailPred = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailPred.evaluate(with: email)
    }
    
    private func isValidPassword(_ password: String) -> Bool {
//        let passwordRegEx = "^(?=.*[A-Z])(?=.*[a-z])"
//        let passwordPred = NSPredicate(format: "SELF MATCHES %@", passwordRegEx)
//        return passwordPred.evaluate(with: password)
        return true
    }
}
