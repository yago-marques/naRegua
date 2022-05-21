//
//  ProgressCircle.swift
//  onRegua
//
//  Created by Yago Marques on 12/05/22.
//

import SwiftUI

struct ProgressCircle: View {
    let progress: Double
    
    var statusColor: Color
        
    var body: some View {
        ZStack {
            Circle()
                .stroke(lineWidth: 20.0)
                .opacity(0.3)
                .foregroundColor(statusColor)
                .overlay {
                        HairCutIcon()
                }
            Circle()
                .trim(from: 0.00, to: progress)
                .stroke(style: StrokeStyle(lineWidth: 20.0, lineCap: .round, lineJoin: .round))
                .foregroundColor(statusColor)
        }
        .frame(width: 200, height: 150)
        .padding(40)
        .background(
            Rectangle()
                .frame(width: 250, height: 250)
                .foregroundColor(.black.opacity(0.3))
                .background(.ultraThinMaterial)
                .cornerRadius(20)
        )
        .animation(.easeIn(duration: 1.4), value: progress)
    }
}


