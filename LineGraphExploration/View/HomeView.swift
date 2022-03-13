//
//  HomeView.swift
//  LineGraphExploration
//
//  Created by Mackenzie Perry on 3/6/22.
//

import SwiftUI

struct HomeView: View {
        
//    @State private var indicatorLocation:CGPoint = .zero
    
    var body: some View {
        
        VStack{
            Text("Total Spending")
                .font(.title2)
            ZStack {
                LineGraph(color1: Color.secondary, color2: Color.purple, data1: samplePlot, data2: samplePlot2)
                    .frame(height: 150)
//                LineGraph(color: Color.purple, data: samplePlot2, touchLocation: self.$indicatorLocation)
//                    .frame(height: 150)
            }
//            LineGraph(color: Color.secondary, data: samplePlot2, touchLocation: self.$indicatorLocation)
//                .frame(height: 100)
//            LineGraph(color: Color.purple, data: samplePlot, touchLocation: self.$indicatorLocation)
//                .frame(height: 100)
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}



let samplePlot: [Double] = [12, 35, 140, 162, 245, 300, 350, 360, 411, 425, 430, 457, 468, 530, 550, 600, 620, 625, 1000, 1200]

let samplePlot2: [Double] = [5, 20, 32, 35, 42, 67, 120, 178, 220, 244, 291, 301, 333, 340, 366, 399, 450, 475, 480, 520]

