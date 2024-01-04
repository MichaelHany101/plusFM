//
//  Themes.swift
//  plusFM
//
//  Created by Michael Hany on 07/12/2023.
//

import SwiftUI

struct Themes: View {
    @State var icon : String
    @State var name : String
    @State var textColor : Color
    @State var boxColor : Color
    @State var action : () -> Void
    
    var body: some View {
        Button(action: {
            action()
        }){
            ZStack{
                RoundedRectangle(cornerRadius: 25)
                    .fill(boxColor)
                    .frame(width: 120, height: 120)
                    .overlay(
                        RoundedRectangle(cornerRadius: 25)
                            .stroke(Color("AppPink"), lineWidth: 5)
                            .blur(radius: 5)
                            .mask(RoundedRectangle(cornerRadius: 25))
                    )
                
                VStack{
                    Image(icon)
                        .resizable()
                        .frame(width: 75)
                        .scaledToFit()
                        .padding(.horizontal, 30)
                    
                    Text(name == "Default" ? "Default_Choice" : (name == "City 1" ? "City_One_Choice" : (name == "City 2" ? "City_Two_Choice" : (name == "Winter" ? "Winter_Choice" : (name == "Work" ? "Work_Choice" : (name == "Sports" ? "Sports_Choice" : ""))))))
                        .font(.system(size: 18, weight: .semibold))
                        .foregroundColor(textColor)
                        .padding(.bottom, 15)
                }
                .background(Color.clear)
            }
        }
    }
}

struct Themes_Previews: PreviewProvider {
    static var previews: some View {
        Themes(icon: "PlusFM-Black", name: "Default", textColor: Color("AppBlack"), boxColor: Color("AppWhite"), action: {print("Error")})
    }
}
