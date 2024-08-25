//
//  ProductListView.swift
//  markety
//
//  Created by Alexandra Marum on 8/24/24.
//

import SwiftUI

struct ProductListView: View {
    @ObservedObject var vm: ProductListViewModel
    @State var search: String = ""
    @State var searchResults: [Product] = []

    var body: some View {
        NavigationStack {
            VStack {
                ScrollView {
                    if !search.isEmpty {
                        HStack {
                            Text("\(searchResults.count) results for **\"\(search)\"**")
                                .padding()
                            Spacer()
                        }
                        ForEach(searchResults) { product in
                            ProductRowView(vm: vm, product: product)
                        }
                    } else {
                        ForEach(vm.products) { product in
                            ProductRowView(vm: vm, product: product)
                        }
                    }
                }
                .searchable(text: $search, placement: .navigationBarDrawer(displayMode: .always), prompt: "What are you looking for?")
                .onChange(of: search) {
                    searchResults = self.searchProducts(for: search)
                }
            }
            .background {
                Color("BackgroundGray")
                    .ignoresSafeArea()
            }
        }
        .task {
            do {
                try await vm.fetchProducts()
            } catch {
                print(error.localizedDescription)
            }
        }
    }

    private func searchProducts(for query: String) -> [Product] {
        let lowercasedQuery = query.lowercased()
        return vm.products.filter { product in
            product.title.lowercased().contains(lowercasedQuery) ||
                product.description.lowercased().contains(lowercasedQuery) ||
                product.tags.contains { tag in
                    tag.lowercased().contains(lowercasedQuery)
                }
        }
    }
}

#Preview {
    ProductListView(vm: ProductListViewModel())
        .preferredColorScheme(.dark)
}
