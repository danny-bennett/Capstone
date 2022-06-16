//
//  ChartView.swift
//  Daniel Bennett Capstone
//
//  Created by Danny Bennett on 6/15/22.
//

import SwiftUI
import SwiftUICharts

struct ChartView: View {
    
    
    var body: some View {
        TabView {
            
            VStack {
                LineChartView(data: [2,5,13,6,10], title: "Line Chart", form: ChartForm.extraLarge)
                Text("Your score blah blah blah")
                    .padding()
                    .foregroundColor(Color.white)
                    .font(.title)
            }
                
                
            
            VStack {
                BarChartView(data: ChartData(values: [
                   ("Test", 12),
                   ("Test2", 3),
                   ("Test3", 5),
               ("Test4", 15)]), title: "Bar Graph", form: ChartForm.extraLarge)
                
                Text("Your score blah blah blah")
                    .padding()
                    .foregroundColor(Color.white)
                    .font(.title)
            }
            
            VStack {
                PieChartView(data: [40, 60], title: "Pie Chart", form: ChartForm.extraLarge)
                
                Text("Your score blah blah blah")
                    .padding()
                    .foregroundColor(Color.white)
                    .font(.title)
            }
            
        }
        .background(Color(red: 0.28627450980392155, green: 0.37254901960784315, blue: 0.6509803921568628))
        .tabViewStyle(PageTabViewStyle(indexDisplayMode: .automatic))
        .indexViewStyle(PageIndexViewStyle(backgroundDisplayMode: .always))
        
    }
        
}

struct ChartView_Previews: PreviewProvider {
    static var previews: some View {
        ChartView()
    }
}
