//
//  ContentView.swift
//  markety
//
//  Created by Alexandra Marum on 8/24/24.
//

import SwiftUI

struct ContentView: View {
    @StateObject var vm: ProductListViewModel = .init()

    var body: some View {
        VStack {
            TabView {
                ProductListView(vm: vm)
                    .tabItem {
                        Image(systemName: "carrot.fill")
                        Text("Products")
                    }
                MyItemsView(vm: vm)
                    .tabItem {
                        Image(systemName: "heart")
                        Text("My Items")
                    }
                CartView(vm: vm)
                    .tabItem {
                        Image(systemName: "cart")
                        Text("Cart")
                    }
                    .badge(vm.cart.count)
            }
        }
        .background {
            Color("BackgroundGray")
                .ignoresSafeArea()
        }
        .preferredColorScheme(.dark)
    }
}

#Preview {
    ContentView()
}
