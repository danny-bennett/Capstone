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
    @State var percentage: Int
    @State var wrongPercentage: Int
    @State private var showResultView = false
    @State private var showLoginView = false
    
    let formatter: NumberFormatter = {
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        return formatter
    }()
    
    
    @State var characteristicsForResultsView = MassCharacteristics(radius: 0, texture: 0, perimeter: 0, area: 0, smoothness: 0, chance: 0)
    
    var body: some View {
        
        ZStack {
            Color(red: 0.28627450980392155, green: 0.37254901960784315, blue: 0.6509803921568628)
                .ignoresSafeArea()
                
            
            VStack {
                HStack {
                    Spacer()
                    Button {
                        showLoginView = true
                    } label: {
                        HStack {
                            Image(systemName: "arrow.down.left.circle.fill")
                                .foregroundColor(Color.white)
                            Text("Sign Out")
                                .foregroundColor(Color(red: 0.9647058823529412, green: 0.6823529411764706, blue: 0.5176470588235295))
                        }
                    }
                }
                .padding()
                
                NavigationLink(destination: LoginView(), isActive: $showLoginView){}
                
                Image("EarlyAlertSkinny")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 200, height: 130)
                    .padding(.top)
                Spacer()
                VStack(alignment: .leading, spacing: 0) {
                    
                    Text("Radius: \(characteristicsForResultsView.radius, specifier: "%.2f")")
                        .foregroundColor(.white)
                        .padding(.vertical, 7.0)
                    Slider(value: $characteristicsForResultsView.radius, in: 0...30)
                        .accentColor(Color(red: 0.9647058823529412, green: 0.6823529411764706, blue: 0.5176470588235295))
                    
                    Text("Texture: \(characteristicsForResultsView.texture, specifier: "%.2f") ")
                        .foregroundColor(.white)
                        .padding(.vertical, 7.0)
                    Slider(value: $characteristicsForResultsView.texture, in: 0...40)
                        .accentColor(Color(red: 0.9647058823529412, green: 0.6823529411764706, blue: 0.5176470588235295))
                    
                    Text("Perimeter: \(characteristicsForResultsView.perimeter, specifier: "%.2f") ")
                        .foregroundColor(.white)
                        .padding(.vertical, 7.0)
                    Slider(value: $characteristicsForResultsView.perimeter, in: 0...200)
                        .accentColor(Color(red: 0.9647058823529412, green: 0.6823529411764706, blue: 0.5176470588235295))
                    
                    Text("Area: \(characteristicsForResultsView.area, specifier: "%.2f") ")
                        .foregroundColor(.white)
                        .padding(.vertical, 7.0)
                    Slider(value: $characteristicsForResultsView.area, in: 0...2600)
                        .accentColor(Color(red: 0.9647058823529412, green: 0.6823529411764706, blue: 0.5176470588235295))
                    
                    Text("Smoothness: \(characteristicsForResultsView.smoothness, specifier: "%.2f") ")
                        .foregroundColor(.white)
                        .padding(.vertical, 7.0)
                    Slider(value: $characteristicsForResultsView.smoothness, in: 0...1)
                        .accentColor(Color(red: 0.9647058823529412, green: 0.6823529411764706, blue: 0.5176470588235295))
                }
                .padding(.horizontal)
    
                
                Spacer()
                
                Button {
                    
                    let result = calculateCancer()
                    characteristicsForResultsView.chance = result
                    showResultView = true
                    
                } label: {
                    Text("Calculate")
                }
                .padding(.vertical, 20.0)
                .font( .title)
                .tint(Color(red: 0.9647058823529412, green: 0.6823529411764706, blue: 0.5176470588235295))
                .buttonStyle(.borderedProminent)
                .buttonBorderShape(.capsule)
                .controlSize(.regular)
                
                NavigationLink(destination: ResultsView(patient: characteristicsForResultsView), isActive: $showResultView){}
                
                Spacer()
            }
            .navigationBarHidden(true)
            
        }
        .navigationBarHidden(true)
        .navigationBarBackButtonHidden(true)
    }
    
    
    
    
    
    func calculateCancer() -> Int {
        
        
        
        do {
            let config = MLModelConfiguration()
            let model = try CancerCalculator(configuration: config)
            
            let prediction = try model.prediction(mean_radius: characteristicsForResultsView.radius, mean_texture: characteristicsForResultsView.texture, mean_perimeter: characteristicsForResultsView.perimeter, mean_area: characteristicsForResultsView.area, mean_smoothness: characteristicsForResultsView.smoothness)
            wrongPercentage = Int(prediction.diagnosis * 100.0)
            percentage = 100 - wrongPercentage
            if percentage > 100 {
                percentage = 100
            } else if percentage < 0 {
                percentage = 0
            }
            
            
            //alertTitle = "Chance of Cancer: "
            //alertMessage = "\(percentage)%"
        } catch {
            //alertTitle = "Error"
            //alertMessage = "There was an error calculating probability of Cancer."
        }
        return percentage
        //showingAlert = true
        
    }
    
}


struct SurveyView_Previews: PreviewProvider {
    static var previews: some View {
        SurveyView(radius: 0, texture: 0, perimeter: 0, area: 0, smoothness: 0, percentage: 0, wrongPercentage: 0)
    }
}
