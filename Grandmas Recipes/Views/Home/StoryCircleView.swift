//
//  StoryCircleView.swift
//  Grandmas Recipes
//
//  Created by Darrien Huntley on 3/6/21.
//

import SwiftUI

struct StoryCircleView: View {
    var body: some View {
        VStack {
            Image(systemName: "circle.grid.hex")
                .frame(width: 60, height: 60)
                .background(Color.init(red: 0.95, green: 0.95, blue: 0.95))
                .clipShape(Circle())
                .foregroundColor(.black)
                .overlay(Circle()
                    .stroke(
                        Color.blue.opacity(0.3), lineWidth: 3
                    )
                )
        }
    }
}

struct StoryCircleView_Previews: PreviewProvider {
    static var previews: some View {
        StoryCircleView()
    }
}
