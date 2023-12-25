//
//  LibraryScreen.swift
//  plusFM
//
//  Created by Michael Hany on 09/12/2023.
//

import SwiftUI

struct LibraryScreen: View {
    
    @ObservedObject var audioRecorder: AudioRecorder
    @Binding var isPresented: Bool
    @State var customAlert = false
    @State var customPopUp = false
    @State private var isThereRecords = false
    @State private var toggleEditDeleteScreen = false
    @State private var choiceEditDeleteScreen = 0
    @State private var arrayOfURL: [String] = []
    @State private var selectedURL = ""
    
    var body: some View {
        ZStack{
            VStack{
                NavigationBar(isPresented: $isPresented, isArrowHidden: false, isTextHidden: false, title: "Library")
                
                Group{
                    RectSoundShape(audioRecorder: AudioRecorder(), customAlert: $customAlert)
                        .padding(.bottom, 15)
                    
                    if(isThereRecords){
                        ScrollView{
                            ForEach(audioRecorder.recordings, id: \.createdAt) { recording in
                                if (recording.fileURL.lastPathComponent != ".DS_Store") {
                                    LibraryCell(recordURL: recording.fileURL, audioRecorder: audioRecorder, customPopUp: $customPopUp)
                                        .padding(.vertical, 5)
                                        .onTapGesture{
                                            selectedURL = "\(recording.fileURL)"
                                            print("Michael \(selectedURL)")
                                        }
                                }
                            }
                        }
                        .background(Color("AppGray"))
                    }
                    else{
                        Spacer()
                        
                        Group{
                            Text("Your library is empty.")
                            Text("Record your favourite tracks!")
                        }
                        .font(.system(size: 18, weight: .semibold))
                    }
                }
                
                Spacer()
                
                TabBar(index: .constant(0))
            }
            .onAppear{
                if (audioRecorder.recordings.count == 0 || (audioRecorder.recordings.count == 1 && audioRecorder.recordings[0].fileURL.lastPathComponent == ".DS_Store")) {
                    setIsThereRecordUserDefault(exist: false)
                }
                else {
                    setIsThereRecordUserDefault(exist: true)
                }
                
                isThereRecords = getIsThereRecordUserDefault()
            }
            
            if customAlert {
                SaveAudioCustomAlert(show: $customAlert, audioRecorder: AudioRecorder())
            }
            
            if toggleEditDeleteScreen {
                EditDeleteCustomAlert(audioRecorder: AudioRecorder(), toggleEditDeleteScreen: $toggleEditDeleteScreen, choiceEditDeleteScreen: $choiceEditDeleteScreen, selectedURL: $selectedURL)
            }
            
            if customPopUp {
                EditDeleteMenu(show: $customPopUp, toggleEditDeleteScreen: $toggleEditDeleteScreen, choiceEditDeleteScreen: $choiceEditDeleteScreen, audioRecorder: AudioRecorder())
                    .background(
                        Color.clear
                            .edgesIgnoringSafeArea(.all)
                            .onTapGesture {
                                self.customPopUp = false
                            })
            }
        }
    }
}

struct LibraryScreen_Previews: PreviewProvider {
    static var previews: some View {
        LibraryScreen(audioRecorder: AudioRecorder(), isPresented: .constant(false))
    }
}
