//
//  Haircut.swift
//  onRegua
//
//  Created by Yago Marques on 11/05/22.
//

import Foundation
import SwiftUI

extension Date {
    func get(_ components: Calendar.Component..., calendar: Calendar = Calendar.current) -> DateComponents {
        return calendar.dateComponents(Set(components), from: self)
    }

    func get(_ component: Calendar.Component, calendar: Calendar = Calendar.current) -> Int {
        return calendar.component(component, from: self)
    }
}

struct Haircut {
    var name: String
    var barber: String
    var wasCut: Date
    var frequency: String
    
    init(name: String, barber: String, wasCut: Date, frequency: String) {
        self.name = name
        self.wasCut = wasCut
        self.frequency = frequency
        self.barber = barber
    }
    
    private func getFrequencyInt() -> Double {
        switch frequency {
        case "7 dias" :
            return 7
        case "14 dias" :
            return 14
        case "21 dias" :
            return 21
        case "30 dias" :
            return 30
        default:
            return 0
        }
    }
    
    func getDiff() -> Int {
        let wasCutComponents = wasCut.get(.day, .month, .year)
        let currentDateComponents = Date().get(.day, .month, .year)
        let cutMonth = wasCutComponents.month ?? 0
        let cutDay = wasCutComponents.day ?? 0
        let currentMonth = currentDateComponents.month ?? 0
        let currentDay = currentDateComponents.day ?? 0
        
        if cutMonth == currentMonth {
            return currentDay - cutDay
        } else {
            if currentDay < cutDay {
                return (30 - cutDay) + currentDay + (30*(currentMonth-cutMonth-1))
            } else {
                return 30 - (currentDay - cutDay)
            }
        }
    }
    
    func getProgress() -> Double {
        let daysDifference = Double(getDiff())
        
        let progress = daysDifference/getFrequencyInt()
        
        return progress
    }
    
    func getStatusColor() -> Color {
        
        let progress = getProgress()
        
        if progress < 0.60 {
            return Color.green
        } else if progress <= 0.85 {
            return Color.yellow
        } else {
            return Color.red
        }
        
    }
}
