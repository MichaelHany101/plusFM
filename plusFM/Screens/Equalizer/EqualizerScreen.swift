//
//  EqualizerScreen.swift
//  test
//
//  Created by Michael Hany on 25/12/2023.
//

import SwiftUI

struct EqualizerScreen: View {
    
    @State private var selected: String = ""
    
    var body: some View {
        VStack{
//MARK: - Sliders
            HStack(spacing: 20){
                Spacer()
                CustomSlider(sliderValue: 0.5, hzValue: "64 Hz")
                Spacer()
                CustomSlider(sliderValue: 0.5, hzValue: "800 Hz")
                Spacer()
                CustomSlider(sliderValue: 0.5, hzValue: "4 kHz")
                Spacer()
                CustomSlider(sliderValue: 0.5, hzValue: "14 Hz")
                Spacer()
            }
            
//MARK: - Buttons
            ScrollViewRTL(type: .hList, showsIndicator: false) {
                
                HStack(alignment: .center, spacing: 15){
                    //MARK: - Rock
                    Button(action: {
                        selected = "Rock"
                        //Rock
                    }){
                        if (selected == "Rock") {
                            RoundedRectangle(cornerRadius: 25)
                                .frame(width: 100, height: 50)
                                .foregroundColor(Color("AppOrange"))
                                .overlay(
                                    Text("Rock")
                                        .foregroundColor(Color("AppWhite"))
                                        .font(.system(size: 18, weight: .semibold))
                                        .padding()
                                )
                        }
                        else {
                            RoundedRectangle(cornerRadius: 25)
                                .frame(width: 100, height: 50)
                                .foregroundColor(Color("AppWhite"))
                                .overlay(
                                    Text("Rock")
                                        .foregroundColor(Color("AppBlack"))
                                        .font(.system(size: 18, weight: .semibold))
                                        .padding()
                                )
                        }
                    }
                    
                    //MARK: - Vocal
                    Button(action: {
                        selected = "Vocal"
                        //Normal
                    }){
                        if (selected == "Vocal") {
                            RoundedRectangle(cornerRadius: 25)
                                .frame(width: 100, height: 50)
                                .foregroundColor(Color("AppOrange"))
                                .overlay(
                                    Text("Vocal")
                                        .foregroundColor(Color("AppWhite"))
                                        .font(.system(size: 18, weight: .semibold))
                                        .padding()
                                )
                        }
                        else {
                            RoundedRectangle(cornerRadius: 25)
                                .frame(width: 100, height: 50)
                                .foregroundColor(Color("AppWhite"))
                                .overlay(
                                    Text("Vocal")
                                        .foregroundColor(Color("AppBlack"))
                                        .font(.system(size: 18, weight: .semibold))
                                        .padding()
                                )
                        }
                    }
                    
                    //MARK: - Dance
                    Button(action: {
                        selected = "Dance"
                        //Normal
                    }){
                        if (selected == "Dance") {
                            RoundedRectangle(cornerRadius: 25)
                                .frame(width: 100, height: 50)
                                .foregroundColor(Color("AppOrange"))
                                .overlay(
                                    Text("Dance")
                                        .foregroundColor(Color("AppWhite"))
                                        .font(.system(size: 18, weight: .semibold))
                                        .padding()
                                )
                        }
                        else {
                            RoundedRectangle(cornerRadius: 25)
                                .frame(width: 100, height: 50)
                                .foregroundColor(Color("AppWhite"))
                                .overlay(
                                    Text("Dance")
                                        .foregroundColor(Color("AppBlack"))
                                        .font(.system(size: 18, weight: .semibold))
                                        .padding()
                                )
                        }
                    }
                    
                    //MARK: - Pop
                    Button(action: {
                        selected = "Pop"
                        //Normal
                    }){
                        if (selected == "Pop") {
                            RoundedRectangle(cornerRadius: 25)
                                .frame(width: 100, height: 50)
                                .foregroundColor(Color("AppOrange"))
                                .overlay(
                                    Text("Pop")
                                        .foregroundColor(Color("AppWhite"))
                                        .font(.system(size: 18, weight: .semibold))
                                        .padding()
                                )
                        }
                        else {
                            RoundedRectangle(cornerRadius: 25)
                                .frame(width: 100, height: 50)
                                .foregroundColor(Color("AppWhite"))
                                .overlay(
                                    Text("Pop")
                                        .foregroundColor(Color("AppBlack"))
                                        .font(.system(size: 18, weight: .semibold))
                                        .padding()
                                )
                        }
                    }
                    
                    //MARK: - Electric
                    Button(action: {
                        selected = "Electric"
                        //Normal
                    }){
                        if (selected == "Electric") {
                            RoundedRectangle(cornerRadius: 25)
                                .frame(width: 100, height: 50)
                                .foregroundColor(Color("AppOrange"))
                                .overlay(
                                    Text("Electric")
                                        .foregroundColor(Color("AppWhite"))
                                        .font(.system(size: 18, weight: .semibold))
                                        .padding()
                                )
                        }
                        else {
                            RoundedRectangle(cornerRadius: 25)
                                .frame(width: 100, height: 50)
                                .foregroundColor(Color("AppWhite"))
                                .overlay(
                                    Text("Electric")
                                        .foregroundColor(Color("AppBlack"))
                                        .font(.system(size: 18, weight: .semibold))
                                        .padding()
                                )
                        }
                    }
                }
            }
            Spacer()
        }
        .background(Color.clear)
    }
}

struct EqualizerScreen_Previews: PreviewProvider {
    static var previews: some View {
        EqualizerScreen()
    }
}
