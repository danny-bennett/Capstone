//
//  ChartView.swift
//  Daniel Bennett Capstone
//
//  Created by Danny Bennett on 6/15/22.
//

import SwiftUI
import SwiftUICharts

struct ChartView: View {
    @State private var showSurveyView = false
    @State private var showResultView = false
    var patient: MassCharacteristics
    
    var body: some View {
        
        ZStack {
            Color(red: 0.28627450980392155, green: 0.37254901960784315, blue: 0.6509803921568628).ignoresSafeArea()
            
            TabView {
                
                VStack {
                    
                    LineChartView(data: [1,14,95,99], title: "Chance of Cancerous Mass by Perimeter", form: ChartForm.extraLarge)
                    Text("This graph shows how the likelihood of a cancerous mass increases with the perimeter of the mass. \n\n 0-50 : 1% \n 50 - 100 : 14% \n 100-150 : 95% \n 150-200 : 99% \n\n The mass in question has a perimeter of \(patient.perimeter, specifier: "%.2f").")
                        .multilineTextAlignment(.center)
                        .foregroundColor(Color.white)
                        .font(.title2)
                        .padding(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
                    Text("Based on our data.")
                        .foregroundColor(Color.white)
                    
                    Spacer()
                }
                
                VStack {
                    
                    BarChartView(data: ChartData(values: [
                        ("Cancerous", 978),
                        ("Benign", 462),
                        ("Mass In Question", patient.area),]), title: "Average Area ", form: ChartForm.extraLarge)
                    
                    Text("The average area of a cancerous mass is 978. \n\n The average area of a benign mass is 462. \n\n The mass in question has an area of \(patient.area, specifier: "%.2f").")
                        .multilineTextAlignment(.center)
                        .foregroundColor(Color.white)
                        .font(.title2)
                        .padding(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
                    Text("Based on our data.")
                        .foregroundColor(Color.white)
                    Spacer()
                }
                
                VStack {
                    
                    PieChartView(data: [22, 78], title: "Radius of Mass Greater than 14", form: ChartForm.extraLarge)
                    
                    Text("When the radius of a mass is greater than 14, there is a 78% chance that the mass is cancerous. \n\n The mass in question has a radius of \(patient.radius, specifier: "%.2f").")
                        .multilineTextAlignment(.center)
                        .foregroundColor(Color.white)
                        .font(.title3)
                        .padding()
                    Text("Based on our data.")
                        .foregroundColor(Color.white)
                    
                    Spacer()
                }
                
            }
            .tabViewStyle(PageTabViewStyle(indexDisplayMode: .automatic))
            .indexViewStyle(PageIndexViewStyle(backgroundDisplayMode: .always))
        }
    }
}

struct ChartView_Previews: PreviewProvider {
    static var previews: some View {
        ChartView(patient: MassCharacteristics(radius: 0, texture: 0, perimeter: 0, area: 0, smoothness: 0, chance: 0))
    }
}
