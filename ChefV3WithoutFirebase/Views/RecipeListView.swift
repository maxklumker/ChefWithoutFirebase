//
//  RecipeListView.swift
//  ChefV3WithoutFirebase
//
//  Created by Maximilian Klumker on 03.11.20.
//

import SwiftUI
import SDWebImageSwiftUI

struct RecipeListView: View {
    @State var recipes = recipeData
    @State var active = false
    @State var activeIndex = -1
    @State var showDirections = false
    
    var body: some View {
        ZStack {
            Color.black.opacity(active ? 0.5 : 0)
                .animation(.linear)
                .edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
            ScrollView {
                
                VStack (spacing: 30) {
                    Text("Recipes")
                        .font(.largeTitle).bold()
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.leading, 21)
                        .padding(.top, 30)
                        .blur(radius: active ? 20 : 0)
                    
                    ForEach(recipes.indices, id: \.self) { index in
                        GeometryReader { geometry in
                            RecipeView(
                                show: self.$recipes[index].show,
                                recipe: self.recipes[index],
                                active: self.$active,
                                index: index,
                                activeIndex: self.$activeIndex,
                                showDirections: self.$showDirections
                            )
                                .offset(y: self.recipes[index].show ? -geometry.frame(in: .global).minY : 0)
                            .opacity(self.activeIndex != index && self.active ? 0 : 1)
                            .scaleEffect(self.activeIndex != index && self.active ? 0.9 : 1)
                            
                        }
                        .frame(height: 334)
                        .frame(maxWidth: self.recipes[index].show ? .infinity : screen.width - 41)
                        .padding(.bottom, 20)
                        .zIndex(self.recipes[index].show ? 1 : 0)
                    }
                }
                .frame(width: screen.width)
                .animation(.spring(response: 0.4, dampingFraction: 0.8, blendDuration: 0))
            }
        }
        .statusBar(hidden: active ? true : false)
        .animation(.linear)
    }
}


struct RecipeListView_Previews: PreviewProvider {
    static var previews: some View {
        RecipeListView()
    }
}
