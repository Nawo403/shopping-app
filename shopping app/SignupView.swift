//
//  SignupView.swift
//  shopping app
//
//  Created by Thilini Gunawardhana on 2024-04-01.
//

import Foundation
import SwiftUI
import UIKit

struct SignupView: View {
    @Binding var username: String
    @Binding var password: String
    @Binding var confirmPassword: String
    @Binding var viewState: ContentView.ViewState
    
    var body: some View {
        VStack {
            TextField("Username", text: $username)
                .padding()
                .textFieldStyle(RoundedBorderTextFieldStyle())
            SecureField("Password", text: $password)
                .padding()
                .textFieldStyle(RoundedBorderTextFieldStyle())
            SecureField("Confirm Password", text: $confirmPassword)
                .padding()
                .textFieldStyle(RoundedBorderTextFieldStyle())
            Button(action: {
                if !self.username.isEmpty && !self.password.isEmpty && !self.confirmPassword.isEmpty && self.password == self.confirmPassword {
                    self.viewState = .gallery
                }
            }) {
                Text("Create Account")
            }
            .padding()
            .disabled(username.isEmpty || password.isEmpty || confirmPassword.isEmpty || password != confirmPassword)
            
            Button(action: {
                self.viewState = .login
            }) {
                Text("Back to Login")
            }
        }
    }
}
