//
//  HomeView.swift
//  Grandmas Recipes
//
//  Created by Darrien Huntley on 3/6/21.
//

import SwiftUI

struct HomeView: View {
//
//    var HomePost: [RecipePost] = [
//        RecipePost(postingUser: "person1", description: "this is a long description", numberOfLikes: 1123, image: Image(systemName: "timelapse")),
//
//        RecipePost(postingUser: "mark", description: "this is a long description", numberOfLikes: 1123, image: Image(systemName: "timelapse")),
//
//        RecipePost(postingUser: "dmoney", description: "this is a long description", numberOfLikes: 1123, image: Image(systemName: "timelapse")),
//
//        RecipePost(postingUser: "perfkinson", description: "this is a long description", numberOfLikes: 1123, image: Image(systemName: "timelapse")),
//
//        RecipePost(postingUser: "ookokperson", description: "this is a long description", numberOfLikes: 1123, image: Image(systemName: "timelapse"))
//
//
//    ]
//
    var body: some View {
        VStack {
            ScrollView(.horizontal, showsIndicators: false) {
                HStack {
                    Spacer().frame(width: 10)
                    ForEach(0..<10){ _ in
                        StoryCircleView()
                    }
                    Spacer()
                        .frame(width: 10)
                }
                .frame(height: 80)
            }
           .background(Color.clear)
            ScrollView(.vertical) {
                ForEach(0..<10){ _ in

              //  ForEach(HomePost, id: \.id) { post in
                 //   PostView(passed_postingUser: post.postingUser , passed_description: post.description, passed_numberOfLikes: post.numberOfLikes, passed_image: post.image)
                    PostView(passed_postingUser: "okok", passed_description: "okookok", passed_numberOfLikes: 9, passed_image: Image(systemName: "circle"))

                }
            }
         //   .background(Color.clear)

            
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
