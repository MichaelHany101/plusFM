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
                HomeView()
            case 1:
                StreamView()
            case 2:
                MoreView()
            default:
                NoView()
            }
            VStack{
                Spacer()
                
                TabBar(index: $tabBarItem)
            }
        }
        .onAppear{
            setBackgroungUserDefault(background: "PlusFM")

        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
