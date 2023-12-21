//
//  RectSoundShape.swift
//  plusFM
//
//  Created by Michael Hany on 07/12/2023.
//

import SwiftUI

struct RectSoundShape: View {
    
    @StateObject private var audioPlayerManager = AudioPlayerManager()
    @ObservedObject var audioRecorder: AudioRecorder
    @Binding var customAlert : Bool
    
    var body: some View {
        ZStack{
            //MARK: - Signal Image
            Image(getStreamStateUserDefault() ? "StreamOn" : "StreamOff")
                .resizable()
                .scaledToFit()
                .padding(.leading, 55)
                .padding(.trailing, 60)
                .padding(.vertical, 30)
            
            HStack{
                //MARK: - Sound Button
                Button(action: {
                    setMuteSoundUserDefault(mute: getMuteSoundUserDefault() ? false : true)
                    checkMuted()
                }){
                    Image(getMuteSoundUserDefault() ? "SoundOff" : "SoundOn")
                }
                .padding(.leading, -35)
                .padding(.top)
                
                Spacer()
                
                //MARK: - Record Button
                Button(action: {
                    setIsRecordingUserDefault(state: getIsRecordingUserDefault() ? false : true)
                    recordOrStop()
                }){
                    Image(getIsRecordingUserDefault() ? "RecordOff" : "RecordOn")
                }
                .padding(.trailing, -10)
                .padding(.top)
            }
        }
        .frame(width: .infinity, height: 65)
        .padding()
        .background(Color("AppWhite"))
        .cornerRadius(25)
        .overlay(
            RoundedRectangle(cornerRadius: 25)
                .stroke(style: StrokeStyle(lineWidth: 2))
                .foregroundColor(Color("AppPink").opacity(2))
                .blur(radius: 2)
        )
        .onAppear{
            playOrPause()
            checkMuted()
        }
    }
    
    //MARK: - Functions
    func checkMuted() {
        if getMuteSoundUserDefault(){
            audioPlayerManager.setVolume(0)
        }else {
            audioPlayerManager.setVolume(getVolumeValueUserDefault())
        }
    }
    
    func playOrPause() {
        if (getStreamStateUserDefault()){
            audioPlayerManager.play()
        }
        else{
            audioPlayerManager.pause()
        }
    }
    
    func recordOrStop(){
        if (getIsRecordingUserDefault()){
            self.audioRecorder.startRecording()
        }
        else{
            self.audioRecorder.stopRecording()
            withAnimation{
                customAlert.toggle()
            }
        }
    }
}

struct RectSoundShape_Previews: PreviewProvider {
    static var previews: some View {
        RectSoundShape(audioRecorder: AudioRecorder(), customAlert: .constant(false))
    }
}
