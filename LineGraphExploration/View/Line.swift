//
//  LineGraph.swift
//  LineGraphExploration
//
//  Created by Mackenzie Perry on 3/6/22.
//

import SwiftUI

struct Line: View {
    let color: Color
    let data: [Double]
    @Binding var touchLocation: CGPoint
    let showCircle: Bool
    
    func stepWidth(totalWidth: CGFloat) -> CGFloat {
        if data.count < 2 {
            return 0
        }
        return totalWidth / CGFloat(data.count)
    }

    var stepHeight: CGFloat {
        var min: Double?
        var max: Double?
        if let minPoint = data.min(), let maxPoint = data.max(), minPoint != maxPoint {
            min = minPoint
            max = maxPoint
        } else {
            return 0
        }
        if let min = min, let max = max, min != max {
            return 150 / CGFloat(max-min)
        }
        return 0
    }
    
    func path(totalWidth: CGFloat) -> Path {
        Path.quadCurvedPathWithPoints(points: data, step: CGPoint(x: stepWidth(totalWidth: totalWidth), y: -stepHeight), globalOffset: nil)
    }
    
    var body: some View {
        GeometryReader { proxy in
            let height = proxy.size.height
            ZStack {
                self.path(totalWidth: proxy.size.width)
                    .strokedPath(StrokeStyle(lineWidth: 2.5, lineCap: .round, lineJoin: .round))
                    .foregroundColor(color)
            }
            .offset(y: height)
            .overlay(
                trackingCircle
                    .position(self.getClosestPointOnPath(touchLocation: self.touchLocation, totalWidth: proxy.size.width))
                    .frame(width: proxy.size.width, height: 150)
                    .offset(y: 150)
                    .opacity(showCircle ? 1 : 0),
                alignment: .bottomLeading
            )
            .contentShape(Rectangle())
        }
    }
    
    func getClosestPointOnPath(touchLocation: CGPoint, totalWidth: CGFloat) -> CGPoint {
        let closest = self.path(totalWidth: totalWidth).point(to: touchLocation.x)
        return closest
    }
    
    var trackingCircle: some View {
        VStack {
            Circle()
                .fill(color)
                .frame(width: 12, height: 12)
        }
    }
}


struct Line_Previews: PreviewProvider {
    static var previews: some View {
        Line(color: Color.purple, data: samplePlot, touchLocation: .constant(CGPoint(x: 100, y: 12)), showCircle: true)
    }
}
