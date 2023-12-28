//
//  StreamView.swift
//  plusFM
//
//  Created by Michael Hany on 06/12/2023.
//

import SwiftUI

struct StreamView: View {
    
    @State var customAlert = false
    @Binding var background : String
    @State private var isLibraryPresented = false

    var body: some View {
        ZStack{
            Image(background)
                .resizable()
                .edgesIgnoringSafeArea(.all)
                .opacity(0.9)
                .frame(width: .infinity, height: .infinity, alignment: .center)
                .mask(LinearGradient(gradient: Gradient(colors: [.clear, .white]), startPoint: .bottom, endPoint: .top))
            
            VStack{
                NavigationBar(isPresented: .constant(false), isArrowHidden: true, isTextHidden: true, title: "")
                
                SquareShapeSound(audioRecorder: AudioRecorder(), isLibraryPresented: $isLibraryPresented, customAlert: $customAlert)
                
                EqualizerScreen()
                    //.padding(.bottom, 200)
                
                //Spacer()
            }
            
            if customAlert {
                SaveAudioCustomAlert(show: $customAlert, audioRecorder: AudioRecorder())
            }
        }
        .onAppear{
            background = getBackgroundUserDefault()
        }
    }
}

struct StreamView_Previews: PreviewProvider {
    static var previews: some View {
        StreamView(background: .constant("PlusFM"))
    }
}
