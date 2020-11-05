//
//  RecipeDetailView.swift
//  ChefV3WithoutFirebase
//
//  Created by Maximilian Klumker on 03.11.20.
//

import SwiftUI
import SDWebImageSwiftUI

struct RecipeDetailView: View {
    var recipe: Recipe
    @Binding var show: Bool
    @Binding var active: Bool
    @Binding var activeIndex: Int
    @Binding var isScrollable: Bool
    @Binding var showDirections: Bool
    
    var body: some View {
        ScrollView(showsIndicators: false) {
            VStack(spacing: 0) {
                ZStack {
                    VStack {
                        HStack (alignment: .top) {
                            Text(recipe.title)
                                .font(.system(size: 24, weight: .bold))
                                .frame(width: 280, alignment: .leading)
                                .foregroundColor(.white)
                            
                            Spacer()
                        }
                        .padding(.leading, show ? 0 : 25)
                        Spacer()
                    }
                    .padding(.top, show ? 60 : 20)
                    .padding(.horizontal, show ? 30 : 16)
                    .zIndex(/*@START_MENU_TOKEN@*/1.0/*@END_MENU_TOKEN@*/)
                    
                    VStack {
                        HStack {
                            Spacer()
                            VStack {
                                    Image(systemName: "xmark")
                                        .font(.system(size: 16, weight: .medium))
                                        .foregroundColor(.white)
                                        .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
                                }
                                .frame(width: 36, height: 36)
                                .background(Color.black.opacity(0.4))
                                .clipShape(Circle())
                                //                            .offset(x: 10, y: -40)
                                .onTapGesture {
                                    self.show = false
                                    self.active = false
                                    self.activeIndex = -1
                                    self.isScrollable = false
                            }
                        }
                        .padding(20)
                        
                        Spacer()
                        
                        Text("")
                        
                    }
                    .zIndex(1.0)
                    
                    
                    
                    Rectangle()
                        .foregroundColor(.clear)
                        .background(LinearGradient(gradient: Gradient(colors: [.clear, Color.black.opacity(1)]), startPoint: .bottom, endPoint: .top))
                        .frame(width: show ? .infinity : screen.width - 41, height: show ? 493 : 334)
                        .offset(y: -216)
                        .cornerRadius(show ? 0 : 10)
                    
                    Spacer()
                }
                .frame(maxWidth: show ? .infinity : screen.width - 41 , maxHeight: show ? 493 : 334)
                .background(Image(uiImage: recipe.image)
                                .resizable()
                                .offset(x: -20, y: 60)
                                .aspectRatio(contentMode: .fill)
                                .frame(width: 440))
                .clipShape(RoundedRectangle(cornerRadius: show ? 0 : 10, style: .continuous))
                .shadow(color: show ? Color(.black).opacity(0.001) : Color(.black).opacity(0.15), radius: 20, x: 0, y: 20)
                .contentShape(Rectangle())
                
                VStack (alignment: .leading, spacing: 30) {
                    HStack {
                        VStack (alignment: .leading) {
                            
                            Text("Ingredients").font(.system(size: 32, weight: .bold))
                                .foregroundColor(Color.black)
                            
                            HStack {
                                Text(recipe.serving)
                                    .font(.system(size: 15, weight: .medium))
                                    .foregroundColor(Color.black)
                                Text(recipe.time)
                                    .font(.system(size: 15, weight: .medium))
                                    .foregroundColor(Color.black)
                                    .offset(x: -5)
                            }
                        }
                        Spacer()
                        
                        //Go Button
                        ZStack {
                            Circle()
                                .frame(width: 60, height: 60)
                                .foregroundColor(Color.blue)
                                .clipShape(Circle())
                            Text("GO")
                                .font(.system(size: 20, weight: .bold))
                                .foregroundColor(Color.white)
                                .padding()
                        }
                        .onTapGesture {
                            self.showDirections.toggle()
                        }
                        
                    }
                    ForEach(0 ..< 5) { item in
                        VStack (alignment: .leading) {
                            HStack (spacing: 12) {
                                
                                //Ingredient Circle
                                Circle()
                                    .frame(width: 58, height: 58)
                                    .foregroundColor(.clear)
                                    .overlay(Circle()
                                                .stroke(Color(.black).opacity(0.15), lineWidth: 2))
                                    .padding(.leading)
                                
                                VStack (alignment: .leading, spacing: 1) {
                                    Text("Ingredient name")
                                        .font(.system(size: 24, weight : .bold))
                                        .foregroundColor(.black)
                                    
                                    HStack {
                                        Text("1 medium")
                                            .font(.system(size: 18, weight: .regular))
                                            .foregroundColor(.black)
                                        Text("300 gramm")
                                            .font(.system(size: 18, weight: .regular))
                                            .foregroundColor(Color(.black).opacity(0.15))
                                    }
                                    .padding(.trailing)
                                }
                            }
                            .padding(.horizontal, -20)
                        }
                    }
                }
                .padding(.top, 26)
                .padding(.horizontal, 22)
            }
        }
        .edgesIgnoringSafeArea(.all)
        
    }
}

struct RecipeDetailView_Previews: PreviewProvider {
    static var previews: some View {
        RecipeDetailView(recipe: recipeData[0], show: .constant(true), active: .constant(true), activeIndex: .constant(-1), isScrollable: .constant(true), showDirections: .constant(false))
    }
}
