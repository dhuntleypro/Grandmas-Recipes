//
//  MeView.swift
//  Grandmas Recipes
//
//  Created by Darrien Huntley on 3/6/21.
//



import SwiftUI
import Firebase

struct ProfileView: View {
    @EnvironmentObject var auth: AuthViewModel
    
    var body: some View {
        ZStack{
            if ((auth.user?.isCurrentUser) != nil) {
                VStack{
                    Image("defaultProfileImage")
                        .padding(12)
                        .scaledToFill()
                        .frame(width: 140, height: 140)
                        .clipShape(Circle())
                    HStack{
                        VStack{
                            Text("\(auth.user!.fullname)")
                            Text(" \(auth.user!.username) || \(auth.user!.publishedRecipes.count) Recipe")
                        }
//                        Spacer()
//                        Image(systemName: "timelapse")
//                            .resizable()
//                            .scaledToFit()
//                            .frame(width:90, height:90)
//                            .background(Color.yellow)
//                            .cornerRadius(45)
                    }.padding()
                    HStack{
                        Button(action: {}){
                            Spacer()
                            Text("Message")
                                .padding(3)
                            
                            Spacer()
                            
                        }.cornerRadius(5)
                        Button(action: {}){
                            Spacer()
                            Text("Follow")
                                .padding(3)
                                .foregroundColor(.white)
                            Spacer()
                        }
                        .background(darkBlue)
                        .cornerRadius(5)
                    }
                    ScrollView{
                        VStack(spacing: 0) {
                        ForEach(0..<self.auth.user!.publishedRecipes.count){ i in
                            
                            Me_PostView()
                        }
                        }
                        
                    }.background(Color.white)
                    
                    
                    Button(action: {
                        auth.signOut()
                    }) {
                        Text("Log Out")
                    }
                    
                    Text("Id : \(Auth.auth().currentUser?.uid ?? "[ missing uid ]")")

                }
            }
            
        }
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
