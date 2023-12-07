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
            //MARK: - Home
            Button(action: {
                index = 0
            }){
                VStack{
                    Image(index == 0 ? "Home-Selected" : "Home")
                    
                    Text("Home")
                        .foregroundColor(Color(index == 0 ? "AppOrange" : "AppBlack"))
                        .font(.system(size: index == 0 ? 18 : 14, weight: index == 0 ? .semibold : .regular))
                }
                .frame(width: 50, height: 75, alignment: .bottom)
            }
            
            Spacer()
            
            //MARK: - Stream
            GeometryReader{ graph in
                Button(action: {
                    index = 1
                }){
                    ZStack{
                        Image("STREAM-Boarder")
                            .frame(width: 100, height: 100)
                            .background(Color.white)
                            .clipShape(Circle())
                            .offset(x: 50, y: -90)
                            .padding(.bottom, -90)
                        
                        Image(index == 1 ? "STREAM-Selected" : "STREAM")
                            .offset(x: 50, y: -75)
                            .padding(.bottom, -90)
                    }
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
                    Image(index == 2 ? "More-Selected" : "More")
                        .padding()
                    
                    Text("More")
                        .foregroundColor(Color(index == 2 ? "AppOrange" : "AppBlack"))
                        .font(.system(size: index == 0 ? 18 : 14, weight: index == 0 ? .semibold : .regular))
                }
                .frame(width: 50, height: 75, alignment: .bottom)
            }
        }
        .padding(.vertical)
        .padding(.horizontal, 50)
        .background(Color("AppWhite").clipShape(CustomShape(curvePosition: $curvePosition)))
        .frame(height: 100, alignment: .bottom)
    }
}

struct TabBar_Previews: PreviewProvider {
    static var previews: some View {
        TabBar(index: .constant(1))
    }
}
