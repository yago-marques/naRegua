//
//  ContentView.swift
//  onRegua
//
//  Created by Yago Marques on 11/05/22.
//

import SwiftUI

struct HaircutInfoView: View {
    
    @Binding var user: User
    @State var showingSheet: Bool = false
    @State var progress: Double = 0.0
    
    var body: some View {
        ScrollView {
            VStack {
                Header(
                    progressValue: progress,
                    statusColor: user.haircut.getStatusColor()
                )
                InfoList(
                    statusColor: user.haircut.getStatusColor(),
                    haircutName: user.haircut.name,
                    wasCutDate: user.haircut.wasCut,
                    diff: user.haircut.getDiff(),
                    frequency: user.haircut.frequency,
                    barber: user.haircut.barber
                )
                
            }
            .navigationTitle("NaRégua")
            .navigationBarTitleDisplayMode(.inline)
            .navigationBarBackButtonHidden(true)
            .toolbar{
                ToolbarItem(placement: .primaryAction) {
                    Button {
                        showingSheet = true
                    } label: {
                        Image(systemName: "plus")
                            .foregroundColor(.blue)
                    }
                }
            }
            .sheet(isPresented: $showingSheet) {
                NewHaircut(
                    showingSheet: $showingSheet,
                    user: $user,
                    progress: $progress
                )
            }
        }
        .onAppear {
            progress = user.haircut.getProgress()
        }
    }
}
