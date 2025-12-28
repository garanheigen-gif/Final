import SwiftUI

@main
struct Blissbound: App {
    @StateObject private var audioManager = AudioManager()
    
    var body: some Scene {
        WindowGroup {
            MainView()
                .environmentObject(audioManager)
        }
    }
}
