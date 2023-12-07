//
//  RectSoundShape.swift
//  plusFM
//
//  Created by Michael Hany on 07/12/2023.
//

import SwiftUI

struct RectSoundShape: View {
    
    var body: some View {
        ZStack{
            //MARK: - Signal Image
            Image(getPausedSoundUserDefault() ? "StreamOff" : "StreamOn")
                .resizable()
                .padding(.leading, 55)
                .padding(.trailing, 60)
                .padding(.vertical)
            
            HStack{
                //MARK: - Sound Button
                Button(action: {
                    setMuteSoundUserDefault(mute: getMuteSoundUserDefault() ? false : true)
                }){
                    Image(getMuteSoundUserDefault() ? "SoundOff" : "SoundOn")
                }
                .padding(.leading, -35)
                .padding(.top)
                
                Spacer()
                
                //MARK: - Record Button
                Button(action: {
                    setRecordProcessUserDefault(state: getRecordProcessUserDefault() ? false : true)
                }){
                    Image(getRecordProcessUserDefault() ? "RecordOff" : "RecordOn")
                }
                .padding(.trailing, -10)
                .padding(.top)
            }
        }
        .frame(width: .infinity, height: 80)
        .padding()
        .background(Color("AppWhite"))
        .cornerRadius(25)
        .overlay(
            RoundedRectangle(cornerRadius: 25)
                .stroke(style: StrokeStyle(lineWidth: 2))
                .foregroundColor(Color("AppPink").opacity(2))
                .blur(radius: 2)
        )
    }
}

struct RectSoundShape_Previews: PreviewProvider {
    static var previews: some View {
        RectSoundShape()
    }
}
