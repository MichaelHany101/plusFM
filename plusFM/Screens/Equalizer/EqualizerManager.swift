//
//  EqualizerManager.swift
//  plusFM
//
//  Created by Michael Hany on 27/12/2023.
//

import Foundation
import AVFoundation

protocol EqualizerManagerDelegate: class {
    func audioManager(didStart manager: EqualizerManager)
    func audioManager(didStop manager: EqualizerManager)
    func audioManager(didPause manager: EqualizerManager)
}

class EqualizerManager {
    weak var delegate: EqualizerManagerDelegate?
    
    // Variables
    fileprivate let player = AVPlayer()
    fileprivate var EQNode: AVAudioUnitEQ?
    
    init?(streamURL: URL, frequencies: [Int]) {
        setUpEngine(with: streamURL, frequencies: frequencies)
    }
    
    fileprivate func setUpEngine(with url: URL, frequencies: [Int]) {
        // Set up Equalizer
        EQNode = AVAudioUnitEQ(numberOfBands: frequencies.count)
        EQNode!.globalGain = 1
        for i in 0...(EQNode!.bands.count - 1) {
            EQNode!.bands[i].frequency = Float(frequencies[i])
            EQNode!.bands[i].gain = 0
            EQNode!.bands[i].bypass = false
            EQNode!.bands[i].filterType = .parametric
        }
        
        // Attach nodes to an engine
        let playerItem = AVPlayerItem(url: url)
        player.replaceCurrentItem(with: playerItem)
        
        // Attach Equalizer to player's audioMix
        playerItem.audioMix = AVAudioMix()
        let audioMix = AVMutableAudioMix()
        let eqParameters = EQNode!.bypass ? [] : [EQNode!]
        //audioMix.inputParameters = eqParameters.map { $0 as AVAudioMixInputParameters }
        playerItem.audioMix = audioMix
        // Observer for item end
        NotificationCenter.default.addObserver(self, selector: #selector(playerItemDidReachEnd), name: .AVPlayerItemDidPlayToEndTime, object: player.currentItem)
    }
    
    @objc private func playerItemDidReachEnd() {
        // Handle item completion
    }
}

// MARK: State Update
extension EqualizerManager {
    public func isPlaying() -> Bool {
        return player.rate > 0
    }
    
    public func play() {
        player.play()
        delegate?.audioManager(didStart: self)
    }
    
    public func stop() {
        player.pause()
        player.seek(to: .zero) // Reset to the beginning
        delegate?.audioManager(didStop: self)
    }
    
    public func pause() {
        player.pause()
        delegate?.audioManager(didPause: self)
    }
}

// MARK: GET, SET
extension EqualizerManager {
    public func setBypass(_ isOn: Bool) {
        guard let EQNode = EQNode else {
            return
        }
        EQNode.bypass = isOn
        EQNode.bands.forEach { band in
            band.bypass = isOn
        }
    }
    
    public func setEquailizerOptions(gains: [Float]) {
        guard let EQNode = EQNode else {
            return
        }
        for i in 0...(EQNode.bands.count - 1) {
            EQNode.bands[i].gain = gains[i]
        }
    }
    
    public func getEquailizerOptions() -> [Float] {
        guard let EQNode = EQNode else {
            return []
        }
        return EQNode.bands.map { $0.gain }
    }
}

