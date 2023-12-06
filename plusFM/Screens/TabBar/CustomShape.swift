//
//  CustomShape.swift
//  plusFM
//
//  Created by Michael Hany on 06/12/2023.
//

import SwiftUI

struct CustomShape : Shape {
    
    @Binding var curvePosition : CGFloat
    
    func path(in rect: CGRect) -> Path {
        return Path{path in
            
            path.move(to: CGPoint(x: 0, y: 0))
            path.addLine(to: CGPoint(x: 0, y: rect.height))
            path.addLine(to: CGPoint(x: rect.width, y: rect.height))
            path.addLine(to: CGPoint(x: rect.width, y: 0))

            
            path.move(to: CGPoint(x: curvePosition + 80, y: 0))
            
            path.addQuadCurve(to: CGPoint(x: curvePosition - 80, y: 0), control: CGPoint(x: curvePosition, y: 100))
        }
    }
}
