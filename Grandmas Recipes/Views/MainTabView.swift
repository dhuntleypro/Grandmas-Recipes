//
//  TabRootView.swift
//  Grandmas Recipes
//
//  Created by Darrien Huntley on 3/5/21.
//

import SwiftUI

struct MainTabView: View {
    @Binding var selectedIndex : Int
    var body: some View {
        TabView {
            HomeView()
                .onTapGesture {
                    selectedIndex = 0
                }
                .tag(0)
                .tabItem {
                    Image(systemName: "house")
                    Text("Home")
                }
            
            
            
            SearchView()
                .onTapGesture {
                    selectedIndex = 1
                }
                .tag(1)
                .tabItem {
                    Image(systemName: "magnifyingglass")
                    Text("Search")
                }
            
            NewPostView()
                .onTapGesture {
                    selectedIndex = 2
                }
                .tag(2)
                .tabItem {
                    Image(systemName: "plus.square")
                    Text("Add Recipe")
                }
            
            ProfileView()
                .onTapGesture {
                    selectedIndex = 3
                }
                .tag(3)
                .tabItem {
                    Image(systemName: "person")
                    Text("Profile")
                }
            
        }
    }
}

struct MainTabView_Previews: PreviewProvider {
    static var previews: some View {
        MainTabView(selectedIndex: .constant(0))
    }
}
