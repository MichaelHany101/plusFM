//
//  AudioPlayerManager.swift
//  plusFM
//
//  Created by Michael Hany on 12/12/2023.
//

import SwiftUI
import AVKit

class AudioPlayerManager: ObservableObject {
    @Published var isPlaying: Bool
    @Published var volume: Float
    private var player: AVPlayer

    init() {
        let playerURL = URL(string: "https://l3.itworkscdn.net/itwaudio/9026/stream")
        self.player = AVPlayer(url: playerURL!)
        self.isPlaying = true
        self.volume = player.volume
    }

    deinit{
        if isPlaying {
            pause()
        }
    }
    
    func play() {
        player.play()
        isPlaying = true
    }

    func pause() {
        player.pause()
        isPlaying = false
    }
    
    func setVolume(_ value: Float) {
        volume = value
        player.volume = volume
    }
}
