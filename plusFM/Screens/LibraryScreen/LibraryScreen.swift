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

    var body: some View {
        ZStack{
            VStack{
                NavigationBar(isPresented: $isPresented, isArrowHidden: false, isTextHidden: false, title: "Library")
                
                RectSoundShape(audioRecorder: AudioRecorder(), customAlert: $customAlert)
                
                if(getIsThereRecordUserDefault()){
                    ScrollView{
                        VStack{
                            ForEach(audioRecorder.recordings, id: \.createdAt) { recording in
                                LibraryCell(recordURL: recording.fileURL, audioRecorder: audioRecorder, customPopUp: $customPopUp, name: "Name", date: "Date", time: "Time")
                            }
                        }
                    }
                }
                else{
                    Spacer()
                    
                    Group{
                        Text("Your library is empty.")
                        Text("Record your favourite tracks!")
                    }
                    .font(.system(size: 18, weight: .semibold))
                }
                
                Spacer()
                
                TabBar(index: .constant(0))
            }
            .onAppear{
                if (audioRecorder.recordings == []) {
                    setIsThereRecordUserDefault(exist: false)
                }
                else {
                    setIsThereRecordUserDefault(exist: true)
                }
            }
          
            if customAlert {
                CustomAlert(show: $customAlert, audioRecorder: AudioRecorder())
            }
            
            if customPopUp {
                EditDeleteMenu(show: $customPopUp)
            }
        }
    }
    
    func delete(at offsets: IndexSet) {
        var urlsToDelete = [URL]()
        for index in offsets {
            urlsToDelete.append(audioRecorder.recordings[index].fileURL)
        }
        audioRecorder.deleteRecording(urlsToDelete: urlsToDelete)
    }
}

struct LibraryScreen_Previews: PreviewProvider {
    static var previews: some View {
        LibraryScreen(audioRecorder: AudioRecorder(), isPresented: .constant(false))
    }
}
