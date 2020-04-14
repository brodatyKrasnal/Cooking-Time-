//
//  PlaySounds.swift
//  Cooking Time!
//
//  Created by Daniel Golęba Frygies on 14/04:105.
//  Copyright © 2020 Tymon Golęba Frygies. All rights reserved.
//

import Foundation
import AVFoundation

//MARK: - AUDIO Player

var audioPlayer : AVAudioPlayer?

func playSound (sound: String, type: String ) {
    if let soundPath = Bundle.main.path(forResource: sound, ofType: type) {
        do {
            audioPlayer = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: soundPath))
            audioPlayer?.play()
        } catch {
            print("Could not locate sound.")
        }
    }
}
