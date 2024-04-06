//
//  LoginView.swift
//  shopping app
//
//  Created by Thilini Gunawardhana on 2024-04-01.
//

import Foundation
import SwiftUI
import UIKit

struct LoginView: View {
    @ Binding var username: String
    @ Binding var password: String
    @ Binding var isLoggedIn: Bool
    @ Binding var viewState: ContentView.ViewState
    
    var body: some View {
        VStack {
            Image("logo")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 200, height: 200)
                .clipShape(Circle())
            
            TextField("Username", text: $username)
                .padding()
                .textFieldStyle(RoundedBorderTextFieldStyle())
            SecureField("Password", text: $password)
                .padding()
                .textFieldStyle(RoundedBorderTextFieldStyle())
            Button(action: {
                if !self.username.isEmpty && !self.password.isEmpty {
                    self.isLoggedIn = true
                    self.viewState = .gallery
                }
            }) {
                Text("Login")
            }
            .padding()
            .disabled(username.isEmpty || password.isEmpty)
            
            Button(action: {
                self.viewState = .signup
            }) {
                Text("Create an Account")
            }
        }
    }
}
