//
//  SubView.swift
//  ChefV3WithoutFirebase
//
//  Created by Maximilian Klumker on 03.11.20.
//

import SwiftUI

struct Subview: View {
    
    var imageString: String
    
    var body: some View {
            Image(imageString)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .clipped()
    }
}

struct Subview_Previews: PreviewProvider {
    static var previews: some View {
        Subview(imageString: "step1")
    }
}
