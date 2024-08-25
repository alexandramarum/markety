//
//  MyItemsView.swift
//  markety
//
//  Created by Alexandra Marum on 8/25/24.
//

import SwiftUI

struct MyItemsView: View {
    @ObservedObject var vm: ProductListViewModel
    
    var body: some View {
        NavigationStack {
            VStack {
                if vm.favorites.isEmpty {
                        Image(systemName: "heart.slash")
                            .font(.largeTitle)
                            .foregroundStyle(.secondary)
                            .frame(maxWidth: .infinity, maxHeight: .infinity)
                } else {
                    ScrollView {
                        ForEach(vm.favorites) { product in
                            ProductRowView(vm: vm, product: product)
                        }
                    }
                }
            }
            .background {
                Color("BackgroundGray")
                    .ignoresSafeArea()
            }
            .navigationTitle("My Items")
        }
        .preferredColorScheme(.dark)
    }
}

#Preview {
    MyItemsView(vm: ProductListViewModel())
}
