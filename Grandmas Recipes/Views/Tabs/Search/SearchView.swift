//
//  SearchView.swift
//  Grandmas Recipes
//
//  Created by Darrien Huntley on 3/6/21.
//

import SwiftUI

struct SearchView: View {
    @EnvironmentObject var auth: AuthViewModel

    var body: some View {
        Button(action: {
            auth.signOut()
        }) {
            Text("Log Out")
        }
        //.modifier(myClearButtonAdjustable(bgColor: .red))
        
        
    }
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView()
    }
}
