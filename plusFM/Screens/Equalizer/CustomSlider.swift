//
//  CustomSlider.swift
//  test
//
//  Created by Michael Hany on 25/12/2023.
//

import SwiftUI

struct CustomSlider: View {
    
    @State var sliderValue: Double
    @State var hzValue: String
    
    var body: some View {
        VStack{
            ZStack{
                RoundedRectangle(cornerRadius: 25)
                    .fill(LinearGradient(gradient: Gradient(colors: [.clear, Color("AppOrange")]), startPoint: .bottom, endPoint: .top))
                    .frame(width: 15, height: 150)
                
                Slider(value: $sliderValue)
                    .rotationEffect(.degrees(-90))
                    .frame(width: 15, height: 140)
                    .accentColor(.clear)
            }
            Text("\(hzValue)")
        }
    }
}
struct CustomSlider_Previews: PreviewProvider {
    static var previews: some View {
        CustomSlider(sliderValue: 0.5, hzValue: "64 Hz")
    }
}
