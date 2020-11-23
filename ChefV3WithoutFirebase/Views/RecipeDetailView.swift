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
                                .font(.system(size: show ? 48 : 27, weight: .bold))
                                .frame(width: 334, alignment: .leading)
                                .foregroundColor(.white)
                            
                            Spacer()
                        }
                        .padding(.leading, show ? 0 : 25)
                        Spacer()
                    }
                    .padding(.top, show ? 49 : 20)
                    .padding(.horizontal, show ? 21 : 16)
                    .zIndex(/*@START_MENU_TOKEN@*/1.0/*@END_MENU_TOKEN@*/)
                    
                    VStack {
                        HStack {
                            Spacer()
                            VStack {
                                Image("X")
                                        .font(.system(size: 18, weight: .medium))
                                }
                                .frame(width: 30, height: 30)
                                .background(Color("darkgray").opacity(0.4))
                                .clipShape(Circle())
                                .onTapGesture {
                                    self.show = false
                                    self.active = false
                                    self.activeIndex = -1
                                    self.isScrollable = false
                            }
                        }
                        .padding(.top, 20)
                        .padding(.trailing, 29)
                        
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
                                .aspectRatio(contentMode: .fill)
                                .offset(y: show ? 0 : -37)
                                .frame(width: show ? .infinity : 334))
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
                                    .font(.system(size: 18, weight: .semibold))
                                    .foregroundColor(Color("spacegray"))
                                Text(recipe.time)
                                    .font(.system(size: 18, weight: .semibold))
                                    .foregroundColor(Color("spacegray"))
                                    .offset(x: -10)
                            }
                            .padding(.top, -6)
                        }
                        Spacer()
                        
                        //Go Button
                        ZStack {
                            Circle()
                                .frame(width: 64, height: 64)
                                .foregroundColor(Color("pacificblue"))
                                .clipShape(Circle())
                            Text("GO")
                                .font(.system(size: 20, weight: .bold))
                                .foregroundColor(Color.white)
                                .padding()
                        }
                        .padding(.trailing, 8)
                        .offset(y: 3)
                        .onTapGesture {
                            self.showDirections.toggle()
                        }
                    }
                    .padding(.leading, 2)
                    .padding(.bottom, -13)
                    
                    ForEach(0 ..< 5) { item in
                        VStack (alignment: .leading) {
                            HStack (spacing: 12) {
                                
                                //Ingredient Circle
                                Circle()
                                    .frame(width: 58, height: 58)
                                    .foregroundColor(.clear)
                                    .overlay(Circle()
                                                .stroke(Color(.black).opacity(0.15), lineWidth: 2))
                                
                                VStack (alignment: .leading, spacing: 1) {
                                    Text("Ingredient name")
                                        .font(.system(size: 25, weight : .bold))
                                        .foregroundColor(.black)
                                    
                                    HStack {
                                        Text("1 medium")
                                            .font(.system(size: 25, weight: .regular))
                                            .foregroundColor(.black)
                                        Text("300 gramm")
                                            .font(.system(size: 25, weight: .regular))
                                            .foregroundColor(Color("darkgray"))
                                    }
                                    .padding(.trailing)
                                }
                            }
                            .padding(.bottom, -20)
                        }
                        .padding(.leading, 4)
                    }
                }
                .padding(.top, 27)
                .padding(.bottom, 57)
                .padding(.horizontal, 20)
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
