//
//  CryptoApp.swift
//  Crypto
//
//  Created by Sarika on 07.05.22.
//

import SwiftUI

@main
struct CryptoApp: App {
    //all the view of the app will have access to vm var because we are passing in with environmentObject.
    @State private var vm = HomeViewModel()
    
    init() {
        UINavigationBar.appearance().largeTitleTextAttributes = [.foregroundColor : UIColor(Color.theme.accent)]
        UINavigationBar.appearance().titleTextAttributes = [.foregroundColor : UIColor(Color.theme.accent)]
    }
    
    var body: some Scene {
        WindowGroup {
            NavigationView {
                HomeView()
                    .navigationBarHidden(true)
            }
            .environmentObject(vm)
        }
    }
}
