//
//  DecrementButton.swift
//  SwiftUiDataFlow
//
//  Created by Ani's Mac on 12.12.23.
//

import SwiftUI

struct DecrementButton: View {
    
    @ObservedObject var product: Product
    var isCartView: Bool
    @EnvironmentObject var viewModel: GroceryShopViewModel
    
    var body: some View {
        Button(action: {
            viewModel.decrementAmount(for: product)
        }) {
            Group {
                Image(systemName: viewModel.systemName(for: product, isCartView: isCartView))
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
    }
}
