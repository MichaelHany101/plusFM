//
//  ContentView.swift
//  plusFM
//
//  Created by Michael Hany on 06/12/2023.
//

import SwiftUI

struct ContentView: View {
    
    @State private var tabBarItem = 1
    @ObservedObject var audioRecorder: AudioRecorder
    
    var body: some View {
        ZStack{
            switch tabBarItem {
            case 0:
                HomeView(background: "\(getBackgroundUserDefault())", index: $tabBarItem)
            case 1:
                StreamView(background: .constant("\(getBackgroundUserDefault())"))
            case 2:
                MoreView()
            default:
                NoView()
            }
            VStack{
                
                NavigationBar(isPresented: .constant(false), isArrowHidden: true, isTextHidden: true, title: "")
                
                Spacer()
                
                TabBar(index: $tabBarItem)
            }
        }
        .onAppear{
            setBackgroungUserDefault(background: "\(getBackgroundUserDefault())")
            setLanguageUserDefault(lang: "English")
            setMuteSoundUserDefault(mute: false)
            setStreamStateUserDefault(play: true)
            setVolumeValueUserDefault(volume: 0.5)
            setIsRecordingUserDefault(state: false)
            if (audioRecorder.recordings == []) {
                setIsThereRecordUserDefault(exist: false)
            }
            else {
                setIsThereRecordUserDefault(exist: true)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(audioRecorder: AudioRecorder())
    }
}
