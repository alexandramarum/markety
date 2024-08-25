//
//  CartRowView.swift
//  markety
//
//  Created by Alexandra Marum on 8/24/24.
//

import SwiftUI

struct CartRowView: View {
    var product: Product
    
    var body: some View {
        HStack {
            AsyncImage(url: URL(string: product.thumbnail)) { phase in
                if let image = phase.image {
                    image.resizable()
                        .scaledToFit()
                        .frame(width: 40, height: 40)
                } else if phase.error != nil {
                    Image(systemName: "photo")
                } else {
                    Image(systemName: "photo")
                }
            }
            Text(product.title)
                .lineLimit(1)
                .frame(maxWidth: 170, alignment: .leading)
            Spacer()
            Text(String(format: "$%.2f", product.price))
                .font(.title3)
                .bold()
        }
        .padding(.leading)
        .padding(.trailing)
        .padding(.bottom)
        .background {
            Color("BackgroundGray")
                .ignoresSafeArea()
        }
        .preferredColorScheme(.dark)
    }
}

#Preview {
    CartRowView(product: Product.example)
}
