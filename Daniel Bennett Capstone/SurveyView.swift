//
//  SurveyView.swift
//  Daniel Bennett Capstone
//
//  Created by Danny Bennett on 5/3/22.
//
import CoreML
import SwiftUI

struct SurveyView: View {
    
    
    @State var radius: Double
    @State var texture: Double
    @State var perimeter: Double
    @State var area: Double
    @State var smoothness: Double
    @State private var alertTitle = ""
    @State private var alertMessage = ""
    @State private var showingAlert = false
    
    let formatter: NumberFormatter = {
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        return formatter
    }()
    
    
    var body: some View {
        ZStack {
            Color(red: 0.28627450980392155, green: 0.37254901960784315, blue: 0.6509803921568628)
                .ignoresSafeArea()
            
            VStack {
                VStack(alignment: .leading) {
                    Text("Radius: ")
                        .foregroundColor(.white)
                    TextField("", value: $radius, formatter: formatter)
                        .padding(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
                        .border(.secondary)
                        .disableAutocorrection(true)
                        .textInputAutocapitalization(.never)
                        .foregroundColor(Color(red: 0.9647058823529412, green: 0.6823529411764706, blue: 0.5176470588235295))
                    
                    Text("Texture: ")
                        .foregroundColor(.white)
                    TextField("", value: $texture, formatter: formatter)
                        .padding(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
                        .border(.secondary)
                        .disableAutocorrection(true)
                        .textInputAutocapitalization(.never)
                        .foregroundColor(Color(red: 0.9647058823529412, green: 0.6823529411764706, blue: 0.5176470588235295))
                        
                    Text("Perimeter: ")
                        .foregroundColor(.white)
                    TextField("", value: $perimeter, formatter: formatter)
                        .padding(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
                        .border(.secondary)
                        .disableAutocorrection(true)
                        .textInputAutocapitalization(.never)
                        .foregroundColor(Color(red: 0.9647058823529412, green: 0.6823529411764706, blue: 0.5176470588235295))
                    
                    Text("Area: ")
                        .foregroundColor(.white)
                    TextField("", value: $area, formatter: formatter)
                        .padding(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
                        .border(.secondary)
                        .disableAutocorrection(true)
                        .textInputAutocapitalization(.never)
                        .foregroundColor(Color(red: 0.9647058823529412, green: 0.6823529411764706, blue: 0.5176470588235295))
                    
                    Text("Smoothness: ")
                        .foregroundColor(.white)
                    TextField("", value: $smoothness, formatter: formatter)
                        .padding(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
                        .border(.secondary)
                        .disableAutocorrection(true)
                        .textInputAutocapitalization(.never)
                        .foregroundColor(Color(red: 0.9647058823529412, green: 0.6823529411764706, blue: 0.5176470588235295))
                }
                .padding(.horizontal)
                
                Button {
                    calculateCancer()
                } label: {
                    Text("Calculate")
                }
                .alert(alertTitle, isPresented: $showingAlert) {
                    Button("OK") {}
                } message: {
                    Text(alertMessage)
                }

            }
        }
    }
    
    func calculateCancer() {
        do {
            let config = MLModelConfiguration()
            let model = try CancerCalculator(configuration: config)
            
            let prediction = try model.prediction(mean_radius: radius, mean_texture: texture, mean_perimeter: perimeter, mean_area: area, mean_smoothness: smoothness)
            alertTitle = "Chance of Cancer: "
            alertMessage = String(prediction.diagnosis)
        } catch {
            alertTitle = "Error"
            alertMessage = "There was an error calculating probability of Cancer."
        }
        
        showingAlert = true
    }
}

struct SurveyView_Previews: PreviewProvider {
    static var previews: some View {
        SurveyView(radius: 0, texture: 0, perimeter: 0, area: 0, smoothness: 0)
    }
}
