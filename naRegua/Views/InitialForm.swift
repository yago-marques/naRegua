//
//  InitialForm.swift
//  onRegua
//
//  Created by Yago Marques on 13/05/22.
//

import SwiftUI

struct InitialForm: View {
    
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
    
    @State var userName = ""
    @State var selectedCutFrequency = ""
    @State var selectedCut = "Social"
    
    var cutIsOther: Bool {
        if selectedCut == "Outro" {
            return true
        } else {
            return false
        }
    }
    
    @State var otherHairCut = ""
    @State var barber = ""
    @State var wasCut = Date()
    @State private var goToInfoView = false
    
    @State var userInfo = User(name: "", haircut: Haircut (name: "", barber: "", wasCut: Date(), frequency: ""))
    
    @State private var showNavLink = false
    @State private var showAlert = false
    
    var body: some View {
        NavigationView {
            Form {
                HStack{
                    Text("Nome")
                    TextField("seu nome", text: $userName)
                }
                
                Picker("Frequência de corte", selection: $selectedCutFrequency, content: {
                    ForEach(hairCutsFrequency, id: \.self, content: { frequency in
                            Text(frequency)
                    })
                })
                
                Picker("Seu corte atual", selection: $selectedCut) {
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
                
                DatePicker("Dia que cortou", selection: $wasCut, displayedComponents: .date)
                    .datePickerStyle(.compact)
                
                HStack{
                    Text("Barbearia")
                    TextField("Barbearia", text: $barber)
                }
                
                Button {
                    if userName == ""
                        || selectedCutFrequency == ""
                        
                        || wasCut > Date().addingTimeInterval(100)
                        || barber == ""
                    {
                        showAlert = true
                    } else {
                        if selectedCut == "Outro", otherHairCut == "" {
                            showAlert = true
                        } else {
                            userInfo = User (
                                name: userName,
                                haircut: Haircut(
                                    name: selectedCut == "Outro" ? otherHairCut : selectedCut,
                                    barber: barber,
                                    wasCut: wasCut,
                                    frequency: selectedCutFrequency
                                )
                            )
                            showNavLink = true
                        }
                    }
                    
                } label: {
                    Text("Continuar")
                }
                
                if showNavLink {
                    NavigationLink("Seguir para o app", isActive: $goToInfoView) {
                        HaircutInfoView(user: $userInfo)
                    }
                }
            }
            .alert("Preencha todos os campos", isPresented: $showAlert) {
                
            }
            .navigationTitle("Formulário inicial")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

struct InitialForm_Previews: PreviewProvider {
    static var previews: some View {
        InitialForm()
            .previewLayout(.sizeThatFits)
        InitialForm()
            .previewLayout(.sizeThatFits)
            .preferredColorScheme(.dark)
    }
}
