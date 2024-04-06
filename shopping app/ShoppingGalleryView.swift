//
//  ShoppingGalleryView.swift
//  shopping app
//
//  Created by Thilini Gunawardhana on 2024-04-01.
//

import Foundation
import SwiftUI
import UIKit

struct ShoppingGalleryView: View {
    @State private var showAlert = false
    @State private var selectedProduct: Product?
    var products: [Product]
    @Binding var cart: [Product]
    var addToCart: (Product) -> Void
    
    var body: some View {
        NavigationView {
            List(products, id: \.id) { product in
                NavigationLink(destination: ProductDetailView(product: product, cart: $cart, addToCart: addToCart, viewState: .constant(.gallery))) {
                    ProductRowView(product: product, addToCart: addToCart)
                }
            }
            .navigationBarTitle("Shopping Gallery")
        }
    }
}
