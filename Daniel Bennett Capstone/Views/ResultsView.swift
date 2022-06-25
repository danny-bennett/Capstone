//
//  ResultsView.swift
//  Daniel Bennett Capstone
//
//  Created by Danny Bennett on 6/11/22.
//

import SwiftUI

struct ResultsView: View {
    
    @State private var showChartView = false
    @State private var showSurveyView = false
    var patient: MassCharacteristics
    var body: some View {
        
        ZStack {
            Color(red: 0.28627450980392155, green: 0.37254901960784315, blue: 0.6509803921568628)
                .ignoresSafeArea()
            VStack {
                
                Image("EarlyAlertSkinny")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 200, height: 130)
                Spacer()
                
                Text("The chance of this mass being cancerous is:")
                    .foregroundColor(Color(red: 0.9647058823529412, green: 0.6823529411764706, blue: 0.5176470588235295))
                    .multilineTextAlignment(.center)
                    .font(.title2)
                    .padding()
                
                Text("\(patient.chance)%")
                    .fontWeight(.bold)
                    .foregroundColor(Color(red: 0.9647058823529412, green: 0.6823529411764706, blue: 0.5176470588235295))
                    .multilineTextAlignment(.center)
                    .font(.largeTitle)
                    .padding()
                
                if patient.chance >= 50 {
                    Text("This mass is considered high risk.")
                        .foregroundColor(Color(red: 0.9647058823529412, green: 0.6823529411764706, blue: 0.5176470588235295))
                        .multilineTextAlignment(.center)
                        .font(.title2)
                        .padding()
                } else {
                    Text("This mass is considered low risk.")
                        .foregroundColor(Color(red: 0.9647058823529412, green: 0.6823529411764706, blue: 0.5176470588235295))
                        .multilineTextAlignment(.center)
                        .font(.title2)
                        .padding()
                }
                
                Spacer()
                
                Button {
                    showChartView = true
                    
                } label: {
                    Text("See the Data Visually")
                }
                .padding(.vertical, 20.0)
                .font( .title)
                .tint(Color(red: 0.9647058823529412, green: 0.6823529411764706, blue: 0.5176470588235295))
                .buttonStyle(.borderedProminent)
                .buttonBorderShape(.capsule)
                .controlSize(.regular)
            }
            Spacer()
            
            NavigationLink(destination: ChartView(patient: MassCharacteristics(radius: patient.radius, texture: patient.texture, perimeter: patient.perimeter, area: patient.area, smoothness: patient.smoothness, chance: patient.chance)), isActive: $showChartView){}
        }
    }
}

struct ResultsView_Previews: PreviewProvider {
    static let resultsPreview = MassCharacteristics(radius: 0, texture: 0, perimeter: 0, area: 0, smoothness: 0, chance: 15)
    static var previews: some View {
        ResultsView(patient: resultsPreview)
    }
}
