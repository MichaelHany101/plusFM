//
//  AudioRecorder.swift
//  plusFM
//
//  Created by Michael Hany on 20/12/2023.
//

import Foundation
import SwiftUI
import Combine
import AVFoundation

class AudioRecorder: NSObject, ObservableObject {
    
    override init() {
        super.init()
        fetchRecording()
    }
    
    let objectWillChange = PassthroughSubject<AudioRecorder, Never>()
    
    var audioRecorder: AVAudioRecorder!
    
    var recordings = [Recording]()
    
    var recording = false {
        didSet {
            objectWillChange.send(self)
        }
    }
    
    //MARK: - Start Recording
    func startRecording() {
        let recordingSession = AVAudioSession.sharedInstance()
        
        do {
            try recordingSession.setCategory(.playAndRecord, mode: .default)
            try recordingSession.setActive(true)
        } catch {
            print("Failed to set up recording session")
        }
        
        let documentPath = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0]
        let audioFileName = documentPath.appendingPathComponent("\(Date().toString(dateFormat: "dd-MM-YYYY 'at' HH:mm")) at .m4a")
        let settings = [
            AVFormatIDKey: Int(kAudioFormatMPEG4AAC),
            AVSampleRateKey: 12000,
            AVNumberOfChannelsKey: 1,
            AVEncoderAudioQualityKey: AVAudioQuality.high.rawValue
        ]
        
        do {
            audioRecorder = try AVAudioRecorder(url: audioFileName, settings: settings)
            audioRecorder.record()
            if (audioFileName != nil){
                UserDefaults.standard.set(audioFileName, forKey: "RecordURL")
            }
            recording = true
        } catch {
            print("Could not start recording")
        }
    }
    
    //MARK: - Stop Recording
    func stopRecording() {
        audioRecorder.stop()
        recording = false
        fetchRecording()
    }
    
    //MARK: - Fetch Records
    func fetchRecording() {
        recordings.removeAll()
        let fileManager = FileManager.default
        let documentDirectory = fileManager.urls(for: .documentDirectory, in: .userDomainMask)[0]
        let directoryContents = try! fileManager.contentsOfDirectory(at: documentDirectory, includingPropertiesForKeys: nil)
        for audio in directoryContents {
            let recording = Recording(fileURL: audio, createdAt: getFileDate(for: audio))
            recordings.append(recording)
        }
        
        recordings.sort(by: { $0.createdAt.compare($1.createdAt) == .orderedAscending})
        
        objectWillChange.send(self)
    }
    
    //MARK: - Delete Record
    func deleteRecording(urlToDelete: URL) {
        do {
            try FileManager.default.removeItem(at: urlToDelete)
        } catch {
            print("File could not be deleted!")
        }
        fetchRecording()
    }
    
    //MARK: - Set Record's Name
    func namingAudioFile(name: String) {
        guard let originalURL = UserDefaults.standard.url(forKey: "RecordURL") else {
            print("No audio file recorded.")
            return
        }
        let newFileName = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0]
            .appendingPathComponent("\(Date().toString(dateFormat: "dd-MM-YYYY 'at' HH:mm")) at \(name).m4a")
        do {
            try FileManager.default.moveItem(at: originalURL, to: newFileName)
            print("Audio file renamed.")
        } catch {
            print("Error renaming audio file: \(error)")
        }
    }
    
    //MARK: - Edit Audio's Name
    func editRecordName(name: String, oldPath: URL?) {
        guard let originalURL = oldPath else {
            print("No audio file recorded.")
            return
        }
        
        let audioName = (originalURL.lastPathComponent).components(separatedBy: String(" at "))
        let date = audioName[0]
        let time = audioName[1]
        let oldName = audioName[2]
        
        let newFileName = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0]
            .appendingPathComponent("\(date) at \(time) at \(name).m4a")
        do {
            try FileManager.default.moveItem(at: originalURL, to: newFileName)
            print("Audio file renamed.")
        } catch {
            print("Error renaming audio file: \(error)")
        }
        
    }
    
    //MARK: - Record Name User Default
    func setRecordNameUserDefault(name : String) {
        UserDefaults.standard.set(name, forKey: "RecordName")
    }
    
    func getRecordNameUserDefault() -> String {
        let recordName = UserDefaults.standard.string(forKey: "RecordName")
        return recordName ?? "Name"
    }
}
