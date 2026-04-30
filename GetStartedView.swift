//
//  GetStartedView.swift
//  FirstCall
//
//  Created by NIDHI URS  on 23/02/26.
//


import SwiftUI
import Foundation
struct GetStartedView: View {
    var body: some View {
        NavigationView {
            VStack(spacing: 40) {
                Spacer()
                Image(systemName: "phone.fill")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 120, height: 120)
                    .foregroundColor(.blue)
                Text("FirstCall")
                    .font(.largeTitle)
                    .bold()
                Text("Your emergency companion app. Access instructions and call help instantly.")
                    .multilineTextAlignment(.center)
                    .padding()
                Spacer()
                NavigationLink(destination: CategoryGridView()) {
                    Text("Get Started")
                        .font(.headline)
                        .foregroundColor(.white)
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.blue)
                        .cornerRadius(12)
                        .padding(.horizontal)
                }
                Spacer()
            }
        }
    }
}

