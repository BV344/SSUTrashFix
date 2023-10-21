//
//  LoginViewViewModel.swift
//  TrashFix
//
//  Created by Brayan Vizcaino on 10/20/23.
//

//Everything you need to Sign in a User.
//Also, this uses our database to know if login is correct/incorrect
import FirebaseAuth
import Foundation

class LoginViewViewModel: ObservableObject{
    @Published var email = ""
    @Published var password = ""
    @Published var errorMessage = ""
    
    init(){}
    
    func login() {
        guard validate() else {
            return
        }
        //Try log in
        Auth.auth().signIn(withEmail: email, password: password) { authResult, error in
            if let error = error as NSError? {
                let errorCode = error.code
                switch errorCode {
                case AuthErrorCode.invalidEmail.rawValue:
                    self.errorMessage = "Please enter a valid email."
                case AuthErrorCode.wrongPassword.rawValue:
                    self.errorMessage = "The password is incorrect."
                case AuthErrorCode.userNotFound.rawValue:
                    self.errorMessage = "This account does not exist."
                default:
                    self.errorMessage = "Login failed."
                }
            }
        }
    }
    
    private func validate() -> Bool{
        errorMessage = ""
        
        guard !email.trimmingCharacters(in: .whitespaces).isEmpty,
              !password.trimmingCharacters(in: .whitespaces).isEmpty
        else {
            
            errorMessage = "Please fill in all fields."
            return false
        }
        //email@foo.com
        guard email.contains("@") && email.contains(".") else {
            errorMessage = "Please enter a valid email."
            return false
        }
        
        return true
    }
}
