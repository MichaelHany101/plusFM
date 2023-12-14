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
    private var player: AVPlayer

    init() {
        let playerURL = URL(string: "https://l3.itworkscdn.net/itwaudio/9026/stream")
        self.player = AVPlayer(url: playerURL!)
        self.isPlaying = true
        if isPlaying {
            play()
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
}
