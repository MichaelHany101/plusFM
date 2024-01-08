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
    @Binding var index : Int

    var body: some View {
        ZStack{
            GeometryReader { graph in
                Image(background)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .edgesIgnoringSafeArea(.all)
                    .opacity(0.3)
                    .frame(maxWidth: graph.size.width * 1.25, maxHeight: graph.size.height)
                
                VStack{
                    NavigationBar(isPresented: .constant(false), isArrowHidden: true, isTextHidden: true, title: "")
                        .frame(width: graph.size.width)
                    
                    SquareShapeSound(audioRecorder: AudioRecorder(), isLibraryPresented: $isLibraryPresented, customAlert: $customAlert)
                        .frame(width: graph.size.width)
                    
                    EqualizerScreen()
                        .frame(width: graph.size.width)
                    
                    Spacer()
                    
                    TabBar(index: $index)
                }
                
                if customAlert {
                    SaveAudioCustomAlert(show: $customAlert, audioRecorder: AudioRecorder())
                }
            }
        }
        .onAppear{
            background = getBackgroundUserDefault()
        }
    }
}

struct StreamView_Previews: PreviewProvider {
    static var previews: some View {
        StreamView(background: .constant("PlusFM"), index: .constant(1))
    }
}
