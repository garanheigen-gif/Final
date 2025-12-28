import Foundation
import AVFAudio
import Combine

final class AudioManager: ObservableObject {
    private var player: AVAudioPlayer?
    
    @Published var isBgmEnabled: Bool {
        didSet {
            if isBgmEnabled {
                if let currentBgmName {
                    playLoopingBGM(named: currentBgmName)
                }
            } else {
                stopBGM()
            }
            UserDefaults.standard.set(isBgmEnabled, forKey: "bgm_enabled")
        }
    }
    
    @Published var volume: Float {
        didSet {
            player?.volume = volume
            UserDefaults.standard.set(volume, forKey: "bgm_volume")
        }
    }
    
    @Published var currentBgmName: String? {
        didSet {
            UserDefaults.standard.set(currentBgmName, forKey: "bgm_current_name")
        }
    }
    
    init() {
        self.isBgmEnabled = UserDefaults.standard.object(forKey: "bgm_enabled") as? Bool ?? true
        self.volume = UserDefaults.standard.object(forKey: "bgm_volume") as? Float ?? 1.0
        self.currentBgmName = UserDefaults.standard.object(forKey: "bgm_current_name") as? String
        configureAudioSession()
        if isBgmEnabled, let currentBgmName {
            playLoopingBGM(named: currentBgmName)
        }
    }
    
    private func configureAudioSession() {
        do {
            try AVAudioSession.sharedInstance().setCategory(.playback, mode: .default)
            try AVAudioSession.sharedInstance().setActive(true)
        } catch {
            print("AudioManager: Audio session error: \(error)")
        }
    }
    
    private func loadPlayerIfNeeded(for name: String) {
        if let player, currentBgmName == name {
            player.volume = volume
            return
        }
        guard let url = Bundle.main.url(forResource: name, withExtension: "mp3") else {
            print("AudioManager: \(name).mp3 not found in main bundle. Check Target Membership.")
            return
        }
        do {
            let p = try AVAudioPlayer(contentsOf: url)
            p.numberOfLoops = -1
            p.volume = volume
            p.prepareToPlay()
            self.player = p
            self.currentBgmName = name
        } catch {
            print("AudioManager: AVAudioPlayer init error: \(error)")
        }
    }
    
    func playLoopingBGM(named name: String) {
        guard isBgmEnabled else {
            currentBgmName = name
            return
        }
        loadPlayerIfNeeded(for: name)
        guard let player else {
            print("AudioManager: player is nil; cannot play.")
            return
        }
        if !player.isPlaying {
            player.currentTime = 0
            _ = player.play()
        }
    }
    
    func stopBGM() {
        player?.stop()
    }
}
