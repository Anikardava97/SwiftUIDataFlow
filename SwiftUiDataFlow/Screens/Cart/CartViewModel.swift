//
//  CartViewModel.swift
//  SwiftUiDataFlow
//
//  Created by Ani's Mac on 10.12.23.
//

import SwiftUI

class CartViewModel: ObservableObject {
    
    // MARK: - Properties
    @Published var products: [Product] = []
    
    var totalPrice: Double {
        return products.reduce(0) { total, product in
            total + ((product.price) * Double(product.selectedAmount))
        }
    }
    
    // MARK: - Body
    init(products: [Product]) {
        self.products = products.filter { $0.selectedAmount > 0 }
    }
}
