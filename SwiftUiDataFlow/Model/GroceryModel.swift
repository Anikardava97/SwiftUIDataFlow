//
//  GroceryModel.swift
//  SwiftUiDataFlow
//
//  Created by Ani's Mac on 10.12.23.
//

import SwiftUI

enum ProductType {
    case fruit, vegetable
}

class Product: Identifiable, ObservableObject {
    let id = UUID()
    let title: String
    @Published var price: Double
    @Published var stock: Int
    let image: Image
    @Published var selectedAmount = 0
    let type: ProductType
    var isAdded: Bool = false
    
    init(title: String, price: Double, stock: Int, image: Image, selectedAmount: Int = 0, type: ProductType) {
        self.title = title
        self.price = price
        self.stock = stock
        self.image = image
        self.selectedAmount = selectedAmount
        self.type = type
    }
}

struct productList {
    static let products = [
        Product(title: "peach", price: 4.3, stock: 10, image: Image("peach"), type: .fruit),
        Product(title: "pineapple", price: 4.8, stock: 20, image: Image("pineapple"), type: .fruit),
        Product(title: "pomegranate", price: 6.8, stock: 12, image: Image("pomegranate"), type: .fruit),
        Product(title: "orange", price: 2.8, stock: 23, image: Image("orange"), type: .fruit),
        Product(title: "banana", price: 1.8, stock: 10, image: Image("banana"), type: .fruit),
        Product(title: "strawberry", price: 1.4, stock: 6, image: Image("strawberry"), type: .fruit),
        Product(title: "watermelon", price: 6.4, stock: 19, image: Image("watermelon"), type: .fruit),
        Product(title: "carrot", price: 1.5, stock: 40, image: Image("carrot"), type: .vegetable),
        Product(title: "cauliflower", price: 1.9, stock: 30, image: Image("cauliflower"), type: .vegetable),
        Product(title: "chilli", price: 1.0, stock: 19, image: Image("chilli"), type: .vegetable),
        Product(title: "corn", price: 4.0, stock: 13, image: Image("corn"), type: .vegetable),
        Product(title: "eggplant", price: 3.0, stock: 19, image: Image("eggplant"), type: .vegetable),
        Product(title: "garlic", price: 1.0, stock: 50, image: Image("garlic"), type: .vegetable),
        Product(title: "onion", price: 0.7, stock: 46, image: Image("onion"), type: .vegetable),
        Product(title: "paprica", price: 1.9, stock: 12, image: Image("paprica"), type: .vegetable),
        Product(title: "turnip", price: 4.9, stock: 20, image: Image("turnip"), type: .vegetable),
        Product(title: "romanesco", price: 0.6, stock: 12, image: Image("romanesco"), type: .vegetable)
    ]
}


