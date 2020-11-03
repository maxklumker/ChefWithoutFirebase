//
//  RecipeDetailView.swift
//  ChefV3WithoutFirebase
//
//  Created by Maximilian Klumker on 03.11.20.
//

import SwiftUI

struct RecipeDetailView: View {
    var recipe: Recipe

    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

struct RecipeDetailView_Previews: PreviewProvider {
    static var previews: some View {
        RecipeDetailView(recipe: recipeData[0])
    }
}
