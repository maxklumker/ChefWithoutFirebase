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
                            .opacity(show ? 1 : 0)
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
            .frame(maxWidth: show ? .infinity : screen.width - 41, maxHeight: show ? 493 : 334)
            .background(Image(uiImage: recipe.image)
                            .resizable()
                            .offset(y: 30)
                            .aspectRatio(contentMode: .fill)
                            .frame(maxWidth: .infinity))
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
            
//            VStack {
//                Image(systemName: "xmark")
//                    .font(.system(size: 16, weight: .medium))
//                    .foregroundColor(.white)
//                    .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
//            }
//            .frame(width: 36, height: 36)
//            .background(Color.black.opacity(0.4))
//            .clipShape(Circle())
//            .onTapGesture{
//                self.showDirections = false
//            }
            
            VStack {
                HStack (alignment: .top) {
                    Text(recipe.title)
                        .font(.system(size: 24, weight: .bold))
                        .frame(width: 280, alignment: .leading)
                        .foregroundColor(.white)
                        .hidden()
                    
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
//                        .offset(x: 10, y: -40)
                    .onTapGesture{
                        self.showDirections = false
                            
                    }
                }
                .padding(.leading, 0)
                Spacer()
            }
            .padding(.top, 60)
            .padding(.horizontal, 30)
            
        }
    }
}
