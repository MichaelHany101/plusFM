//
//  ThemesScreen.swift
//  plusFM
//
//  Created by Michael Hany on 07/12/2023.
//

import SwiftUI

struct ThemesScreen: View {

    @State private var isImagePickerPresented = false
    @State private var selectedImage: UIImage? = nil
    @State var customAlert = false
    @Binding var isPresented : Bool
    @Binding var background : String
    @Binding var index : Int
    var imagePickerCoordinator : ImagePickerCoordinator?
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        ZStack{
            VStack{
                NavigationBar(isPresented: $isPresented, isArrowHidden: false, isTextHidden: false, title: "Themes")
                
                RectSoundShape(audioRecorder: AudioRecorder(), customAlert: $customAlert)
                
                Group{
                    HStack{
                        //MARK: - Default
                        Themes(icon: getBackgroundUserDefault() == "PlusFM" ? "PlusFM-White" : "PlusFM-Black", name: "Default", textColor: getBackgroundUserDefault() == "PlusFM" ? Color("AppWhite") : Color("AppBlack"), boxColor: getBackgroundUserDefault() == "PlusFM" ? Color("AppOrange") : Color("AppWhite"), action: {setBackgroungUserDefault(background: "PlusFM")
                            background = getBackgroundUserDefault()
                            index = 1
                            presentationMode.wrappedValue.dismiss()
                        })
                        
                        //MARK: - CityOne
                        Themes(icon: getBackgroundUserDefault() == "CityOne" ? "CityOne-White" : "CityOne-Black", name: "City 1", textColor: getBackgroundUserDefault() == "CityOne" ? Color("AppWhite") : Color("AppBlack"), boxColor: getBackgroundUserDefault() == "CityOne" ? Color("AppOrange") : Color("AppWhite"), action: {setBackgroungUserDefault(background: "CityOne")
                            background = getBackgroundUserDefault()
                            index = 1
                            presentationMode.wrappedValue.dismiss()
                        })
                        
                        //MARK: - CityTwo
                        Themes(icon: getBackgroundUserDefault() == "CityTwo" ? "CityTwo-White" : "CityTwo-Black", name: "City 2", textColor: getBackgroundUserDefault() == "CityTwo" ? Color("AppWhite") : Color("AppBlack"), boxColor: getBackgroundUserDefault() == "CityTwo" ? Color("AppOrange") : Color("AppWhite"), action: {setBackgroungUserDefault(background: "CityTwo")
                            background = getBackgroundUserDefault()
                            index = 1
                            presentationMode.wrappedValue.dismiss()
                        })
                    }
                    .padding(.top, 30)
                }
                .padding(.horizontal, 15)
                
                Group{
                    HStack{
                        //MARK: - Winter
                        Themes(icon: getBackgroundUserDefault() == "Winter" ? "Winter-White" : "Winter-Black", name: "Winter", textColor: getBackgroundUserDefault() == "Winter" ? Color("AppWhite") : Color("AppBlack"), boxColor: getBackgroundUserDefault() == "Winter" ? Color("AppOrange") : Color("AppWhite"), action: {setBackgroungUserDefault(background: "Winter")
                            background = getBackgroundUserDefault()
                            index = 1
                            presentationMode.wrappedValue.dismiss()
                        })
                        
                        //MARK: - Work
                        Themes(icon: getBackgroundUserDefault() == "Work" ? "Work-White" : "Work-Black", name: "Work", textColor: getBackgroundUserDefault() == "Work" ? Color("AppWhite") : Color("AppBlack"), boxColor: getBackgroundUserDefault() == "Work" ? Color("AppOrange") : Color("AppWhite"), action: {setBackgroungUserDefault(background: "Work")
                            background = getBackgroundUserDefault()
                            index = 1
                            presentationMode.wrappedValue.dismiss()
                        })
                        
                        //MARK: - Sports
                        Themes(icon: getBackgroundUserDefault() == "Sports" ? "Sports-White" : "Sports-Black", name: "Sports", textColor: getBackgroundUserDefault() == "Sports" ? Color("AppWhite") : Color("AppBlack"), boxColor: getBackgroundUserDefault() == "Sports" ? Color("AppOrange") : Color("AppWhite"), action: {setBackgroungUserDefault(background: "Sports")
                            background = getBackgroundUserDefault()
                            index = 1
                            presentationMode.wrappedValue.dismiss()
                        })
                    }
                    .padding(.top, 30)
                }
                .padding(.horizontal, 15)
                .padding(.bottom, 15)
                
                //MARK: - Add Custom Theme
                Button(action: {
                    isImagePickerPresented.toggle()
                }){
                    ZStack{
                        RoundedRectangle(cornerRadius: 25)
                            .frame(width: 360, height: 50)
                            .foregroundColor(Color("AppOrange"))
                        
                        Text("Add custom theme")
                            .foregroundColor(Color("AppWhite"))
                            .font(.system(size: 18, weight: .semibold))
                    }
                }
                .sheet(isPresented: $isImagePickerPresented, onDismiss: {
                    if let selectedImage = selectedImage {
                        
                        background = getBackgroundUserDefault()
                        index = 1
                        presentationMode.wrappedValue.dismiss()
                    }
                }) {
                    let imagePicker = ImagePicker(image: $selectedImage)
                }
                
                Spacer()
                
                TabBar(index: .constant(0))
            }
            .onAppear{
                background = getBackgroundUserDefault()
            }
            
            if customAlert {
                CustomAlert(show: $customAlert, audioRecorder: AudioRecorder())
            }
        }
    }
}

struct ThemesScreen_Previews: PreviewProvider {
    static var previews: some View {
        ThemesScreen(isPresented: .constant(false), background: .constant("PlusFM"), index: .constant(0))
    }
}
