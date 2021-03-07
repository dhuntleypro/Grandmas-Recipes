//
//  NewPostView.swift
//  Grandmas Recipes
//
//  Created by Darrien Huntley on 3/6/21.
//

import SwiftUI

struct NewPostView: View {
    @ObservedObject var stepVM = StepViewModel()
    @ObservedObject var ingredientVM = IngredientViewModel()

    var body: some View {
        VStack {
            HStack {
                Image(systemName: "timeLapse")
                    .resizable()
                    .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.width)
                    .scaledToFit()
                    .background(Color.blue)
            }
            HStack {
                VStack {
                    Text("Ingredients")
                    ScrollView{
                        VStack{
                            ForEach(ingredientVM.ingredients) { ingredient in
                                Text("\(ingredient.amount) \(ingredient.name) ")
                            }
                        }
                    }
                    .frame(width: UIScreen.main.bounds.width/2)
                    .clipped()
                }
                .background(Color.yellow)
                
                VStack {
                    Text("Steps")
                    ScrollView {
                        VStack {
                            ForEach(stepVM.steps) { step in
                                Text(step.description)
                            }
                        }
                    }
                    .frame(width: UIScreen.main.bounds.width/2)
                    .clipped()

                }
                .background(Color.green)
                
            }
        }
    }
}

struct NewPostView_Previews: PreviewProvider {
    static var previews: some View {
        NewPostView()
    }
}
