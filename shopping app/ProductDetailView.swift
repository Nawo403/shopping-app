//
//  ProductDetailView.swift
//  shopping app
//
//  Created by Thilini Gunawardhana on 2024-04-01.
//

import Foundation
import SwiftUI
import UIKit

struct ProductDetailView: View {
    let product: Product
    @Binding var cart: [Product]
    var addToCart: (Product) -> Void
    @Binding var viewState: ContentView.ViewState
    
    var body: some View {
        VStack {
            Image(product.imageName)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(height: 200)
            Text(product.name)
                .font(.title)
                .padding()
            Text("Price: $\(product.price)")
                .font(.headline)
            Spacer()
            
            Button(action: {
                addToCart(product)
                viewState = .cart
            }) {
                Text("Add to cart")
                    .foregroundColor(.white)
                    .padding()
                    .background(Color.blue)
                    .cornerRadius(8)
            }
            .padding()
        }
        .navigationBarTitle(product.name)
    }
}
