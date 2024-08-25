//
//  ProductRowView.swift
//  markety
//
//  Created by Alexandra Marum on 8/24/24.
//

import SwiftUI

struct ProductRowView: View {
    @ObservedObject var vm: ProductListViewModel
    var product: Product

    var body: some View {
        VStack {
            HStack {
                AsyncImage(url: URL(string: product.thumbnail)) { phase in
                    if let image = phase.image {
                        image.resizable()
                            .scaledToFit()
                            .frame(width: 128, height: 128)
                    } else if phase.error != nil {
                        Text("No image")
                    } else {
                        Image(systemName: "photo")
                    }
                }
                VStack(alignment: .leading, spacing: 4) {
                    Text(product.title)
                        .lineLimit(1)
                    Text(String(format: "$%.2f", product.price))
                        .font(.title3)
                        .bold()
                    Text(product.category.capitalized)
                        .font(.footnote)
                        .padding(4)
                        .background {
                            RoundedRectangle(cornerRadius: 5)
                                .foregroundStyle(Color("CategoryGray"))
                        }
                    HStack {
                        Button {
                            if vm.cart.contains(where: {$0.id == product.id} ) {
                                if let index = vm.cart.firstIndex(where: {$0.id == product.id}) {
                                    vm.cart.remove(at: index)
                                }
                            } else {
                                vm.cart.append(product)
                            }
                        } label: {
                            if vm.cart.contains(where: {$0.id == product.id} ){
                                Text("Remove from Cart")
                                    .frame(width: 173, height: 36)
                                    .font(.body)
                                    .foregroundStyle(.white)
                                    .background {
                                        Capsule()
                                    }
                            } else {
                                Text("Add to Cart")
                                    .frame(width: 173, height: 36)
                                    .font(.body)
                                    .foregroundStyle(.white)
                                    .background {
                                        Capsule()
                                    }
                            }
                        }
                        Button {
                            if vm.favorites.contains(where: {$0.id == product.id} ) {
                                if let index = vm.favorites.firstIndex(where: {$0.id == product.id}) {
                                    vm.favorites.remove(at: index)
                                }
                            } else {
                                vm.favorites.append(product)
                            }
                        } label: {
                            Image(systemName: vm.favorites.contains(where: {$0.id == product.id} ) ? "heart.fill" : "heart")
                                .frame(width: 36, height: 36)
                                .foregroundStyle(.white)
                                .background {
                                    Circle()
                                        .foregroundStyle(Color("CategoryGray"))
                                }
                        }
                    }
                    .padding(4)
                }
                Spacer()
            }
            .padding()
        }
        .background {
            Color("BackgroundGray")
                .ignoresSafeArea()
        }
        .preferredColorScheme(.dark)
    }
}

#Preview {
    ProductRowView(vm: ProductListViewModel(), product: Product.example)
}

