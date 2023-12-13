//
//  IncrementButton.swift
//  SwiftUiDataFlow
//
//  Created by Ani's Mac on 11.12.23.
//

import SwiftUI

struct IncrementButton: View {
    
    @ObservedObject var product: Product
    @EnvironmentObject var viewModel: GroceryShopViewModel
    
    var body: some View {
        Button {
            viewModel.incrementAmount(for: product)
        } label: {
            Image(systemName: "plus")
                .foregroundStyle(.white)
                .background(
                    Circle()
                        .fill(Color(red: 35/255, green: 170/255, blue: 73/255))
                        .frame(width: 32, height: 32)
                )
        }
        .buttonStyle(BorderlessButtonStyle())
    }
}


