import SwiftUI
import DotLottie

enum AppStage {
    case title
    case intro
    case mainGame
    case credits
}

struct MainView: View {
    @State private var gameState = GameState()
    @State private var currentStage: AppStage = .title
    @State private var showStatsToggleState: Bool = false
    
    var body: some View {
        @Bindable var bindableGameState = gameState
        
        ZStack {
            // 這裡使用 switch 來切換不同階段的視圖
            switch currentStage {
            case .title:
                TitleScreen {
                    withAnimation(.easeInOut(duration: 1.0)) {
                        currentStage = .intro
                    }
                }
                .transition(AnyTransition.opacity)
                
            case .intro:
                IntroScreen {
                    withAnimation(.easeInOut(duration: 1.0)) {
                        currentStage = .mainGame
                    }
                }
                .transition(AnyTransition.opacity)
                
            case .mainGame:
                TabView {
                    SettingView(showStatsToggle: $showStatsToggleState)
                        .tabItem {
                            Label("關於", systemImage: "person.circle.fill")
                        }
                    
                    ContentView(onGameEnd: {
                        withAnimation { currentStage = .credits }
                    })
                    .tabItem {
                        Label("故事", systemImage: "book.fill")
                    }
                    
                    EvidenceBoardView()
                        .tabItem {
                            Label("圖鑑", systemImage: "photo.fill")
                        }
                }
                .tint(.themePurple)
                .environment(gameState)
                
            case .credits:
                CreditsView {
                    gameState.reset()
                    
                    withAnimation { currentStage = .title }
                }
                .transition(AnyTransition.opacity)
            }
        }
        .onAppear {
            if gameState.dialogueHistory.isEmpty {
            }
        }
    }
}


struct TitleScreen: View {
    var onStart: () -> Void
    
    var body: some View {
        ZStack {
            Color.black.ignoresSafeArea()
            VStack(spacing: 40) {
                Spacer()
                Image(.background)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 380, height: 380)
                    .clipShape(Circle())
                    .overlay(Circle().stroke(Color.gray, lineWidth: 1))
                Text("Blissbound")
                    .font(.system(size: 40, weight: .heavy, design: .serif))
                    .foregroundColor(.white)
                    .shadow(color: .themePurple, radius: 10, x: 0, y: 0)
                
                Text("- 幸福的魔法使 -")
                    .font(.title2)
                    .foregroundColor(.gray)
                DotLottieAnimation(fileName: "sparkle icon", config: AnimationConfig(autoplay: true, loop: true)).view()
                    .frame(width: 120, height: 120)
                Button(action: onStart) {
                    Text("進入遊戲")
                        .font(.title2)
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                        .padding(.horizontal, 50)
                        .padding(.vertical, 15)
                        .background(
                            RoundedRectangle(cornerRadius: 25)
                                .fill(Color.clear)
                                .shadow(radius: 10)
                        )
                        .overlay(
                            RoundedRectangle(cornerRadius: 25)
                                .stroke(Color.white.opacity(0.5), lineWidth: 1)
                        )
                }
                .padding(.bottom, 50)
            }
        }
    }
}

struct IntroScreen: View {
    var onFinish: () -> Void
    
    let introText = """
    印象中，你是那個帶來【幸福】的魔法使【咪呼】
    指引那些陷入黑暗的少女，讓她們重新得到光。
    可每當你試圖回想——那些光芒最終去了哪裡？
    
    每次回到原點時，
    你都只會知道你的名字叫做【咪呼】
    
    所謂的【幸福】的承諾，
    你真的達成過嗎？
    
    一切都如此地模糊不清，殘破的記憶片段你感到不安。
    究竟是甚麼撕碎了你最為珍視的美好與羈絆呢？
    """
    
    var body: some View {
        ZStack {
            Color.blue.ignoresSafeArea()
            VStack {
                Spacer()
                Text(introText)
                    .font(.title3)
                    .fontWeight(.medium)
                    .foregroundColor(.white)
                    .multilineTextAlignment(.center)
                    .lineSpacing(10)
                    .padding()
                Spacer()
                Text("- 點擊螢幕開始 -")
                    .font(.caption)
                    .foregroundColor(.white)
                    .padding(.bottom, 30)
            }
        }
        .contentShape(Rectangle())
        .onTapGesture {
            onFinish()
        }
    }
}

#Preview {
    MainView()
        .environmentObject(AudioManager ())
}
