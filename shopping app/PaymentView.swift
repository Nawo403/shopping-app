//
//  PaymentView.swift
//  shopping app
//
//  Created by Thilini Gunawardhana on 2024-04-01.
//

import Foundation
import SwiftUI
import UIKit

struct PaymentView: View {
    @Binding var viewState: ContentView.ViewState
    @Binding var cart: [Product]
    @State private var cardNumber = ""
    @State private var cardholderName = ""
    @State private var cvv = ""
    @State private var selectedPaymentMethod = PaymentMethod.debit
        
    enum PaymentMethod {
        case debit, credit
    }
    var totalAmount: Int {
            cart.reduce(0) { $0 + $1.price }
        }
    
    var body: some View {
        VStack {
            Text("Payment")
                .font(.title)
                .padding()
            
            Picker("Payment Method", selection: $selectedPaymentMethod) {
                Text("Cash").tag(PaymentMethod.debit)
                Text("Card").tag(PaymentMethod.credit)
            }
            .pickerStyle(SegmentedPickerStyle())
            .padding()
            
            if selectedPaymentMethod == .credit {
                TextField("Card Number", text: $cardNumber)
                                    .padding()
                                    .textFieldStyle(RoundedBorderTextFieldStyle())
                                TextField("Cardholder Name", text: $cardholderName)
                                    .padding()
                                    .textFieldStyle(RoundedBorderTextFieldStyle())
                                TextField("CVV", text: $cvv)
                                    .padding()
                                    .textFieldStyle(RoundedBorderTextFieldStyle())
                            }
                            
                            Text("Total Amount: $\(totalAmount)")
                                .padding()
            Button(action: {
                switch selectedPaymentMethod {
                  case .debit:
                    print("Payment Method: Debit")
                  case .credit:
                    print("Payment Method: Credit")
                    print("Card Number: \(cardNumber)")
                    print("Cardholder Name: \(cardholderName)")
                    print("CVV: \(cvv)")
        }
                                
                print("Total Amount: $\(totalAmount)")
                self.viewState = .gallery
            }) {
                Text("Pay Now")
                   .foregroundColor(.white)
                   .padding()
                   .background(Color.blue)
                   .cornerRadius(8)
                }
            }
            .padding()
        }
    }
