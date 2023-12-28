//
//  ScrollViewRTL.swift
//  test
//
//  Created by Michael Hany on 25/12/2023.
//

import SwiftUI

struct ScrollViewRTL<Content: View>: View {
  @ViewBuilder var content: Content
  @Environment(\.layoutDirection) private var layoutDirection
  var type: RowType
  var showsIndicator: Bool = false
   
    init(type: RowType,showsIndicator: Bool?, @ViewBuilder content: () -> Content) {
    self.type = type
    self.showsIndicator = showsIndicator ?? false
    self.content = content()
  }
   
  @ViewBuilder var body: some View {
    ScrollView(type.scrollAxis, showsIndicators: showsIndicator) {
      content
        .rotation3DEffect(Angle(degrees: layoutDirection == .rightToLeft ? -180 : 0), axis: (
          x: CGFloat(0),
          y: CGFloat(layoutDirection == .rightToLeft ? -10 : 0),
          z: CGFloat(0)))
       
    }
    .rotation3DEffect(Angle(degrees: layoutDirection == .rightToLeft ? 180 : 0), axis: (
      x: CGFloat(0),
      y: CGFloat(layoutDirection == .rightToLeft ? 10 : 0),
      z: CGFloat(0)))
  }
}

public enum RowType {
  case hList
  case vList
   
  var scrollAxis: Axis.Set {
    switch self {
    case .hList:
      return .horizontal
       
    case .vList:
      return .vertical
    }
  }
}
