//
//  Me_PostView.swift
//  Grandmas Recipes
//
//  Created by Darrien Huntley on 3/8/21.
//

import SwiftUI

struct Me_PostView: View {
    var postHeight:CGFloat = 250
    var body: some View {
        
            ZStack{
                Image("defaultProfileImage")
                .resizable()
                .scaledToFill()
                    .frame(width: UIScreen.main.bounds.width, height: postHeight)
                    .background(Color.init(red: 0.9, green: 0.9, blue: 0.9))
                    .clipped()
                LinearGradient(gradient: Gradient(colors: [Color.clear, Color.clear,  Color.black]), startPoint: .top, endPoint: .bottom)
                VStack{
                    Spacer()
                    HStack{
                        VStack(alignment: .leading){
                            Text("3 Inredients")
                               
                            Text("15 steps")
                            
                        }.foregroundColor(.white)
                        Spacer()
                        VStack(alignment: .trailing){
                            Text("Prep-time: 15 minutes")
                            
                            Text("Cook-time: 35 minutes")
                            
                        }.foregroundColor(.init(red: 0.6, green: 0.6, blue: 0.6)).opacity(0.8)
                        }.font(.system(size: 15, weight: .bold)).padding()
                }
            }.frame(width: UIScreen.main.bounds.width, height: postHeight)
            
    }
}

struct Me_PostView_Previews: PreviewProvider {
    static var previews: some View {
        Me_PostView()
    }
}
