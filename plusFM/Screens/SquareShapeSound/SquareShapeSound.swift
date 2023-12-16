//
//  SquareShapeSound.swift
//  plusFM
//
//  Created by Michael Hany on 07/12/2023.
//

import SwiftUI

struct SquareShapeSound: View {
    
    @Binding var isLibraryPresented : Bool
    @State private var recordProcess : Bool = false
    @State private var value: Float = 0.6
    @State private var realValue : Float = 0.5
    @StateObject private var audioPlayerManager = AudioPlayerManager()
    
    var body: some View {
        VStack{
            ZStack{
                HStack{
                    Image("PlusFm-Wave")
                        .resizable()
                        .scaledToFill()
                        .frame(width: .infinity, height: 85)
                        .padding(.leading, -80)
                        .edgesIgnoringSafeArea(.horizontal)
                    
                    Image("PlusFm-Wave")
                        .resizable()
                        .scaledToFill()
                        .frame(width: .infinity, height: 85)
                        .padding(.trailing, -80)
                        .edgesIgnoringSafeArea(.horizontal)
                }
                
                //MARK: - Stream
                Button(action: {
                    setStreamStateUserDefault(play: getStreamStateUserDefault() ? false : true)
                    playOrPause()
                }){
                    ZStack{
                        Image("PlusFM-Boarder")
                            .frame(width: 205, height: 205)
                            .background(Color.white)
                            .clipShape(Circle())
                            .overlay(
                                Circle()
                                    .stroke(getStreamStateUserDefault() ? Color("AppOrange") : Color("AppPink"), lineWidth: 3)
                            )
                        
                        Image("Logo")
                            .resizable()
                            .frame(width: 170, height: 50)
                        
                        //MARK: - Progress Bar
                        Circle()
                            .trim(from: 0.0, to: CGFloat(realValue))
                            .stroke(style: StrokeStyle(lineWidth: 8, lineCap: .round, lineJoin: .round))
                            .foregroundColor(Color("AppOrange"))
                            .rotationEffect(.degrees(115))
                            .gesture(DragGesture().onChanged({ value in
                                let vector = CGVector(dx: value.location.x - 100, dy: value.location.y - 100)
                                let angle = atan2(vector.dy, vector.dx) + .pi
                                let fixedAngle = angle < 0 ? angle + 2 * .pi : angle
                                let progress = Double(fixedAngle / (2 * .pi))
                                self.realValue = (self.value / 0.9)
                                
                                if (self.realValue <= 0.05) {
                                    self.realValue = 0.05
                                }
                                else if (self.realValue >= 0.85) {
                                    self.realValue = 0.85
                                }
                                
                                self.value = Float(min(max(progress, 0.0), 0.9))
                                setVolumeValueUserDefault(volume: realValue)
                                audioPlayerManager.setVolume(getVolumeValueUserDefault())
                                
                            }))
                            .frame(width: 205, height: 205)
                    }
                }
            }
            
            HStack(spacing: -20){
                //MARK: - Record
                Button(action: {
                    setRecordProcessUserDefault(state: getRecordProcessUserDefault() ? false : true)
                    
                    recordProcess = getRecordProcessUserDefault()
                }){
                    Image(recordProcess ? "RecordOff" : "RecordOn")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 90, height: 90)
                        .clipShape(Circle())
                }
                
                //MARK: - Sound
                Button(action: {
                    setMuteSoundUserDefault(mute: getMuteSoundUserDefault() ? false : true)
                    if getMuteSoundUserDefault() {
                        audioPlayerManager.setVolume(0)
                    }else {
                        audioPlayerManager.setVolume(realValue)
                    }
                }){
                    Image(getMuteSoundUserDefault() ? "SoundOff" : "SoundOn")
                        .offset(x: 0, y: -25)
                }
                
                //MARK: - Library
                Button(action: {
                    isLibraryPresented.toggle()
                }){
                    Image("Library")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 90, height: 90)
                        .clipShape(Circle())
                }
                .fullScreenCover(isPresented: $isLibraryPresented){
                    LibraryScreen(isPresented: $isLibraryPresented)
                }
            }
            .padding(.top, -30)
        }
        .onAppear{
            playOrPause()
            realValue = getVolumeValueUserDefault()
            //realValue = 0.05
            recordProcess = getRecordProcessUserDefault()
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
}
struct SquareShapeSound_Previews: PreviewProvider {
    static var previews: some View {
        SquareShapeSound(isLibraryPresented: .constant(false))
    }
}
