//
//  RectSoundShape.swift
//  plusFM
//
//  Created by Michael Hany on 07/12/2023.
//

import SwiftUI

struct RectSoundShape: View {
    
    @State private var soundMuted : Bool = true
    @State private var recordProcess : Bool = true
    @StateObject private var audioPlayerManager = AudioPlayerManager()
    
    var body: some View {
        ZStack{
            //MARK: - Signal Image
            Image(audioPlayerManager.isPlaying ? "StreamOn" : "StreamOff")
                .resizable()
                .scaledToFit()
                .padding(.leading, 55)
                .padding(.trailing, 60)
                .padding(.vertical, 30)
            
            HStack{
                //MARK: - Sound Button
                Button(action: {
                    setMuteSoundUserDefault(mute: getMuteSoundUserDefault() ? false : true)
                    
                    soundMuted = getMuteSoundUserDefault()
                }){
                    Image(soundMuted ? "SoundOff" : "SoundOn")
                }
                .padding(.leading, -35)
                .padding(.top)
                
                Spacer()
                
                //MARK: - Record Button
                Button(action: {
                    setRecordProcessUserDefault(state: getRecordProcessUserDefault() ? false : true)
                    
                    recordProcess = getRecordProcessUserDefault()
                }){
                    Image(recordProcess ? "RecordOff" : "RecordOn")
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
            soundMuted = getMuteSoundUserDefault()
            recordProcess = getRecordProcessUserDefault()
        }
    }
}

struct RectSoundShape_Previews: PreviewProvider {
    static var previews: some View {
        RectSoundShape()
    }
}
