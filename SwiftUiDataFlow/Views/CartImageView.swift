//
//  CartImageView.swift
//  SwiftUiDataFlow
//
//  Created by Ani's Mac on 10.12.23.
//

import SwiftUI

struct CartImageView: View {
    var accentColor: Color
    var text: Text
    
    var body: some View {
        Image(systemName: "cart")
            .foregroundStyle(.black)
        
            .overlay(Circle()
                .fill(accentColor)
                .frame(width: 16, height: 16)
                .overlay(
                    Text("text")
                        .font(.system(size: 10))
                        .fontWeight(.bold)
                        .foregroundStyle(.white))
                    .offset(x: 5, y:-8)
                     , alignment: .topTrailing)
    }
}

#Preview {
    CartImageView(accentColor: .white, text: Text("123"))
}
