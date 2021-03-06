//
//  HomeView.swift
//  Grandmas Recipes
//
//  Created by Darrien Huntley on 3/6/21.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        VStack {
            ScrollView(.horizontal, showsIndicators: false) {
                HStack {
                   Text("yoooooooooo")
                    Text("yoooooooooo")
                }
                .frame(height: 80)
            }
            .background(Color.red)
            ScrollView(.vertical) {
                ForEach(0..<50) { _ in
                    Text("ffffkookokokookokokokokookofff")

                }
            }
            .background(Color.blue)

            
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
