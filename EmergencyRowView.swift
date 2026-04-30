//
//  EmergencyRowView.swift
//  FirstCall
//
//  Created by NIDHI URS  on 23/02/26.
//


import SwiftUI
import Foundation
struct EmergencyRowView: View {
    let emergency: Instruction
    
    var body: some View {
        HStack {
            Image(systemName: emergency.icon)
                .foregroundColor(.red)
            Text(emergency.name)
            Spacer()
            Image(systemName: "chevron.right")
                .foregroundColor(.gray)
        }
        .padding(.vertical, 8)
    }
}
