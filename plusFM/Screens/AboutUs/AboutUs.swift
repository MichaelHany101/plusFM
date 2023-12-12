//
//  AboutUs.swift
//  plusFM
//
//  Created by Michael Hany on 07/12/2023.
//

import SwiftUI

struct AboutUs: View {
    
    @Binding var isPresented: Bool
    
    var body: some View {
        VStack(alignment: .leading) {
            NavigationBar(isPresented: $isPresented, isArrowHidden: false, isTextHidden: false, title: "About us")
                .background(Color("AppWhite"))
            
            RectSoundShape()
                .padding(.bottom, 30)
            
            VStack(alignment: .leading){
            Text("Plus FM was launched in Bahrain in November 2022")
                .font(.system(size: 18, weight: .light))
                .lineLimit(2)
                .padding(.bottom, 25)
            
            Text("To advertise with is, please contact Group Plus 00973 39 477 727")
                .font(.system(size: 18, weight: .light))
                .lineLimit(2)
        }
            
            Spacer()
            
            TabBar(index: .constant(2))
        }
        .background(Color("AppGray"))
    }
}

struct AboutUs_Previews: PreviewProvider {
    static var previews: some View {
        AboutUs(isPresented: .constant(false))
    }
}