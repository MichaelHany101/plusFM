//
//  EditDeleteMenu.swift
//  plusFM
//
//  Created by Michael Hany on 21/12/2023.
//

import SwiftUI

struct EditDeleteMenu: View {
    
    @Binding var show: Bool
    @Binding var toggleEditDeleteScreen: Bool
    @Binding var choiceEditDeleteScreen: Int
    @ObservedObject var audioRecorder: AudioRecorder
    
    var body: some View {
        ZStack(alignment: Alignment(horizontal: .center, vertical: .center)) {
            
            RoundedRectangle(cornerRadius: 30)
                .fill(Color("AppOrange"))
                .frame(width: 152, height: 152)
            
            RoundedRectangle(cornerRadius: 30)
                .fill(Color("AppWhite"))
                .frame(width: 150, height: 150)
            
            VStack(alignment: .leading, spacing: 25) {
                //MARK: - Rename
                Button(action: {
                    choiceEditDeleteScreen = 1
                    withAnimation{
                        show.toggle()
                        toggleEditDeleteScreen.toggle()
                    }
                }){
                    HStack(spacing: 25) {
                        Image("Edit")
                        Text("Rename_Alert")
                            .font(.system(size: 16, weight: .semibold))
                            .foregroundColor(Color("AppBlack"))
                    }
                }
                
                //MARK: - Delete
                Button(action: {
                    choiceEditDeleteScreen = 2
                    withAnimation{
                        show.toggle()
                        toggleEditDeleteScreen.toggle()
                    }
                }){
                    HStack(spacing: 25) {
                        Image("Delete")
                        Text("Delete_Alert")
                            .font(.system(size: 16, weight: .semibold))
                            .foregroundColor(Color("AppBlack"))
                    }
                }
            }
        }
        .padding(.trailing, 30)
    }
}

struct EditDeleteMenu_Previews: PreviewProvider {
    static var previews: some View {
        EditDeleteMenu(show: .constant(false), toggleEditDeleteScreen: .constant(false), choiceEditDeleteScreen: .constant(0), audioRecorder: AudioRecorder())
    }
}
