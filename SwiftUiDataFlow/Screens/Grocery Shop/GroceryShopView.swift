//
//  GroceryShopView.swift
//  SwiftUiDataFlow
//
//  Created by Ani's Mac on 09.12.23.
//

import SwiftUI

struct GroceryShopView: View {
    
    // MARK: - Properties
    private var backgroundColor = Color(red: 250/255, green: 250/255, blue: 250/255)
    private var accentColor =  Color(red: 35/255, green: 170/255, blue: 73/255)
    
    @StateObject var viewModel = GroceryShopViewModel()
    
    // MARK: - Body
    
    var body: some View {
        
        NavigationView {
            VStack(spacing: 16) {
                
                List {
                    Section {
                        ForEach(viewModel.filteredProducts(for: .fruit)) { fruit in
                            ProductRow(product: fruit)
                        }
                    } header: {
                        Text("Fruits")
                    }
                    
                    Section {
                        ForEach(viewModel.filteredProducts(for: .vegetable)) { vegetable in
                            ProductRow(product: vegetable)
                        }
                    } header: {
                        Text("Vegetables")
                    }
                }
                
                Button {
                    viewModel.applyDiscount()
                } label: {
                    DiscountButton(accentColor: accentColor)
                }
            }
            
            .navigationTitle("Grocery Shop")
            .navigationBarTitleDisplayMode(.inline)
            .navigationBarItems(
                trailing:
                    NavigationLink(destination: {
                        CartView(cartViewModel: CartViewModel(products: viewModel.products))
                    }, label: {
                        CartImageView(accentColor: accentColor, text: "\(viewModel.totalCartItems)")
                    }).padding(.horizontal, 16)
            )
        }
        .environmentObject(viewModel)
    }
}

#Preview {
    GroceryShopView()
}
