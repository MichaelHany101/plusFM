//
//  EditDeleteMenu.swift
//  plusFM
//
//  Created by Michael Hany on 21/12/2023.
//

import SwiftUI

struct EditDeleteMenu: View {
    
    @Binding var show: Bool
    var body: some View {
        ZStack(alignment: Alignment(horizontal: .trailing, vertical: .top)) {
            VStack(alignment: .leading, spacing: 25) {
                //MARK: - Rename
                Button(action: {
                    withAnimation{
                        show.toggle()
                    }
                }){
                    HStack(spacing: 25) {
                        Image("Edit")
                        Text("Rename")
                            .font(.system(size: 16, weight: .semibold))
                            .foregroundColor(Color("AppBlack"))
                    }
                }
                
                //MARK: - Delete
                Button(action: {
                    withAnimation{
                        show.toggle()
                    }
                }){
                    HStack(spacing: 25) {
                        Image("Delete")
                        Text("Delete")
                            .font(.system(size: 16, weight: .semibold))
                            .foregroundColor(Color("AppBlack"))
                    }
                }
            }
        }
    }
}

struct EditDeleteMenu_Previews: PreviewProvider {
    static var previews: some View {
        EditDeleteMenu(show: .constant(false))
    }
}
