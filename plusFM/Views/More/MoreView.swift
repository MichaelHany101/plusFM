//
//  MoreView.swift
//  plusFM
//
//  Created by Michael Hany on 06/12/2023.
//

import SwiftUI

struct MoreView: View {
    
    @State private var isLanguagePresented = false
    @State private var isAboutUsPresented = false
    @State var customAlert = false
    @Binding var index : Int
    
    var body: some View {
        ZStack{
            VStack{
                RectSoundShape(audioRecorder: AudioRecorder(), customAlert: $customAlert)
                    .padding(.top, 120)
                
                VStack(alignment: .leading){
                    
                    Button(action: {
                        isLanguagePresented.toggle()
                    }){
                        HStack{
                            Text("Language_Button")
                                .font(.system(size: 22, weight: .semibold))
                                .foregroundColor(Color("AppBlack"))
                            
                            Spacer()
                            
                            Image("Next")//getLanguageUserDefault() != "English" ? "Back" : "Back_Arabic")
                                .scaledToFit()
                        }
                        .padding(.vertical, 15)
                        .padding(.horizontal, 30)
                    }
                    .fullScreenCover(isPresented: $isLanguagePresented){
                        Language(index: $index, isPresented: $isLanguagePresented)
                    }
                    
                    Button(action: {
                        isAboutUsPresented.toggle()
                    }){
                        Text("AboutUs_Button")
                            .font(.system(size: 22, weight: .semibold))
                            .foregroundColor(Color("AppBlack"))
                            .padding(.vertical, 15)
                            .padding(.leading, 30)
                    }
                    .fullScreenCover(isPresented: $isAboutUsPresented){
                        AboutUs(isPresented: $isAboutUsPresented)
                    }
                    
                    Text("TuneIn_Button \("89.2 fm")")
                        .font(.system(size: 18, weight: .semibold))
                        .foregroundColor(Color("AppBlack"))
                        .padding(.vertical, 15)
                        .padding(.leading, 30)
                    
                    SocialMedia()
                        .padding(.vertical, 15)
                        .padding(.horizontal, 30)
                    
                    Spacer()
                }
                .background(Color("AppGray"))
                .padding(.bottom, 10)
            }
            .background(Color("AppWhite"))
            
            if customAlert {
                SaveAudioCustomAlert(show: $customAlert, audioRecorder: AudioRecorder())
            }
        }
    }
}

struct MoreView_Previews: PreviewProvider {
    static var previews: some View {
        MoreView(index: .constant(2))
    }
}
