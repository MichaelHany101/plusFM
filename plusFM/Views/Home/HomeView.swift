//
//  HomeView.swift
//  plusFM
//
//  Created by Michael Hany on 06/12/2023.
//

import SwiftUI

struct HomeView: View {
    
    @State private var isThemesPresented = false
    @State private var isLibraryPresented = false
    @State var background : String
    
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
                    //.padding(.bottom, 35)
                
                SquareShapeSound(isLibraryPresented: $isLibraryPresented)
                    //.padding(.bottom, 90)
                
                //MARK: - Libraries & Themes
                HStack{
                    Button {
                        isLibraryPresented.toggle()
                    } label: {
                        HomeGridItem(icon: "Libraries", name: "Libraries")
                    }
                    .fullScreenCover(isPresented: $isLibraryPresented){
                        LibraryScreen(isPresented: $isLibraryPresented)
                    }
                    
                    Button(action: {
                        isThemesPresented.toggle()
                    }){
                        HomeGridItem(icon: "Themes", name: "Themes")
                    }
                    .fullScreenCover(isPresented: $isThemesPresented){
                        ThemesScreen(isPresented: $isThemesPresented, background: $background)
                    }
                }
                .padding(.horizontal, 30)
                
                Spacer()
            }
        }
        .onAppear{
            background = getBackgroundUserDefault()
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView(background: "PlusFM")
    }
}
