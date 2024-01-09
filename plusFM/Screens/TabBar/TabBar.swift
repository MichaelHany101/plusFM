//
//  TabBar.swift
//  plusFM
//
//  Created by Michael Hany on 06/12/2023.
//

import SwiftUI

struct TabBar: View {

    @Binding var index : Int
    @State var curvePosition : CGFloat = 0
        
    var body: some View {
        HStack{
            Spacer()
            
            //MARK: - Home
            Button(action: {
                index = 0
            }){
                VStack{
                    if (getLanguageUserDefault() == "English") {
                        Image(index == 0 ? "Home-Selected" : "Home")
                    }
                    else {
                        Image(index == 0 ? "Home-Arabic-Selected" : "Home-Arabic")
                    }
                }
                .frame(width: 50, height: 80, alignment: .bottom)
            }
            
            Spacer()
            
            //MARK: - Stream
            GeometryReader{ graph in
                Button(action: {
                    index = 1
                }){
                    ZStack(alignment: .center){
                        Image("STREAM-Boarder")
                            .frame(width: 100, height: 100)
                            .background(Color("AppWhite"))
                            .clipShape(Circle())
                        
                        Image(index == 1 ? "STREAM-Selected" : "STREAM")
                    }
                    .padding(.leading, (graph.size.width / 2) - 50)//(graph.size.width * 0.255))
                    .offset(y: -100)
                }
                .onAppear{
                    DispatchQueue.main.async {
                        self.curvePosition = graph.frame(in: .global).midX
                    }
                }
            }
            
            Spacer()
            
            //MARK: - More
            Button(action: {
                index = 2
            }){
                VStack{
                    if (getLanguageUserDefault() == "English") {
                        Image(index == 2 ? "More-Selected" : "More")
                    }
                    else {
                        Image(index == 2 ? "More-Arabic-Selected" : "More-Arabic")
                    }
                }
                .frame(width: 50, height: 80, alignment: .bottom)
            }
            
            Spacer()
        }
        .padding(.vertical)
        .padding(.horizontal, 50)
        .background(Color("AppWhite").clipShape(CustomShape(curvePosition: $curvePosition)))
        .frame(height: 80, alignment: .bottom)
    }
}

struct TabBar_Previews: PreviewProvider {
    static var previews: some View {
        TabBar(index: .constant(1))
    }
}
