//
//  HomeGridItem.swift
//  plusFM
//
//  Created by Michael Hany on 07/12/2023.
//

import SwiftUI

struct HomeGridItem: View {
    
    @State var icon : String
    @State var name : String
    
    var body: some View {
            ZStack{
                RoundedRectangle(cornerRadius: 25)
                    .fill(Color("AppWhite"))
                    .frame(width: 130, height: 130)
                    .overlay(
                        RoundedRectangle(cornerRadius: 25)
                            .stroke(Color("AppPink"), lineWidth: 5)
                            .blur(radius: 5)
                            .mask(RoundedRectangle(cornerRadius: 25))
                    )
                
                VStack(alignment: .center){
                    Image(icon)
                        .resizable()
                        .frame(width: 30, height: 30)
                        .padding(.horizontal, 50)
                        .padding(.top, 35)
                        .padding(.bottom, 15)
                    
                    Text(name)
                        .font(.system(size: 18, weight: .semibold))
                        .foregroundColor(Color("AppBlack"))
                        .padding(.horizontal, 50)
                        .padding(.bottom, 25)
                }
                .background(Color.clear)
            }
    }
}

struct HomeGridItem_Previews: PreviewProvider {
    static var previews: some View {
        HomeGridItem(icon: "Libraries", name: "Libraries")
    }
}
