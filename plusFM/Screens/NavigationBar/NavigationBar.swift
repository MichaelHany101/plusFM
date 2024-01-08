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
                Image(isArrowHidden ? "" : "Back")//(getLanguageUserDefault() == "English" ? "Back" : "Back_Arabic"))
            }
            
            Spacer()
            
            Text(isTextHidden ? "" : (title == "Language" ? "Language_Navigation" : (title == "About_Us" ? "About_Us_Navigation" : (title == "Libraries" ? "Libraries_Navigation" : (title == "Themes" ? "Themes_Navigation" : "")))))
                .font(.system(size: 22, weight: .semibold))
            Spacer()
            
            HStack{
                Button(action: {
                    //Code
                }){
                    Image("NavOne")
                        .padding(.trailing, 15)
                        .frame(width: 15, height: 15)
                }
                Spacer()
                Button(action: {
                    //Code
                }){
                    Image("NavTwo")
                        .padding(.leading, 15)
                        .frame(width: 15, height: 15)
                }
            }
            .frame().frame(width: 60, height: 50)
            .padding(.trailing, 20)
        }
        .frame(width: .infinity, height: 50)
        .background(Color.clear)
        .padding(.horizontal, 25)
    }
}

struct NavigationBar_Previews: PreviewProvider {
    static var previews: some View {
        NavigationBar(isPresented: .constant(false), isArrowHidden: false, isTextHidden: false, title: "No Title")
    }
}
