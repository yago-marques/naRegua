//
//  NewHaircut.swift
//  onRegua
//
//  Created by Yago Marques on 19/05/22.
//

import SwiftUI

struct NewHaircut: View {
    @Binding var showingSheet: Bool
    @Binding var user: User
    @Binding var progress: Double
    
    var body: some View {
        NavigationView {
            newHaircutForm(
                user: $user,
                showingSheet: $showingSheet,
                progress: $progress
            )
            .navigationTitle("Novo corte")
                .toolbar {
                    ToolbarItem(placement: .cancellationAction) {
                        Button {
                            showingSheet = false
                        } label: {
                            Image(systemName: "chevron.left")
                        }
                    }
                }
        }
        
    }
}


