//
//  ContentView.swift
//  LineGraphExploration
//
//  Created by Mackenzie Perry on 3/6/22.
//

import SwiftUI
//
//struct Transaction {
//
//    var total: [Double]
//
//    init() {
//        total = [7.00, 23.00, 5.00, 3.25, 8.99]
//    }
//
//}

//struct LineChartView: View {
//
//
//    let values: [Double]
//
//    let screenWidth = UIScreen.main.bounds.width
//
//    private var path: Path {
//        if values.isEmpty{
//            return Path()
//        }
//
//        var offsetX: Double = screenWidth/CGFloat(values.count)
//        var path = Path()
//        path.move(to: CGPoint(x: offsetX, y: values[0]))
//
//        for value in values {
//            offsetX += screenWidth/CGFloat(values.count)
//            path.addLine(to: CGPoint(x: offsetX, y: value))
//        }
//
//        return path
//    }
//
//    var body: some View {
//        VStack {
//            path.stroke(Color.secondary, lineWidth:  2.0)
//        }
//    }
//}

struct ContentView: View {
    var body: some View {
        VStack {
            HomeView()
           // Text("Print")
           // LineGraph(data: samplePlot)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
