//
//  HeaderBackgroundImage.swift
//  onRegua
//
//  Created by Yago Marques on 11/05/22.
//

import SwiftUI

struct HeaderBackgroundImage: View {
    var body: some View {
        Image("headerBackground")
            .resizable()
            .scaledToFill()
    }
}

struct HeaderBackgroundImage_Previews: PreviewProvider {
    static var previews: some View {
        HeaderBackgroundImage()
            .previewLayout(.sizeThatFits)
    }
}
