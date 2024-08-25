//
//  CartView.swift
//  markety
//
//  Created by Alexandra Marum on 8/24/24.
//

import SwiftUI

struct CartView: View {
    @ObservedObject var vm: ProductListViewModel
    @State private var isPickup = true
    @State var total = 0.0
    
    var body: some View {
        NavigationStack {
            VStack {
                HStack {
                    Menu {
                        Button {
                            isPickup = true
                        } label: {
                            Text("Pick up")
                            if isPickup {
                                Image(systemName: "checkmark")
                            }
                        }
                        Button {
                            isPickup = false
                        } label: {
                            Text("Delivery")
                            if !isPickup {
                                Image(systemName: "checkmark")
                            }
                        }
                    } label: {
                        Text(isPickup ? "Pick up" : "Delivery")
                            .foregroundStyle(.white)
                            .bold()
                            .font(.callout)
                        Image(systemName: "chevron.down")
                            .foregroundStyle(.white)
                            .bold()
                            .font(.callout)
                    }
                    
                    if isPickup {
                        Text("from")
                            .foregroundStyle(.secondary)
                    } else {
                        Text("to")
                            .foregroundStyle(.secondary)
                    }
                    Text("Cupertino")
                        .underline()
                        .bold()
                        .font(.callout)
                    Spacer()
                }
                .padding(.leading)
                ScrollView {
                    ForEach(vm.cart) { product in
                        CartRowView(product: product)
                    }
                    VStack {
                        HStack {
                            Text("\(String(format: "$%.2f", total)) total")
                                .font(.title3)
                                .bold()
                            Spacer()
                            Image(systemName: "chevron.down")
                        }
                        HStack {
                            if vm.cart.count == 1 {
                                Text("\(vm.cart.count) item")
                                    .foregroundStyle(.secondary)
                            } else {
                                Text("\(vm.cart.count) items")
                                    .foregroundStyle(.secondary)
                            }
                            Spacer()
                        }
                    }
                    .padding()
                    .frame(width: 361, height: 86)
                    .background {
                        RoundedRectangle(cornerRadius: 8.0)
                            .fill(Color("CheckoutGray"))
                    }
                }
                
                Button {
                    vm.cart.removeAll()
                    total = 0.0
                } label: {
                    Text("Check out")
                        .frame(width: 361, height: 36)
                        .foregroundStyle(.white)
                        .background {
                            Capsule()
                        }
                        .padding()
                }
            }
            .background {
                Color("BackgroundGray")
                    .ignoresSafeArea()
            }
            .navigationTitle("Cart")
        }
        .preferredColorScheme(.dark)
        .onAppear {
            total = vm.calcTotal()
        }
    }
}

#Preview {
    CartView(vm: ProductListViewModel())
}
