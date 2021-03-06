//
//  Grandmas_RecipesApp.swift
//  Grandmas Recipes
//
//  Created by Darrien Huntley on 3/5/21.
//

import SwiftUI
import Firebase

@main
struct Grandmas_RecipesApp: App {

    init() {
        FirebaseApp.configure()
    }
    var body: some Scene {
        WindowGroup {
          //  TabRootView()
           // SignupView()
            AppNavigation().environmentObject(AuthViewModel.shared)

            
        }
    }
}
