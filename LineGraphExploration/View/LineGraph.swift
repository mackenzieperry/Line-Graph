//
//  LineGraph.swift
//  LineGraphExploration
//
//  Created by Mackenzie Perry on 3/6/22.
//

import SwiftUI

struct LineGraph: View {
    let color1: Color
    let color2: Color
    let data1: [Double]
  //  let data2: [Double]
    @State var touchLocation: CGPoint = .zero
    
    @State var showDetails = false

    var screenWidth = UIScreen.main.bounds.width
    
    var body: some View {
        GeometryReader { proxy in
            let height = proxy.size.height
            ZStack {
                Line(color: color2, data: data1, touchLocation: self.$touchLocation, showCircle: showDetails, totalDays: 30)
        //        Line(color: color2, data: data2, touchLocation: self.$touchLocation, showCircle: showDetails)
            }
            .contentShape(Rectangle())
            .gesture(DragGesture(minimumDistance: 0).onChanged { value in
                withAnimation { showDetails = true }
                self.touchLocation = value.location
            }.onEnded { _ in
                withAnimation { showDetails = false }
            })
            .overlay(
                VStack {
                    Text(getCurrentLabel(toPoint: touchLocation, width: proxy.size.width, height: height, data: data1, totalDays: 30))
             //       Text(getCurrentLabel(toPoint: touchLocation, width: proxy.size.width, height: height, data: data2))
                }
                .opacity(showDetails ? 1 : 0),
                alignment: .bottomTrailing
            )
        }
        .padding(.horizontal, 10)
    }
    
    func getCurrentLabel(toPoint: CGPoint, width: CGFloat, height: CGFloat, data: [Double], totalDays: CGFloat) -> String {
        let stepWidth: CGFloat = width / totalDays
        let index:Int = Int(floor(toPoint.x/stepWidth))
        if (index >= 0 && index < data.count){
            return "Day \(index+1)\n $\(data[index])"
        } else {
            return ""
        }
    }
}



//struct LineGraph_Previews: PreviewProvider {
//    static var previews: some View {
//        LineGraph(color: Color.purple, data: samplePlot, touchLocation: .constant(CGPoint(x: 100, y: 12)))
//    }
//}
