//
//  CartItemView.swift
//  shopping app
//
//  Created by Thilini Gunawardhana on 2024-04-01.
//

import Foundation
import SwiftUI
import UIKit

struct CartItemView: View {
    let product: Product
    var removeFromCart: (Product) -> Void
    
    var body: some View {
        HStack {
            Text(product.name)
            Spacer()
            Button(action: {
                removeFromCart(product)
            }) {
                Image(systemName: "minus.circle.fill")
                    .foregroundColor(.red)
            }
        }
    }
}
