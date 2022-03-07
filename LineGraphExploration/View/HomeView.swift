//
//  HomeView.swift
//  LineGraphExploration
//
//  Created by Mackenzie Perry on 3/6/22.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        
        Text("Total Spending")
            .font(.title2)
        
        LineGraph(data: samplePlot2, color: .secondary)
            .frame(height: 150)
            .overlay(
                LineGraph(data: samplePlot, color: .purple)
            )
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}

let samplePlot: [CGFloat] = [12, 35, 140, 162, 245, 300, 350, 360, 411, 425, 430, 457, 468, 530, 550, 600, 620, 625, 1000]

let samplePlot2: [CGFloat] = [5, 20, 32, 35, 42, 67, 120, 178, 220, 244, 291, 301, 333, 340, 366, 399, 450, 475, 480, 520]

//[989,1200,750,650,790,650,950,1200,600,500,600,890,1203,1400,900,1250,1600,1200]


