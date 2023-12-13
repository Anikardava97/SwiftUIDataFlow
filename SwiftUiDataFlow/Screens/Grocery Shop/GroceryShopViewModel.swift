//
//  GroceryShopViewModel.swift
//  SwiftUiDataFlow
//
//  Created by Ani's Mac on 10.12.23.
//

import SwiftUI

class GroceryShopViewModel: ObservableObject {
    
    // MARK: - Properties
    @Published var products = [Product]()
    private var tapCount = 0
    private var isCartView: Bool = false
    
    var totalCartItems: Int {
        return products.reduce(0) { $0 + $1.selectedAmount }
    }
    
    // MARK: - Init
    init() {
        self.products = productList.products
    }
    
    // MARK: - Functions
    
    func filteredProducts(for type: ProductType) -> [Product] {
        return products.filter { $0.type == type }
    }
    
    func incrementAmount(for product: Product) {
        if product.selectedAmount >= 0 && product.stock > 0 {
            objectWillChange.send()
            product.selectedAmount += 1
            product.stock -= 1
        }
    }
    
    func decrementAmount(for product: Product) {
        if product.selectedAmount > 0 {
            objectWillChange.send()
            product.selectedAmount -= 1
            product.stock += 1
        }
    }
    
    func systemName(for product: Product, isCartView: Bool) -> String {
        if isCartView && product.selectedAmount <= 1 {
            return "trash"
        } else {
            return "minus"
        }
    }
    
    func applyDiscount() {
        if tapCount < 1 {
            tapCount += 1
            products.forEach { product in
                product.price *= 0.8
            }
        }
    }
}
