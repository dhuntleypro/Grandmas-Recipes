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
        
        VStack {
            
            
            //PROFILE IMAGE
            VStack{
                
                Image("defaultProfileImage")
                    .padding(12)
                    .scaledToFill()
                    .frame(width: 140, height: 140)
                    .clipShape(Circle())
            }
            .padding(.bottom, 50)
            
            HStack{
                VStack(alignment: .leading, spacing: 20) {
                    if ((auth.user?.isCurrentUser) != nil) {
                        
                        Text("Username: \(auth.user!.username)")
                            .bold()
                        
                        Text("Email: \(auth.user!.email)")
                            .bold()
                        
                        Text("Full Name: \(auth.user!.fullname)")
                            .bold()
                        
                        Text("Id : \(Auth.auth().currentUser?.uid ?? "[ missing uid ]")")
                        
                        
                        
                    }
                    
                    
                    Spacer()
                    
                    Button(action: {
                        auth.signOut()
                    }) {
                        Text("Log Out")
                    }
                }
                .padding()
                
                // code here
                
                
                
                
                
               
                //     .modifier(myClearButtonAdjustable(bgColor: .red))
                
            }
        }
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
