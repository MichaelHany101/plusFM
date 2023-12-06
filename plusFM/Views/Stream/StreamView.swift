//
//  StreamView.swift
//  plusFM
//
//  Created by Michael Hany on 06/12/2023.
//

import SwiftUI

struct StreamView: View {
    var body: some View {
        ZStack{
            Image(getBackgroundUserDefault())
                .resizable()
                .edgesIgnoringSafeArea(.all)
                .opacity(0.9)
                .frame(width: .infinity, height: .infinity, alignment: .center)
                .mask(LinearGradient(gradient: Gradient(colors: [.clear, .white]), startPoint: .bottom, endPoint: .top))
        }
    }
}

struct StreamView_Previews: PreviewProvider {
    static var previews: some View {
        StreamView()
    }
}
