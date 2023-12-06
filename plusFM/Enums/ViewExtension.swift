//
//  ViewExtension.swiftUI
//  plusFM
//
//  Created by Michael Hany on 06/12/2023.
//

import SwiftUI

extension View {
    func setBackgroungUserDefault(background : String) {
        UserDefaults.standard.set(background, forKey: "Background")
    }
    
    func getBackgroundUserDefault() -> String {
        var backgroundImage = UserDefaults.standard.string(forKey: "Background")
        return backgroundImage ?? "PlusFM"
    }
}
