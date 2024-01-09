//
//  Language.swift
//  plusFM
//
//  Created by Michael Hany on 07/12/2023.
//

import SwiftUI

struct Language: View {
    
    @Binding var index : Int
    @Binding var isPresented: Bool
    @State var customAlert = false
    @State private var language : String = "English"
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        ZStack{
            VStack(alignment: .leading) {
                NavigationBar(isPresented: $isPresented, isArrowHidden: false, isTextHidden: false, title: "Language")
                    .background(Color("AppWhite"))
                
                RectSoundShape(audioRecorder: AudioRecorder(), customAlert: $customAlert)
                    .padding(.bottom, 30)
                
                VStack{
                    //MARK: - English
                    Button(action: {
                        setLanguageUserDefault(lang: "English")
                        language = getLanguageUserDefault()
                        UserDefaults.standard.set("en", forKey: "language")
                        LanguageService.lang = true
                        index = 1
                        presentationMode.wrappedValue.dismiss()
                    }){
                        HStack{
                            Image(language == "English" ? "Check" : "")
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
                        language = getLanguageUserDefault()
                        UserDefaults.standard.set("ar", forKey: "language")
                        LanguageService.lang = false
                        index = 1
                        presentationMode.wrappedValue.dismiss()
                    }){
                        HStack{
                            Image(language == "العربية" ? "Check" : "")
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
                
                TabBar(index: .constant(2))
            }
            .background(Color("AppGray"))
            .onAppear{
                language = getLanguageUserDefault()
            }
            
            if customAlert {
                SaveAudioCustomAlert(show: $customAlert, audioRecorder: AudioRecorder())
            }
        }
    }
}

struct Language_Previews: PreviewProvider {
    static var previews: some View {
        Language(index: .constant(2), isPresented: .constant(false))
    }
}
