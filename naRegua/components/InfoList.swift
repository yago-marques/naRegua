//
//  infoList.swift
//  onRegua
//
//  Created by Yago Marques on 16/05/22.
//

import SwiftUI

struct InfoList: View {
    let statusColor: Color
    var statusMessage: String {
        switch(statusColor) {
        case .red:
            return "Está na hora de cortar o cabelo"
        case .yellow:
            return "Não está tão na régua"
        case .green:
            return "Está na régua"
        default:
            return "erro no sistema"
        }
    }
    let haircutName: String
    let wasCutDate: Date
    let currentDate = Date()
    let diff: Int
    let frequency: String
    let barber: String
    
    var body: some View {
        VStack {
            
            // status
            GroupBox(
                label: HStack {
                    Image(systemName: "scissors")
                    Text("Status do corte")
                        .font(.title2)
                        .fontWeight(.bold)
                }
        
            ) {
                Spacer()
                HStack {
                    Circle()
                        .frame(width: 10, height: 10)
                        .foregroundColor(statusColor)
                    Text(statusMessage)
                        .fontWeight(.medium)
                        .foregroundColor(Color.secondary)
                    Spacer()
                }
                Spacer()
            }
            .frame(width: 380, height: 100)
            
            // last haircut
            GroupBox(
                label: HStack {
                    Image(systemName: "calendar")
                    Text("Último corte")
                        .font(.title2)
                        .fontWeight(.bold)
                }
        
            ) {
                Spacer()
                HStack {
                    VStack(alignment: .leading) {
                        Text(
                            diff == 1 ? "\(haircutName) | \(diff) dia atrás"
                            : "\(haircutName) | \(diff) dias atrás"
                        )
                            .fontWeight(.medium)
                            .foregroundColor(Color.secondary)
                        Spacer()
                        HStack {
                            Text(wasCutDate, style: .date)
                                .fontWeight(.medium)
                                .foregroundColor(Color.secondary)
                            Text(" - ")
                                .fontWeight(.medium)
                                .foregroundColor(Color.secondary)
                            Text(currentDate, style: .date)
                                .fontWeight(.medium)
                                .foregroundColor(Color.secondary)
                        }
                        
                    }
                    
                    Spacer()
                }
                Spacer()
            }
            .frame(width: 380, height: 150)
            
            // Barber
            GroupBox(
                label: HStack {
                    Image(systemName: "mustache.fill")
                    Text("Barbearia")
                        .font(.title2)
                        .fontWeight(.bold)
                }
            ) {
                Spacer()
                HStack {
                    Text(barber)
                        .fontWeight(.medium)
                        .foregroundColor(Color.secondary)
                    Spacer()
                }
                Spacer()
            }
            .frame(width: 380, height: 100)
            
            // Frequency
            GroupBox(
                label: HStack {
                    Image(systemName: "timer")
                    Text("Frequência")
                        .font(.title2)
                        .fontWeight(.bold)
                }
            ) {
                Spacer()
                HStack {
                    Text(frequency)
                        .fontWeight(.medium)
                        .foregroundColor(Color.secondary)
                    Spacer()
                }
                Spacer()
            }
            .frame(width: 380, height: 100)
        }
        .padding()
    }
    
}
