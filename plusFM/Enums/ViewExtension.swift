//
//  ViewExtension.swiftUI
//  plusFM
//
//  Created by Michael Hany on 06/12/2023.
//

import SwiftUI

extension View {
    //MARK: - Language
    func setLanguageUserDefault(lang : String) {
        UserDefaults.standard.set(lang, forKey: "Language")
    }
    
    func getLanguageUserDefault() -> String {
        let lang = UserDefaults.standard.string(forKey: "Language")
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
    
    //MARK: - Mute
    func setMuteSoundUserDefault(mute : Bool) {
        UserDefaults.standard.set(mute, forKey: "Muted")
    }
    
    func getMuteSoundUserDefault() -> Bool {
        let muted = UserDefaults.standard.bool(forKey: "Muted")
        return muted
    }
    
    //MARK: - Record Process
    func setRecordProcessUserDefault(state : Bool) {
        UserDefaults.standard.set(state, forKey: "State")
    }
    
    func getRecordProcessUserDefault() -> Bool {
        let state = UserDefaults.standard.bool(forKey: "State")
        return state
    }
}
