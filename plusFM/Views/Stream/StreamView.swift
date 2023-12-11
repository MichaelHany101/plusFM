//
//  StreamView.swift
//  plusFM
//
//  Created by Michael Hany on 06/12/2023.
//

import SwiftUI

struct StreamView: View {
    
    @Binding var background : String
    
    var body: some View {
        ZStack{
            Image(background)
                .resizable()
                .edgesIgnoringSafeArea(.all)
                .opacity(0.9)
                .frame(width: .infinity, height: .infinity, alignment: .center)
                .mask(LinearGradient(gradient: Gradient(colors: [.clear, .white]), startPoint: .bottom, endPoint: .top))
            
            VStack{
                
            }
        }
        .onAppear{
            background = getBackgroundUserDefault()
        }
    }
}

struct StreamView_Previews: PreviewProvider {
    static var previews: some View {
        StreamView(background: .constant("PlusFM"))
    }
}
