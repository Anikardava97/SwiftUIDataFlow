//
//  CartView.swift
//  SwiftUiDataFlow
//
//  Created by Ani's Mac on 10.12.23.
//

import SwiftUI

struct CartView: View {
    // MARK: - Properties
    var backgroundColor = Color(red: 250/255, green: 250/255, blue: 250/255)
    var accentColor =  Color(red: 35/255, green: 170/255, blue: 73/255)
    
    @EnvironmentObject var groceryShopViewModel: GroceryShopViewModel
    let cartViewModel: CartViewModel
    
    // MARK: - Body
    var body: some View {
        
        VStack(spacing: 16) {
            
            Text("My Cart")
                .font(.system(size: 16))
                .fontWeight(.bold)
            
            Spacer()
            
            if cartViewModel.products.isEmpty {
                Image("emptyCart")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(height: 200)
                
                Spacer()
                
            } else {
                List {
                    ForEach(cartViewModel.products) { product in
                        ProductRow(product: product, isCartView: true)
                    }
                }
                
                Button {
                    
                } label: {
                    Text("Total Price: $\(String(format: "%.1f", cartViewModel.totalPrice))")
                        .foregroundStyle(.white)
                        .font(.system(size: 16))
                        .fontWeight(.bold)
                        .frame(maxWidth: .infinity)
                        .frame(height: 44)
                        .background(accentColor)
                        .cornerRadius(8)
                        .padding(.horizontal, 16)
                }
            }
        }
    }
}
