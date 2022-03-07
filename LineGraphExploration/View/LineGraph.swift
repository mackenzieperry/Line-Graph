//
//  LineGraph.swift
//  LineGraphExploration
//
//  Created by Mackenzie Perry on 3/6/22.
//

import SwiftUI

struct LineGraph: View {
    var data: [CGFloat]
    var color: Color
    @State var currentPlot = ""
    
    @State var offset: CGSize = .zero
    @State var showPlot = false
    
    var screenWidth = UIScreen.main.bounds.width
    var body: some View {
        GeometryReader { proxy in
            let height = proxy.size.height
            let width = (proxy.size.width) / CGFloat(data.count)
            let maxPoint = (data.max() ?? 0) + 100
            
            let points = data.enumerated().compactMap { item -> CGPoint in
                // getting progress and multiplyting with height
                let progress = item.element / maxPoint
                let pathHeight = progress * height
                
                // width
                let pathWidth = width * CGFloat(item.offset)
                return CGPoint(x: pathWidth, y: -pathHeight + height)
            }
                
            ZStack {
                Path { path in
                    // drawing the points
                    path.move(to: CGPoint(x: 0, y: 0))
                    path.addLines(points)
         //           Path.quadCurvedPathWithPoints(points: points, step: CGPoint(x: 0, y: 0), globalOffset: 0)
                    
                
                    //path.addQuadCurve(to: CGPoint(
                }
                
                .strokedPath(StrokeStyle(lineWidth: 2.5, lineCap: .round, lineJoin: .round))
                .foregroundColor(color)
            }
            .overlay(
                VStack {
                    Circle()
                        .fill(Color.purple)
                        .frame(width: 22, height: 22)
                        .overlay(
                            Circle()
                                .fill(.white)
                                .frame(width: 10, height: 10)
                        )
                }
                .frame(width: screenWidth, height: 150)
                    
                // frame height / 2
                .offset(y: 75)
                .offset(offset)
                .opacity(showPlot ? 1 : 0),
                alignment: .bottomLeading
            )
            
            .contentShape(Rectangle())
            
            .gesture(DragGesture(minimumDistance: 0).onChanged { value in
                withAnimation { showPlot = true }
                let translation = value.location.x - (screenWidth / 2)
                //print("Translation:\(translation)")
                let add = CGFloat(data.count / 2 + 1)
                let index = max(min(Int((translation / width).rounded() + add), data.count - 1), 0)
               // print("\((translation / width).rounded() + 3)")
                //print(index)
                
                withAnimation(.easeInOut(duration: 0.1)) {
                    offset = CGSize(width: points[index].x - (screenWidth / 2), height: points[index].y - height)
                }
                
                //  offset = CGSize(width: translation, height: 0)
                
            }.onEnded { _ in
                withAnimation { showPlot = false }
            })
        }
        .padding(.horizontal, 10)
    }
}

struct LineGraph_Previews: PreviewProvider {
    static var previews: some View {
        LineGraph(data: samplePlot, color: .purple)
    }
}
