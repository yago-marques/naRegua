//
//  Header.swift
//  onRegua
//
//  Created by Yago Marques on 11/05/22.
//

import SwiftUI

struct Header: View {
    let progressValue: Double
    let statusColor: Color
    
    var body: some View {
        VStack {
            ProgressCircle(progress: progressValue, statusColor: statusColor)
        }
        .frame(height: 350)
        .background {
            HeaderBackgroundImage()
        }
    }
}
