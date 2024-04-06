//
//  CartView.swift
//  shopping app
//
//  Created by Thilini Gunawardhana on 2024-04-01.
//

import Foundation
import SwiftUI
import UIKit

struct CartView: View {
    @Binding var cart: [Product]
    @Binding var viewState: ContentView.ViewState
    var removeFromCart: (Product) -> Void
    
    var body: some View {
        NavigationView {
            List {
                ForEach(cart) { product in
                    CartItemView(product: product, removeFromCart: removeFromCart)
                }
            }
            .navigationBarTitle("Cart")
            .navigationBarItems(
                            leading: Button(action: {
                                self.viewState = .gallery
                            }) {
                                
                                Text("Back")
                            },
                            trailing: Button("Checkout") {
                                self.viewState = .payment
                            }
                )
        }
    }
}
