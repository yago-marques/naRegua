//
//  User.swift
//  onRegua
//
//  Created by Yago Marques on 11/05/22.
//

import Foundation

struct User: Identifiable {
    var id = UUID()
    var name: String
    var haircut : Haircut
    
    init(name: String, haircut: Haircut) {
        self.name = name
        self.haircut = Haircut(
            name: haircut.name,
            barber: haircut.barber,
            wasCut: haircut.wasCut,
            frequency: haircut.frequency
        )
    }
}
