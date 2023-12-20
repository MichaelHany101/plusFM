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
    
    var body: some View {
        VStack{
            NavigationBar(isPresented: $isPresented, isArrowHidden: false, isTextHidden: false, title: "Library")
            
            RectSoundShape(audioRecorder: AudioRecorder())
            
            if(getIsThereRecordUserDefault()){
                ScrollView{
                    VStack{
                        ForEach(audioRecorder.recordings, id: \.createdAt) { recording in
                            LibraryCell(recordURL: recording.fileURL, audioRecorder: audioRecorder, name: "Name", date: "Date", time: "Time")
                        }
                    }
                }
            }
            else{
                Group{
                    Text("Your library is empty.")
                    Text("Record your favourite tracks!")
                }
                .font(.system(size: 18, weight: .semibold))
            }
            
            Spacer()
            
            TabBar(index: .constant(0))
        }
    }
}

struct LibraryScreen_Previews: PreviewProvider {
    static var previews: some View {
        LibraryScreen(audioRecorder: AudioRecorder(), isPresented: .constant(false))
    }
}
