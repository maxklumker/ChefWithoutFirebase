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
    Recipe(title: "pea soup with walnut pesto", image:#imageLiteral(resourceName: "01_cover_pea_soup_detail_small_"), serving: "serving 2 adults ・", time: "30 min", ingredients: ["Medium plant"], show: false),
    Recipe(title: "plant-based Moussaka", image: #imageLiteral(resourceName: "rename pls"), serving: "serving 2 adults ・", time: "30 min", ingredients: ["Medium plant"], show: false),
    Recipe(title: "mint basil pesto", image: #imageLiteral(resourceName: "03_cover_basil_pesto_detail_small"), serving: "serving 2 adults ・", time: "30 min", ingredients: ["Medium plant"], show: false)
]
