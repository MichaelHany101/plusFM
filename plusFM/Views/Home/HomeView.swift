//
//  HomeView.swift
//  plusFM
//
//  Created by Michael Hany on 06/12/2023.
//

import SwiftUI

struct HomeView: View {
    
    @State var customAlert = false
    @State private var isThemesPresented = false
    @State private var isLibraryPresented = false
    @State var background : String
    @Binding var index : Int
    
    var body: some View {
        ZStack{
            GeometryReader { graph in
                if (background == "Custom") {
                    //                Image(uiImage: UIImage(data: getCustomBackgroundUserDefault())!)
                    //                    .resizable()
                    //                    .edgesIgnoringSafeArea(.all)
                    //                    .opacity(0.9)
                    //                    .frame(width: .infinity, height: .infinity, alignment: .center)
                    //                    .mask(LinearGradient(gradient: Gradient(colors: [.clear, .white]), startPoint: .bottom, endPoint: .top))
                }
                else {
                    Image(background)
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .edgesIgnoringSafeArea(.all)
                        .opacity(0.3)
                        .frame(maxWidth: graph.size.width * 1.25, maxHeight: graph.size.height)
                }
                
                VStack{
                    NavigationBar(isPresented: .constant(false), isArrowHidden: true, isTextHidden: true, title: "")
                        .frame(width: graph.size.width)
                    
                    SquareShapeSound(audioRecorder: AudioRecorder(), isLibraryPresented: $isLibraryPresented, customAlert: $customAlert)
                        .frame(width: graph.size.width)
                    
                    //MARK: - Libraries & Themes
                    HStack{
                        Button {
                            isLibraryPresented.toggle()
                        } label: {
                            HomeGridItem(icon: "Libraries", name: "Libraries")
                        }
                        .fullScreenCover(isPresented: $isLibraryPresented){
                            LibraryScreen(audioRecorder: AudioRecorder(), isPresented: $isLibraryPresented)
                        }
                        
                        Button(action: {
                            isThemesPresented.toggle()
                        }){
                            HomeGridItem(icon: "Themes", name: "Themes")
                        }
                        .fullScreenCover(isPresented: $isThemesPresented){
                            ThemesScreen(isPresented: $isThemesPresented, background: $background, index: $index)
                        }
                    }
                    .padding(.horizontal, 30)
                    
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

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView(background: "PlusFM", index: .constant(0))
    }
}
