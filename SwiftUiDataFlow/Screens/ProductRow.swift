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
                    
                    Button(action: {
                        viewModel.decrementAmount(for: product)
                    }) {
                        Group {
                            if isCartView && product.selectedAmount <= 1 {
                                Image(systemName: "trash")
                            } else {
                                Image(systemName: "minus")
                            }
                        }
                        .foregroundStyle(Color(red: 151/255, green: 152/255, blue: 153/255))
                        .background(
                            Circle()
                                .stroke(Color(red: 241/255, green: 241/255, blue: 245/255))
                                .fill(Color(red: 243/255, green: 245/255, blue: 247/255))
                                .frame(width: 32, height: 32)
                        )
                    }
                    .buttonStyle(BorderlessButtonStyle())
                    
                    Text("\(product.selectedAmount)")
                        .font(.system(size: 16))
                        .fontWeight(.bold)
                        .frame(width: 24)
                    
                    Button {
                        viewModel.incrementAmount(for: product)
                    } label: {
                        IncrementButton()
                    }
                }
            }
        }
    }
}

#Preview {
    ProductRow(product: productList.products[0])
}
