//
//  HairCutIcon.swift
//  onRegua
//
//  Created by Yago Marques on 16/05/22.
//

import SwiftUI

struct HairCutIcon: View {
    @Environment(\.colorScheme) var colorScheme
    
    var body: some View {
        Image(colorScheme == .dark ? "whiteHaircutIcon" : "haircutIcon")
            .resizable()
            .frame(width: 70, height: 70, alignment: .center)
    }
}

struct HairCutIcon_Previews: PreviewProvider {
    static var previews: some View {
        HairCutIcon()
    }
}
