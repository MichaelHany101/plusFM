//
//  plusFMApp.swift
//  plusFM
//
//  Created by Michael Hany on 06/12/2023.
//

import SwiftUI

@main
struct plusFMApp: App {

    @AppStorage("language") private var currentLanguage = "en"
    
    var body: some Scene {
        WindowGroup {
            ContentView(audioRecorder: AudioRecorder())
                .environment(\.locale, .init(identifier: currentLanguage))
                .environment(\.layoutDirection, LanguageService.lang ? .leftToRight : .rightToLeft)
        }
    }
}
