//
//  EditDeleteCustomAlert.swift
//  plusFM
//
//  Created by Michael Hany on 22/12/2023.
//

import SwiftUI

struct EditDeleteCustomAlert: View {
    
    @ObservedObject var audioRecorder: AudioRecorder
    @State private var recordingTitle: String = ""
    @Binding var toggleEditDeleteScreen: Bool
    @Binding var choiceEditDeleteScreen: Int
    @Binding var selectedURL: String
    
    var body: some View {
        ZStack(alignment: Alignment(horizontal: .center, vertical: .center)) {
            
            RoundedRectangle(cornerRadius: 30)
                .fill(Color("AppOrange"))
                .frame(width: 355, height: 205)
            
            RoundedRectangle(cornerRadius: 30)
                .fill(Color("AppWhite"))
                .frame(width: 350, height: 200)
            
            VStack{
                //MARK: - Rename or Delete Message
                //Rename Case
                if (choiceEditDeleteScreen == 1) {
                    TextField("TextField_Alert", text: $recordingTitle)
                        .padding()
                        .background(RoundedRectangle(cornerRadius: 30).stroke(Color("AppOrange"), lineWidth: 1))
                        .padding(.horizontal, 50)
                        .padding(.bottom, 15)
                }
                //Delete Case
                else if (choiceEditDeleteScreen == 2) {
                    Text("Text_Message_Alert")
                        .font(.system(size: 18, weight: .semibold))
                        .padding()
                        .padding(.bottom, 15)
                }
                HStack{
                    //MARK: - Cancel Button
                    Button(action: {
                        withAnimation{
                            toggleEditDeleteScreen.toggle()
                        }
                    }) {
                        Text("Cancel_Alert")
                            .foregroundColor(Color("AppBlack"))
                            .font(.system(size: 18, weight: .semibold))
                            .padding()
                            .frame(width: 135)
                            .background(
                                RoundedRectangle(cornerRadius: 20)
                                    .fill(Color("AppWhite"))
                                    .overlay(
                                        RoundedRectangle(cornerRadius: 30)
                                            .stroke(Color("AppGray"), lineWidth: 5)
                                            .blur(radius: 4)
                                            .offset(x: 2, y: 2)
                                            .mask(RoundedRectangle(cornerRadius: 30).fill(LinearGradient(gradient: Gradient(colors: [.gray, .white]), startPoint: .leading, endPoint: .trailing)))
                                    )
                            )
                            .scaleEffect(1.0)
                    }
                    .padding(.leading, 50)
                    
                    Spacer()
                    
                    //MARK: - Save or Delete Button
                    Button(action: {
                        //Rename Case
                        if (choiceEditDeleteScreen == 1){
                            audioRecorder.editRecordName(name: recordingTitle, oldPath: URL(string:selectedURL))
                        }
                        //Delete Case
                        else if (choiceEditDeleteScreen == 2) {
                            audioRecorder.deleteRecording(urlToDelete: URL(string: selectedURL)!)
                        }
                        withAnimation{
                            toggleEditDeleteScreen.toggle()
                        }
                    }) {
                        Text(choiceEditDeleteScreen == 1 ? "Save_Alert" : (choiceEditDeleteScreen == 2 ? "Delete_Alert" : ""))
                            .foregroundColor(Color("AppWhite"))
                            .font(.system(size: 18, weight: .semibold))
                            .padding()
                            .frame(width: 135)
                            .background(
                                RoundedRectangle(cornerRadius: 20)
                                    .fill(Color("AppOrange"))
                                    .overlay(
                                        RoundedRectangle(cornerRadius: 30)
                                            .stroke(Color("AppOrange"), lineWidth: 5)
                                            .blur(radius: 4)
                                            .offset(x: 2, y: 2)
                                            .mask(RoundedRectangle(cornerRadius: 30).fill(LinearGradient(gradient: Gradient(colors: [.clear, .white]), startPoint: .topLeading, endPoint: .bottomTrailing)))
                                    )
                            )
                            .scaleEffect(1.0)
                    }
                    .padding(.trailing, 50)
                }
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
}

struct EditDeleteCustomAlert_Previews: PreviewProvider {
    static var previews: some View {
        EditDeleteCustomAlert(audioRecorder: AudioRecorder(), toggleEditDeleteScreen: .constant(false), choiceEditDeleteScreen: .constant(2), selectedURL: .constant(""))
    }
}
