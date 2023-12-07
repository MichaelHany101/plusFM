//
//  Language.swift
//  plusFM
//
//  Created by Michael Hany on 07/12/2023.
//

import SwiftUI

struct Language: View {
    
    @Binding var isPresented: Bool

    var body: some View {
        VStack(alignment: .leading) {
            NavigationBar(isPresented: $isPresented, isArrowHidden: false, isTextHidden: false, title: "Language")
                .background(Color("AppWhite"))
            
            RectSoundShape()
                .padding(.bottom, 30)
            
            VStack{
                //MARK: - English
                Button(action: {
                    setLanguageUserDefault(lang: "English")
                }){
                    HStack{
                        Image(getLanguageUserDefault() == "English" ? "Check" : "")
                            .resizable()
                            .frame(width: 15, height: 15)
                            .padding(.trailing, 20)
                        
                        Text("English")
                            .font(.system(size: 22, weight: getLanguageUserDefault() == "English" ? .semibold : .regular))
                            .foregroundColor(Color("AppBlack"))
                    }
                }
                .padding(.bottom, 20)
                
                //MARK: - العربية
                Button(action: {
                    setLanguageUserDefault(lang: "العربية")
                }){
                    HStack{
                        Image(getLanguageUserDefault() == "العربية" ? "Check" : "")
                            .resizable()
                            .frame(width: 15, height: 15)
                            .padding(.trailing, 20)
                        
                        Text("العربية")
                            .font(.system(size: 22, weight: getLanguageUserDefault() == "العربية" ? .semibold : .regular))
                            .foregroundColor(Color("AppBlack"))
                    }
                }
            }
            .background(Color("AppGray"))
            .padding(.leading, 15)
            
            Spacer()
        }
        .background(Color("AppGray"))
    }
}

struct Language_Previews: PreviewProvider {
    static var previews: some View {
        Language(isPresented: .constant(false))
    }
}
