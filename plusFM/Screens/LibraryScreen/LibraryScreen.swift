//
//  LibraryScreen.swift
//  plusFM
//
//  Created by Michael Hany on 09/12/2023.
//

import SwiftUI

struct LibraryScreen: View {
    
    @Binding var isPresented: Bool
    @State private var downloadedRecords : Bool = false
    var body: some View {
        VStack{
            NavigationBar(isPresented: $isPresented, isArrowHidden: false, isTextHidden: false, title: "Library")
            
            RectSoundShape()
                .padding(.bottom, 190)

            if(!downloadedRecords){
                Group{
                    Text("Your library is empty.")
                    Text("Record your favourite tracks!")
                }
                .font(.system(size: 18, weight: .semibold))
            }
            else{
                //here will be the code of library list
            }
            
            Spacer()
            
            TabBar(index: .constant(0))
        }
    }
}

struct LibraryScreen_Previews: PreviewProvider {
    static var previews: some View {
        LibraryScreen(isPresented: .constant(false))
    }
}
