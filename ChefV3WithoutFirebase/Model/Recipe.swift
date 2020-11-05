//
//  Recipe.swift
//  ChefV3WithoutFirebase
//
//  Created by Maximilian Klumker on 03.11.20.
//

import Foundation
import SwiftUI

struct Recipe: Identifiable {
    var id = UUID()
    var title: String
    var image: UIImage
    var serving: String
    var time: String
    var ingredients: [String]
    var show: Bool
}

var recipeData = [
    Recipe(title: "Pea Soup with Walnut Pesto", image:#imageLiteral(resourceName: "peasoup_detail_1000px_bicsharp"), serving: "serving 2 adults ・", time: "30 min", ingredients: ["Medium plant"], show: false),
    Recipe(title: "Plant-Based Moussaka", image: #imageLiteral(resourceName: "moussaka_detail_1000px_bicsharp"), serving: "serving 2 adults ・", time: "30 min", ingredients: ["Medium plant"], show: false),
    Recipe(title: "Mint Basil Pesto", image: #imageLiteral(resourceName: "pesto_detail_1000px_bicsharp"), serving: "serving 2 adults ・", time: "30 min", ingredients: ["Medium plant"], show: false),
    Recipe(title: "Chicken Tofu Stir Fry", image: #imageLiteral(resourceName: "stirfry_detail_1000px_bicsharp"), serving: "serving 2 adults ・", time: "30 min", ingredients: ["Medium plant"], show: false),
    Recipe(title: "Mediterranean Lentil Salad", image: #imageLiteral(resourceName: "lentilsalad_detail_1000px_bicsharp"), serving: "serving 2 adults ・", time: "30 min", ingredients: ["Medium plant"], show: false)
]
