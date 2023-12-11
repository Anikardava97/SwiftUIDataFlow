//
//  DiscountButton.swift
//  SwiftUiDataFlow
//
//  Created by Ani's Mac on 10.12.23.
//

import SwiftUI

struct DiscountButton: View {
    var accentColor: Color
    
    var body: some View {
        Text("Get 20% Off".uppercased())
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

#Preview {
    DiscountButton(accentColor: .white)
}
