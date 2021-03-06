//
//  AppNavigation.swift
//  Grandmas Recipes
//
//  Created by Darrien Huntley on 3/6/21.
//

import SwiftUI
import Kingfisher

struct AppNavigation: View {
    @EnvironmentObject var viewModel: AuthViewModel
    @State var selectedIndex = 0
    var body: some View {
        Group {
            if viewModel.userSession != nil {
                
                NavigationView {
                    VStack {
                        MainTabView(selectedIndex : $selectedIndex)
                    }
                    .navigationBarTitle(tabTitle(forIndex: selectedIndex))
                    .navigationBarTitleDisplayMode(.inline)
                }
            } else {
                LoginView()
                
            }
        }
        
    }
    
    // NOT WORKING
    func tabTitle(forIndex index : Int) -> String {
        switch index {
        case 0: return "Home"
        case 1: return "Search"
        case 2: return "Messages"
        default: return ""
        }
    }
}

struct AppNavigation_Previews: PreviewProvider {
    static var previews: some View {
        AppNavigation()
    }
}
