//
//  Instruction.swift
//  FirstCall
//
//  Created by NIDHI URS  on 23/02/26.
//


import Foundation
import SwiftUI

struct Instruction: Identifiable {
    var id = UUID()
    let name: String
    let icon: String // SF Symbol name
    let imageName: String? // Custom Asset name
    let doSteps: [String]
    let dontSteps: [String]
    let benefits: [String]?
    let voiceEnabled: Bool // Indicates if voice navigation is supported
    let phoneNumber: String?
    
    // Add custom init to preserve backwards compatibility and assign imageName nil by default
    init(id: UUID = UUID(), name: String, icon: String, imageName: String? = nil, phoneNumber: String? = nil, doSteps: [String], dontSteps: [String], benefits: [String]?, voiceEnabled: Bool) {
        self.id = id
        self.name = name
        self.icon = icon
        self.imageName = imageName
        self.phoneNumber = phoneNumber
        self.doSteps = doSteps
        self.dontSteps = dontSteps
        self.benefits = benefits
        self.voiceEnabled = voiceEnabled
    }
    
    var spokenText: String {
        let doText = doSteps.joined(separator: ", ")
        let dontText = dontSteps.joined(separator: ", ")
        return "Emergency: \(name). What to do: \(doText). What not to do: \(dontText)."
    }
}
