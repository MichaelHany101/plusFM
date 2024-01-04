//
//  Extension.swiftUI
//  plusFM
//
//  Created by Michael Hany on 06/12/2023.
//

import SwiftUI
import Foundation

//MARK: - View Extension
extension View {
    //MARK: - Language
    func setLanguageUserDefault(lang : String) {
        UserDefaults.standard.set(lang, forKey: "AppleLanguage")
    }
    
    func getLanguageUserDefault() -> String {
        let lang = UserDefaults.standard.string(forKey: "AppleLanguage")
        return lang ?? "English"
    }
    
    //MARK: - Background Image
    func setBackgroungUserDefault(background : String) {
        UserDefaults.standard.set(background, forKey: "Background")
    }
    
    func getBackgroundUserDefault() -> String {
        let backgroundImage = UserDefaults.standard.string(forKey: "Background")
        return backgroundImage ?? "PlusFM"
    }
    
    //MARK: - Custom Background Image
    func setCustomBackgroungUserDefault(data : Data) {
        UserDefaults.standard.set(data, forKey: "Data")
    }
    
    func getCustomBackgroundUserDefault() -> Data {
        let backgroundImage = UserDefaults.standard.data(forKey: "Data")
        return backgroundImage!
    }
    
    //MARK: - Mute
    func setMuteSoundUserDefault(mute : Bool) {
        UserDefaults.standard.set(mute, forKey: "Muted")
    }
    
    func getMuteSoundUserDefault() -> Bool {
        let muted = UserDefaults.standard.bool(forKey: "Muted")
        return muted
    }
    
    //MARK: - Volume Level
    func setVolumeValueUserDefault(volume : Float) {
        UserDefaults.standard.setValue(volume, forKey: "Volume")
    }
    
    func getVolumeValueUserDefault() -> Float {
        let volume = UserDefaults.standard.float(forKey: "Volume")
        return volume
    }
    
    //MARK: - Play Stream
    func setStreamStateUserDefault(play : Bool) {
        UserDefaults.standard.set(play, forKey: "Play")
    }
    
    func getStreamStateUserDefault() -> Bool {
        let play = UserDefaults.standard.bool(forKey: "Play")
        return play
    }
    
    //MARK: - Record Process
    func setIsRecordingUserDefault(state : Bool) {
        UserDefaults.standard.set(state, forKey: "State")
    }
    
    func getIsRecordingUserDefault() -> Bool {
        let state = UserDefaults.standard.bool(forKey: "State")
        return state
    }
    
    //MARK: - Is There Record
    func setIsThereRecordUserDefault(exist : Bool) {
        UserDefaults.standard.set(exist, forKey: "Exist")
    }
    
    func getIsThereRecordUserDefault() -> Bool {
        let exist = UserDefaults.standard.bool(forKey: "Exist")
        return exist
    }
}

//MARK: - Date Extension
extension Date
{
    func toString(dateFormat format: String ) -> String
    {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = format
        return dateFormatter.string(from: self)
    }
}
