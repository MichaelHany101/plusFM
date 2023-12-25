//
//  AboutUs.swift
//  plusFM
//
//  Created by Michael Hany on 07/12/2023.
//

import SwiftUI

struct AboutUs: View {
    
    @Binding var isPresented: Bool
    @State var customAlert = false
    
    var body: some View {
        ZStack{
            VStack(alignment: .leading) {
                NavigationBar(isPresented: $isPresented, isArrowHidden: false, isTextHidden: false, title: "About us")
                    .background(Color("AppWhite"))
                
                RectSoundShape(audioRecorder: AudioRecorder(), customAlert: $customAlert)
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
            
            if customAlert {
                SaveAudioCustomAlert(show: $customAlert, audioRecorder: AudioRecorder())
            }
        }
    }
}

struct AboutUs_Previews: PreviewProvider {
    static var previews: some View {
        AboutUs(isPresented: .constant(false))
    }
}
