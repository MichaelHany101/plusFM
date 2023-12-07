//
//  NavigationBar.swift
//  plusFM
//
//  Created by Michael Hany on 07/12/2023.
//

import SwiftUI

struct NavigationBar: View {
    
    @Binding var isPresented: Bool
    
    var isArrowHidden : Bool = true
    var isTextHidden : Bool = true
    var title : String = ""
    
    var body: some View {
        HStack{
            Button(action: {
                isPresented.toggle()
            }){
                Image(isArrowHidden ? "" : "Back")
            }
            
            Spacer()
            
            Text(isTextHidden ? "" : title)
                .font(.system(size: 22, weight: .semibold))
            Spacer()
            
            HStack{
                Image("NavOne")
                    .padding(.trailing, 15)
                
                Image("NavTwo")
                    .padding(.leading, 15)
            }
        }
        .frame(width: .infinity, height: 120)
        .background(Color.clear)
        .padding(.horizontal, 25)
    }
}

struct NavigationBar_Previews: PreviewProvider {
    static var previews: some View {
        NavigationBar(isPresented: .constant(false), isArrowHidden: false, isTextHidden: false, title: "No Title")
    }
}
