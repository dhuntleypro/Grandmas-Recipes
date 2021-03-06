//
//  TabRootView.swift
//  Grandmas Recipes
//
//  Created by Darrien Huntley on 3/5/21.
//

import SwiftUI

struct TabRootView: View {
    @State private var selection = 0
    var body: some View {
        TabView(selection: $selection) {
            HomeView()
                .tabItem {
                    VStack {
                        Image(systemName: "house")
                        Text("home")
                    }
                }
                .tag(1)
            
            SearchView()
                .tabItem {
                    VStack {
                        Image(systemName: "magnifyingglass")
                        Text("Search")
                    }
                }
                .tag(2)
            
            
            MeView()
                .tabItem {
                    VStack {
                        Image(systemName: "person.circle")
                        Text("Me")
                    }
                }
                .tag(3)
            
            
            
        }
    }
}

struct TabRootView_Previews: PreviewProvider {
    static var previews: some View {
        TabRootView()
    }
}
