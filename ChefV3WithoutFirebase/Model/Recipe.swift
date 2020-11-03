//
//  Recipe.swift
//  ChefV3WithoutFirebase
//
//  Created by Maximilian Klumker on 03.11.20.
//

import Foundation

struct Recipe: Identifiable {
    var id = UUID()
    var title: String
    var image: URL
    var serving: String
    var time: String
    var ingredients: [String]
    var show: Bool
}

var recipeData = [
    Recipe(title: "pea soup with walnut pesto", image: URL(string: "https://dl.dropbox.com/s/x0cpo32qwroxjf8/01_cover_pea_soup_detail_large.jpg?dl=0")!, serving: "serving 2 adults ・", time: "30 min", ingredients: ["Medium plant"], show: false),
    Recipe(title: "plant-based Moussaka", image: URL(string: "https://dl.dropbox.com/s/2vrhqpapqqpmii2/02_cover_moussaka_large.jpg?dl=0")!, serving: "serving 2 adults ・", time: "30 min", ingredients: ["Medium plant"], show: false),
    Recipe(title: "mint basil pesto", image: URL(string: "https://dl.dropbox.com/s/ap3buf4qkxin7wn/03_cover_mint_basil_pesto_detail_large.png?dl=0")!, serving: "serving 2 adults ・", time: "30 min", ingredients: ["Medium plant"], show: false)
]
