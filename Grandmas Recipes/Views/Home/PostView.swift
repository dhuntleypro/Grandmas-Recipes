//
//  PostView.swift
//  Grandmas Recipes
//
//  Created by Darrien Huntley on 3/6/21.
//

import SwiftUI


// Change to Post Cell
struct PostView: View {
    
    var passed_postingUser: String
    var passed_description: String
    var passed_numberOfLikes: Int
    var passed_image: Image
    

    var body: some View {
        VStack {
            passed_image
                .frame( height: 300)
                .frame(minWidth: 0, maxWidth: .infinity)
                .background(Color.init(red: 0.95, green: 0.95, blue: 0.95))
                .opacity(0.8)
            VStack {
                HStack {
                    
                    Image(systemName: "heart")
                    Image(systemName: "envelope")
                    Spacer()
                    Image(systemName: "bookmark")
                    
                }
                HStack {
                    Text("\(passed_postingUser)")
                    Text("\(passed_numberOfLikes) likes")
                        .foregroundColor(.gray)

                    Spacer()
                }
                .font(.system(size: 14, weight: .bold))
                HStack {
                    
                    Text("\(passed_description)")
                    Spacer()
                    
                }
                .font(.system(size: 14, weight: .regular))

                
            }
            .padding()
           
        }
      //  .background(Color.orange)
    }
}

struct PostView_Previews: PreviewProvider {
    static var previews: some View {
        PostView(passed_postingUser: "ijojijoi", passed_description: "inunininuniunbdci iubiu iub iub ubiub iub iubibiub iubiub ubib iub biu", passed_numberOfLikes: 393, passed_image:Image(systemName: "heart.fill"))
    }
}
