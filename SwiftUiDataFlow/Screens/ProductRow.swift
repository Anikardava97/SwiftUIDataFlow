//
//  ProductRow.swift
//  SwiftUiDataFlow
//
//  Created by Ani's Mac on 10.12.23.
//

import SwiftUI

struct ProductRow: View {
    
    @EnvironmentObject var viewModel: GroceryShopViewModel
    
    @ObservedObject var product: Product
    
    var isCartView = false
    
    var body: some View {
        
        VStack(spacing: 12) {
            HStack {
                product.image
                    .resizable()
                    .scaledToFit()
                    .frame(width: 80, height: 80)
                
                VStack(alignment: .leading) {
                    Text(product.title.capitalized)
                        .fontWeight(.bold)
                    
                    Text("$\(String(format: "%.1f", product.price))")
                        .fontWeight(.medium)
                    
                    Text("Stock: \(product.stock)")
                        .font(.caption)
                }
                
                Spacer()
                
                HStack(spacing: 20) {
                    
                    DecrementButton(product: product, isCartView: isCartView)
                    
                    Text("\(product.selectedAmount)")
                        .font(.system(size: 16))
                        .fontWeight(.bold)
                        .frame(width: 24)
                    
                    IncrementButton(product: product)
                }
            }
        }
    }
}

#Preview {
    ProductRow(product: productList.products[0])
}
