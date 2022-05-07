//
//  CryptoApp.swift
//  Crypto
//
//  Created by Sarika on 07.05.22.
//

import SwiftUI

@main
struct CryptoApp: App {
    var body: some Scene {
        WindowGroup {
            NavigationView {
                HomeView()
                    .navigationBarHidden(true)
            }
        }
    }
}
