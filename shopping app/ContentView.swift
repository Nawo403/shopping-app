//
//  ContentView.swift
//  shopping app
//
//  Created by Thilini Gunawardhana on 2024-03-27.
//

import SwiftUI

struct ContentView: View {
    enum ViewState {
        case login, signup, gallery, cart, payment, productDetail(Product)
    }
    
    @State private var username: String = ""
    @State private var password: String = ""
    @State private var confirmPassword: String = ""
    @State private var isLoggedIn: Bool = false
    @State private var viewState: ViewState = .login
    @State private var cart: [Product] = []
    @State private var products: [Product] = []
    
    var body: some View {
        ZStack {
            Color.cyan.opacity(0.2).edgesIgnoringSafeArea(.all)
            contentViewForCurrentState
        }
        
        onAppear(){
            fetchProducts()
        }
    }
    
    private var contentViewForCurrentState: some View {
            switch viewState {
        case .login:
            return AnyView(LoginView(username: $username, password: $password, isLoggedIn: $isLoggedIn, viewState: $viewState))
        case .signup:
            return AnyView(SignupView(username: $username, password: $password, confirmPassword: $confirmPassword, viewState: $viewState))
        case .gallery:
            return AnyView(ShoppingGalleryView(products: products, cart: $cart, addToCart: addToCart))
        case .cart:
            return AnyView(CartView(cart: $cart, viewState: $viewState, removeFromCart: removeFromCart))
        case .payment:
                return AnyView(PaymentView(viewState: $viewState, cart: $cart))
        case .productDetail(let product):
            return AnyView(ProductDetailView(product: product, cart: $cart, addToCart: addToCart, viewState: $viewState))
        }
    }
    func fetchProducts() {
        guard let url = URL(string: "https://your-backend-api.com/products") else { return }
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let data = data {
                do {
                    let decodedResponse = try JSONDecoder().decode([Product].self, from: data)
                    DispatchQueue.main.async {
                        self.products = decodedResponse
                    }
                } catch {
                    print("Error decoding products: \(error)")
                }
            }
        }.resume()
    }
    func addToCart(product: Product) {
        cart.append(product)
        viewState = .cart
       }
       
       func removeFromCart(product: Product) {
           if let index = cart.firstIndex(where: { $0.id == product.id }) {
               cart.remove(at: index)
           }
       }
    func checkout() {
           viewState = .payment
       }
   }
    
struct Product: Codable, Identifiable {
    let id: Int
    let name: String
    let imageName: String
    let price: Int
    let collections: [String]
}
    
    struct ContentView_Previews: PreviewProvider {
        static var previews: some View {
            ContentView()
        }
    }
