//
//  marketyApp.swift
//  markety
//
//  Created by Alexandra Marum on 8/24/24.
//

import SwiftUI

@main
struct marketyApp: App {
    var body: some Scene {
        WindowGroup {
                ContentView()
                .background {
                    Color("BackgroundGray")
                        .ignoresSafeArea()
                   }
                .preferredColorScheme(.dark)
        }
    }
}
