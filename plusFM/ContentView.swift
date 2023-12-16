//
//  ContentView.swift
//  plusFM
//
//  Created by Michael Hany on 06/12/2023.
//

import SwiftUI

struct ContentView: View {
    
    @State private var tabBarItem = 1
    
    var body: some View {
        ZStack{
            switch tabBarItem {
            case 0:
                HomeView(background: "\(getBackgroundUserDefault())")
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
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
