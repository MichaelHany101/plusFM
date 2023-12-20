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
    
    var body: some View {
        
        VStack{
            RectSoundShape(audioRecorder: AudioRecorder())
                .padding(.top, 120)
            
            VStack(alignment: .leading){
                
                Button(action: {
                    isLanguagePresented.toggle()
                }){
                    HStack{
                        Text("Language")
                            .font(.system(size: 22, weight: .semibold))
                            .foregroundColor(Color("AppBlack"))
                        
                        Spacer()
                        
                        Image("Next")
                            .scaledToFit()
                    }
                    .padding(.vertical, 15)
                    .padding(.horizontal, 30)
                }
                .fullScreenCover(isPresented: $isLanguagePresented){
                    Language(isPresented: $isLanguagePresented)
                }
                
                Button(action: {
                    isAboutUsPresented.toggle()
                }){
                    Text("About us")
                        .font(.system(size: 22, weight: .semibold))
                        .foregroundColor(Color("AppBlack"))
                        .padding(.vertical, 15)
                        .padding(.leading, 30)
                }
                .fullScreenCover(isPresented: $isAboutUsPresented){
                    AboutUs(isPresented: $isAboutUsPresented)
                }
                
                Text("Tune in: 89.2 fm")
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
    }
}

struct MoreView_Previews: PreviewProvider {
    static var previews: some View {
        MoreView()
    }
}
