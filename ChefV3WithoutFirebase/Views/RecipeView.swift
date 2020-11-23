//
//  RecipeView.swift
//  ChefV3WithoutFirebase
//
//  Created by Maximilian Klumker on 03.11.20.
//

import SwiftUI
import SDWebImageSwiftUI

struct RecipeView: View {
    @Binding var show: Bool
    var recipe: Recipe
    @Binding var active: Bool
    var index: Int
    @Binding var activeIndex: Int
    @State var isScrollable = false
    @Binding var showDirections: Bool
    
    var body: some View {
        ZStack (alignment: .top) {
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
            .frame(maxWidth: show ? .infinity : screen.width - 41, maxHeight: show ? .infinity : 334, alignment: .top)
            .offset(y: show ? 493 : 0)
            .background(Color.white)
            .clipShape(RoundedRectangle(cornerRadius: 10, style: .continuous))
            .shadow(color: Color.black.opacity(0.2), radius: 20, x: 0, y: 20)
            .opacity(show ? 1 : 0)
            

            ZStack {
                VStack {
                    HStack (alignment: .top) {
                        Text(recipe.title)
                            .font(.system(size: show ? 48 : 27, weight: .bold))
                            .frame(width: 334, alignment: .leading)
                            .foregroundColor(.white)
                        
                        Spacer()
                        
                    }
                    .padding(.leading, show ? 0 : 36)
                    
                    Spacer()
                }
                .padding(.top, show ? 49 : 18)
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
                            .opacity(show ? 1 : 0)
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
            .frame(maxWidth: show ? .infinity : screen.width - 41, maxHeight: show ? 493 : 334)
            .background(Image(uiImage: recipe.image)
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .offset(y: show ? 0 : -37)
                            .frame(width: show ? .infinity : 334))
            .clipShape(RoundedRectangle(cornerRadius: show ? 0 : 10, style: .continuous))
            .shadow(color: show ? Color(.black).opacity(0.001) : Color(.black).opacity(0.15), radius: 10, x: 0, y: 10)
            .contentShape(Rectangle())
            .onTapGesture {
                self.show.toggle()
                self.active.toggle()
                if self.show {
                    self.activeIndex = self.index
                } else {
                    self.activeIndex = -1
                }
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                    self.isScrollable = true
                }
            }
            
            if isScrollable {
                RecipeDetailView(recipe: recipe, show: $show, active: $active, activeIndex: $activeIndex, isScrollable: $isScrollable, showDirections: $showDirections)
                    .background(Color.white)
                    .animation(nil)
                    .transition(.identity)
            }
            
        }
        .frame(height: show ? screen.height : 334)
        .animation(.spring(response: 0.4, dampingFraction: 0.8, blendDuration: 0))
        .edgesIgnoringSafeArea(.all)
        
        if showDirections {
            DirectionsView()
                .background(Color.white)
                .animation(nil)
                .frame(width: screen.width, height: screen.height)
                .transition(.identity)
            
            VStack {
                HStack {
                    Spacer()
                    VStack {
                        Image("X")
                                .font(.system(size: 18, weight: .medium))
                        }
                        .frame(width: 30, height: 30)
                        .background(Color("darkgray").opacity(0.4))
                        .opacity(show ? 1 : 0)
                        .clipShape(Circle())
                        //                            .offset(x: 10, y: -40)
                        .onTapGesture {
                            self.showDirections = false
                    }
                }
                .padding(.top, 20)
                .padding(.trailing, 29)
                
                Spacer()
                
                Text("")
                
            }
            .animation(nil)
            .transition(.identity)
            .zIndex(1.0)
            
        }
    }
}
