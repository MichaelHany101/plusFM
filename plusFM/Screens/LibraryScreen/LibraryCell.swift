//
//  LibraryCell.swift
//  plusFM
//
//  Created by Michael Hany on 20/12/2023.
//

import SwiftUI

struct LibraryCell: View {
    
    var recordURL: URL
    @ObservedObject var recordPlayer = RecordPlayer()
    @ObservedObject var audioRecorder: AudioRecorder
    @Binding var customPopUp: Bool
    @State var name = "Name"
    @State var date = "Date"
    @State var time = "Time"
    
    var body: some View {
        HStack{
            //MARK: - Play Button
            Button(action: {
                if recordPlayer.isPlaying == false {
                    self.recordPlayer.startPlayback(audio: self.recordURL)
                }
                else {
                    self.recordPlayer.stopPlayback()
                }
            }){
                ZStack{
                    Circle()
                        .fill(Color("AppOrange"))
                        .frame(width: 70, height: 70)
                    
                    Image(systemName: recordPlayer .isPlaying ? "pause.fill" : "play.fill")
                        .resizable()
                        .frame(width: 35, height: 35)
                        .foregroundColor(.white)
                }
            }
            .padding(.trailing, 15)
            .padding(.leading, 15)
            
            //MARK: - Name and Date
            VStack(alignment: .leading){
                Text(name)
                    .font(.system(size: 16, weight: .semibold))
                
                Text(date)
                    .font(.system(size: 16, weight: .regular))
            }
            
            Spacer()
            
            //MARK: - Button and Time
            
            VStack{
                Button(action: {
                    customPopUp.toggle()
                }){
                    Image("More-Selected")
                        .resizable()
                        .frame(width: 30, height: 10)
                }
                
                Text(time)
                    .font(.system(size: 16, weight: .regular))
            }
            .padding(.trailing, 30)
        }
        .onAppear{
            print("Michael \(recordURL)")
            let audioName = (recordURL.lastPathComponent).components(separatedBy: String(" at "))
            date = audioName[0]
            time = audioName[1]
            name = audioName[2]
        }
    }
}

struct LibraryCell_Previews: PreviewProvider {
    static var previews: some View {
        LibraryCell(recordURL: URL(fileURLWithPath: ""), audioRecorder: AudioRecorder(), customPopUp: .constant(false))
    }
}
