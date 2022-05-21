//
//  newHaircutForm.swift
//  onRegua
//
//  Created by Yago Marques on 19/05/22.
//

import SwiftUI

struct newHaircutForm: View {
    @Binding var user: User
    @Binding var showingSheet: Bool
    @Binding var progress: Double
    @State var onAppear = true
    @State private var showAlert = false
    
    var hairCuts = [
        "Social",
        "Degradê tradicional",
        "Degradê navalhado",
        "Corte do jaca",
        "Corte americano",
        "Outro"
    ]
    
    var hairCutsFrequency = [
        "7 dias",
        "14 dias",
        "21 dias",
        "30 dias"
    ]
    
    @State var selectedCutFrequency = ""
    @State var selectedCut = ""
    
    var cutIsOther: Bool {
        if selectedCut == "Outro" {
            return true
        } else {
            return false
        }
    }
    
    @State var otherHairCut = ""
    @State var barber = ""
    @State var haircutDay = Date()
    
    var body: some View {
        Form {
            Picker("Corte", selection: $selectedCut) {
                ForEach(hairCuts, id: \.self) { cut in
                    Text(cut)
                }
            }
            
            if cutIsOther {
                HStack{
                    Text("Outro corte")
                    TextField("Nome do corte", text: $otherHairCut)
                }
            }
            
            HStack{
                Text("Barbearia")
                TextField("\(barber)", text: $barber)
            }
            
            DatePicker("Dia que cortou", selection: $haircutDay, displayedComponents: .date)
                .datePickerStyle(.compact)
            
            Picker("Frequência de corte", selection: $selectedCutFrequency, content: {
                ForEach(hairCutsFrequency, id: \.self, content: { frequency in
                        Text(frequency)
                })
            })
        }
        .toolbar {
            ToolbarItem(placement: .primaryAction) {
                Button {
                    if haircutDay > Date().addingTimeInterval(100)
                        || barber == "" {
                        showAlert = true
                    } else {
                        if selectedCut == "Outro", otherHairCut == "" {
                            showAlert = true
                        } else {
                            user.haircut.barber = self.barber
                            user.haircut.frequency = self.selectedCutFrequency
                            user.haircut.wasCut = self.haircutDay
                            user.haircut.name = self.selectedCut == "Outro" ? self.otherHairCut : self.selectedCut
                            showingSheet = false
                            progress = user.haircut.getProgress()
                        }
                    }
                    
                } label: {
                    Text("Adicionar corte")
                        .fontWeight(.semibold)
                }
            }
        }
        .alert("Preencha todos os campos", isPresented: $showAlert) {
            
        }
        .onAppear {
            if onAppear {
                selectedCut = user.haircut.name
                selectedCutFrequency = user.haircut.frequency
                barber = user.haircut.barber
                self.onAppear = false
            }
            
        }
    }
}
