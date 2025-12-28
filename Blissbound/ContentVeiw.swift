//
//  ContentView.swift
//  story_test_2
//
//  Created by 114-1iosClassStudent03 on 2025/11/28.
//

import SwiftUI

enum NPCType: String {
    case zhi
    case alice
    case haru
    case yu
    case mari
    case lin
    case witch
    
    var imageName: String {
        switch self {
        case .zhi: return "npc_zhi"
        case .alice: return "npc_alice"
        case .haru: return "npc_haru"
        case .yu: return "npc_yu"
        case .mari: return "npc_mari"
        case .lin: return "npc_lin"
        case .witch: return "npc_lin"
        }
    }
    
    var bubbleColor: Color {
        switch self {
        case .zhi: return Color.blue.opacity(0.1)
        case .alice: return Color.white
        case .haru: return Color(red: 255/255, green: 0/255, blue: 120/255).opacity(0.1)
        case .yu: return Color(red: 1.0, green: 0.95, blue: 0.8)
        case .mari: return Color(red: 2/255, green: 173/255, blue: 189/255).opacity(0.1)
        case .lin: return Color(red: 173/255, green: 244/255, blue: 2/255).opacity(0.1)
        case .witch: return Color.black
        }
    }
    
    var textColor: Color {
        switch self {
        case .witch:
            return .red
        default:
            return Color.darkDialog
        }
    }
    
    var borderColor: Color {
        switch self {
        case .zhi: return .blue.opacity(0.8)
        case .alice: return Color.lightLavender
        case .haru: return Color(red: 255/255, green: 0/255, blue: 120/255).opacity(0.8)
        case .yu: return .orange.opacity(0.8)
        case .mari: return Color(red: 2/255, green: 173/255, blue: 189/255)
        case .lin: return Color(red: 153/255, green: 191/255, blue: 27/255)
        case .witch: return .gray
        }
    }
}

enum MessageSender: Equatable {
    case npc(NPCType)
    case player
    case narration
}

struct ChatBubble: View {
    let text: String
    let sender: MessageSender
    let name: String?
    
    var body: some View {
        HStack(alignment: .bottom) {
            if case .npc(let type) = sender {
                Image(systemName: "moon.stars.circle.fill")
                    .resizable()
                    .foregroundStyle(type.borderColor)
                    .scaledToFill()
                    .frame(width: 40, height: 40)
                    .clipShape(Circle())
            } else if sender == .player {
                Spacer()
            }
            
            VStack(alignment: sender == .player ? .trailing : .leading, spacing: 4) {
                if let name = name {
                    Text(name)
                        .font(.caption)
                        .foregroundColor(.gray)
                }
                
                Text(text)
                    .padding(12)
                    .foregroundStyle(textColor(for: sender))
                    .background(backgroundColor(for: sender))
                    .cornerRadius(12)
                    .overlay(
                        RoundedRectangle(cornerRadius: 12)
                            .stroke(borderColor(for: sender), lineWidth: 1)
                    )
            }
            
            if sender == .player {
                Image(.playerHead)
                    .resizable()
                    .scaledToFill()
                    .frame(width: 40, height: 40)
                    .clipShape(Circle())
            } else if case .npc = sender {
                Spacer()
            }
        }
        .padding(.horizontal)
        .padding(.vertical, 4)
    }
    
    private func backgroundColor(for sender: MessageSender) -> Color {
        switch sender {
        case .npc(let type): return type.bubbleColor
        case .player: return Color.themePurple
        default: return .clear
        }
    }
    
    private func textColor(for sender: MessageSender) -> Color {
        switch sender {
        case .npc(let type): return type.textColor
        case .player: return .white
        default: return .black
        }
    }
    
    private func borderColor(for sender: MessageSender) -> Color {
        switch sender {
        case .npc(let type): return type.borderColor
        case .player: return Color.lightLavender.opacity(1)
        default: return .clear
        }
    }
}

struct NarrationBubble: View {
    let text: String
    var body: some View {
        Text(text)
            .padding()
            .frame(maxWidth: .infinity)
            .background(Color.darkLavender.opacity(0.2))
            .cornerRadius(10)
            .padding(.horizontal)
            .padding(.vertical, 4)
            .foregroundColor(Color.darkDialog)
    }
}

struct ContinueButton: View {
    let action: () -> Void
    var body: some View {
        Button(action: action) {
            HStack {
                Text("點擊繼續").font(.caption).foregroundColor(.gray)
                Image(systemName: "chevron.down").font(.caption).foregroundColor(.gray)
            }.padding()
        }
    }
}

struct ChoiceButton: View {
    let text: String
    let action: () -> Void
    var body: some View {
        Button(action: action) {
            Text(text)
                .padding()
                .frame(maxWidth: .infinity)
                .background(Color.clear)
                .cornerRadius(12)
                .overlay(RoundedRectangle(cornerRadius: 12).stroke(Color.blue, lineWidth: 1))
        }.padding(.horizontal).padding(.vertical, 4).foregroundStyle(Color.themePurple)
    }
}

struct ContentView: View {
    @Environment(GameState.self) private var gameState
    @EnvironmentObject private var audioManager: AudioManager
    var onGameEnd: () -> Void
    
    @State private var showEnding = false
    @State private var showingContinueButton = true
    @State private var showChoiceButtons = false
    @State private var postChoiceMessages: [Message] = []
    @State private var showingResetAlert = false
    @State private var showingChapterOneHintAlert = false
    @State private var showStatsToggle = true
    @State private var isAtChapterEnd = false
    
    // BGM 選擇：若同分，優先序 love > rebel > despair
    func dominantStatBgmName() -> String {
        let love = gameState.loveValue
        let rebel = gameState.rebelValue
        let despair = gameState.despairValue
        let maxVal = max(love, max(rebel, despair))
        var candidates: [String] = []
        if love == maxVal { candidates.append("love") }
        if rebel == maxVal { candidates.append("rebel") }
        if despair == maxVal { candidates.append("despair") }
        if candidates.contains("love") { return "love_bgm" }
        if candidates.contains("rebel") { return "rebel_bgm" }
        return "despair_bgm"
    }
    
    func updateBgmForCurrentStats() {
        let name = dominantStatBgmName()
        audioManager.playLoopingBGM(named: name)
    }
    
    // 結局判定：同分時優先序 love > rebel > despair
    var finalEndingType: String {
        let love = gameState.loveValue
        let rebel = gameState.rebelValue
        let despair = gameState.despairValue
        
        let maxValue = max(love, max(rebel, despair))
        var tied: [String] = []
        if love == maxValue { tied.append("love") }
        if rebel == maxValue { tied.append("rebel") }
        if despair == maxValue { tied.append("despair") }
        if tied.count == 1 { return tied.first! }
        for candidate in ["love", "rebel", "despair"] {
            if tied.contains(candidate) { return candidate }
        }
        return "normal"
    }
    
    var scenes: [[Message]] {
        if !postChoiceMessages.isEmpty { return [postChoiceMessages] }
        switch gameState.currentChapter {
        case 1: return GameData.scenes1
        case 2: return GameData.scenes2
        case 3: return GameData.scenes3
        case 4: return GameData.scenes4
        case 5: return GameData.scenes5
        case 6:
            switch gameState.lockedEndingType ?? "normal" {
            case "love": return GameData.ending6_love
            case "rebel": return GameData.ending6_rebel
            case "despair": return GameData.ending6_despair
            default: return GameData.ending6_normal
            }
        default: return []
        }
    }
    
    var choices: [[(text: String, type: String)]] {
        switch gameState.currentChapter {
        case 1: return GameData.choices1
        case 2: return GameData.choices2
        case 3: return GameData.choices3
        case 4: return GameData.choices4
        case 5: return GameData.choices5
        default: return []
        }
    }
    
    var endingText: String {
        switch gameState.currentChapter {
        case 1: return GameData.endings1[finalEndingType] ?? ""
        case 2: return GameData.endings2[finalEndingType] ?? ""
        case 3: return GameData.endings3[finalEndingType] ?? ""
        case 4: return GameData.endings4[finalEndingType] ?? ""
        case 5: return GameData.endings5[finalEndingType] ?? ""
        case 6: return GameData.endings6[finalEndingType] ?? (gameState.lockedEndingType == "normal" ? (GameData.endings6["normal"] ?? "") : "")
        default: return ""
        }
    }
    
    var endingImageName: String {
        if gameState.currentChapter >= 1 && gameState.currentChapter <= 6 { return "\(gameState.currentChapter)" }
        return "chapter\(gameState.currentChapter)_\(finalEndingType)"
    }
    
    var endingTriggerButtonView: some View {
        Group {
            if shouldShowEndingTriggerButton {
                VStack(spacing: 12) {
                    Text(gameState.currentChapter < 6 ? "章節結束..." : "全劇終")
                        .font(.headline).foregroundColor(.gray).padding(.top)
                    Button(gameState.currentChapter < 6 ? "- 小結 -" : "- 結局 -") {
                        showFinalEnding()
                    }
                    .padding().background(Color.clear).foregroundColor(.blue).cornerRadius(12).overlay(RoundedRectangle(cornerRadius: 12).stroke(Color.clear, lineWidth: 1))
                }.padding()
            }
        }
    }
    
    var body: some View {
        VStack(spacing: 0) {
            ScrollViewReader { proxy in
                ScrollView {
                    LazyVStack(spacing: 8) {
                        ForEach(gameState.dialogueHistory) { message in
                            createMessageView(message: message)
                        }
                        
                        if showingContinueButton && !isAtChapterEnd && gameState.currentSceneIndex < scenes.count && !showEnding {
                            ContinueButton { showNextMessage() }.id("continue_button")
                        }
                        
                        if showChoiceButtons && !showEnding {
                            VStack(spacing: 12) {
                                Text("請選擇：").font(.headline).foregroundColor(.gray).padding(.top)
                                if choices.indices.contains(gameState.currentSceneIndex) {
                                    let currentSceneChoices = choices[gameState.currentSceneIndex]
                                    ForEach(0..<currentSceneChoices.count, id: \.self) { index in
                                        let choice = currentSceneChoices[index]
                                        ChoiceButton(text: choice.text) { handleChoice(choice.type) }
                                    }
                                }
                            }
                        }
                        
                        endingTriggerButtonView
                        Color.clear.frame(height: 1).id("bottom")
                    }.padding(.vertical)
                }
                .overlay(alignment: .topTrailing) {
                    if showingContinueButton && !showChoiceButtons && !showEnding && !isAtChapterEnd {
                        Button(action: { withAnimation { skipToSceneEnd() } }) {
                            HStack(spacing: 4) { Text("跳過").fontWeight(.bold); Image(systemName: "forward.end.fill") }
                                .font(.caption).foregroundColor(.gray.opacity(0.8)).padding(.horizontal, 12).padding(.vertical, 6)
                                .background(Material.thinMaterial).cornerRadius(20).overlay(RoundedRectangle(cornerRadius: 20).stroke(Color.gray.opacity(0.3), lineWidth: 1))
                        }.padding(.trailing, 16).padding(.top, 16).allowsHitTesting(true)
                    }
                }
                .onChange(of: gameState.dialogueHistory.count) { if !showEnding { withAnimation { proxy.scrollTo("bottom", anchor: .bottom) } } }
                .onChange(of: showChoiceButtons) { newValue in if newValue && !showEnding { DispatchQueue.main.async { withAnimation { proxy.scrollTo("bottom", anchor: .bottom) } } } }
                .onAppear {
                    DispatchQueue.main.async { proxy.scrollTo("bottom", anchor: .bottom) }
                }
            }
            
            if showEnding {
                VStack {
                    ScrollView(.vertical) {
                        VStack {
                            Text(getEndingTitle()).font(.title2).fontWeight(.bold).padding()
                            Text(endingText).font(.title3).multilineTextAlignment(.leading).padding().frame(maxWidth: .infinity)

                            if gameState.currentChapter <= 6 {
                                GeometryReader { geo in
                                    Image(endingImageName).resizable().scaledToFit().frame(maxWidth: geo.size.width * 0.85).clipped().padding(.top, 20).frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .center)
                                }.frame(height: 300)
                            }
                        }
                        .frame(maxWidth: .infinity, alignment: .center).padding()
                    }
                    VStack {
                        if gameState.currentChapter == 1 {
                            Button("- 進入第 2 章 -") { showingChapterOneHintAlert = true }.padding().background(Color.clear).foregroundColor(.themePurple).cornerRadius(8)
                        } else if gameState.currentChapter < 6 {
                            Button("- 進入第 \(gameState.currentChapter + 1) 章 -") { startNextChapter() }.padding().background(Color.clear).foregroundColor(.themePurple).cornerRadius(8)
                        } else {
                            Button("觀看製作名單與圖鑑") { onGameEnd() }.padding().background(Color.themePurple).foregroundColor(.white).cornerRadius(8)
                        }
                    }.background(Color.white).cornerRadius(12).padding().frame(maxWidth: .infinity, alignment: .center)
                }
            }
        }
        .onAppear {
            if gameState.dialogueHistory.isEmpty && !showEnding {
                showNextMessage()
            } else if !showEnding && !showChoiceButtons && !isAtChapterEnd {
                showingContinueButton = true
            }
            updateBgmForCurrentStats()
        }
        .onChange(of: gameState.loveValue) { _ in updateBgmForCurrentStats() }
        .onChange(of: gameState.rebelValue) { _ in updateBgmForCurrentStats() }
        .onChange(of: gameState.despairValue) { _ in updateBgmForCurrentStats() }
        .alert("確認重新開始", isPresented: $showingResetAlert) {
            Button("確定", role: .destructive) { resetGame() }
            Button("取消", role: .cancel) { }
        } message: { Text("重新開始遊戲將會清除所有進度和數值。您確定嗎？") }
        .alert("記憶增加了！", isPresented: $showingChapterOneHintAlert) {
            Button("繼續") { startNextChapter() }
        } message: { Text("你到了一段全新的記憶，去圖鑑裡看看吧。") }
    }
    
    var shouldShowEndingTriggerButton: Bool {
        if showEnding { return false }
        if !postChoiceMessages.isEmpty { return false }
        if scenes.isEmpty { return false }
        if isAtChapterEnd { return true }
        if showingContinueButton || showChoiceButtons { return false }
        guard gameState.currentSceneIndex < scenes.count else { return true }
        let currentSceneCount = scenes[gameState.currentSceneIndex].count
        return gameState.currentSceneIndex >= scenes.count - 1 && gameState.currentDialogueIndex >= currentSceneCount
    }
    
    func getEndingTitle() -> String {
        if gameState.currentChapter < 6 { return "第 \(gameState.currentChapter) 章完 - " }
        else { return "結局：\(getEndingTypeName())" }
    }
    
    func getEndingTypeName() -> String {
        switch finalEndingType {
        case "love": return "守墓人"
        case "rebel": return "多謝款待"
        case "despair": return "銜尾蛇"
        default: return "普通"
        }
    }
    
    func createMessageView(message: Message) -> AnyView {
        if let specificNPCType = NPCType(rawValue: message.type) {
            return AnyView(ChatBubble(text: message.text, sender: .npc(specificNPCType), name: message.name))
        }
        switch message.type {
        case "narration":
            return AnyView(NarrationBubble(text: message.text))
        case "player":
            return AnyView(ChatBubble(text: message.text, sender: .player, name: nil))
        case "npc":
            return AnyView(ChatBubble(text: message.text, sender: .npc(.zhi), name: message.name))
        default:
            return AnyView(EmptyView())
        }
    }
    
    func showNextMessage() {
        if scenes.isEmpty { return }
        guard gameState.currentSceneIndex < scenes.count else { return }
        
        let currentScene = scenes[gameState.currentSceneIndex]
        if gameState.currentDialogueIndex < currentScene.count {
            let message = scenes[gameState.currentSceneIndex][gameState.currentDialogueIndex]
            gameState.dialogueHistory.append(message)
            gameState.currentDialogueIndex += 1
            showingContinueButton = gameState.currentDialogueIndex < scenes[gameState.currentSceneIndex].count
            
            if !showingContinueButton {
                if !postChoiceMessages.isEmpty {
                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                        self.postChoiceMessages.removeAll()
                        self.gameState.currentSceneIndex += 1
                        self.gameState.currentDialogueIndex = 0
                        self.showingContinueButton = true
                        self.showNextMessage()
                    }
                    return
                }
                
                if gameState.currentSceneIndex < choices.count {
                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) { showChoiceButtons = true }
                } else if gameState.currentSceneIndex < scenes.count - 1 {
                    DispatchQueue.main.asyncAfter(deadline: .now() + 1.2) {
                        gameState.currentSceneIndex += 1
                        gameState.currentDialogueIndex = 0
                        showingContinueButton = true
                        showNextMessage()
                    }
                } else {
                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
                        isAtChapterEnd = true
                        showingContinueButton = false
                    }
                }
            }
        }
    }
    
    func skipToSceneEnd() {
        if scenes.isEmpty { return }
        guard gameState.currentSceneIndex < scenes.count else { return }
        
        let currentScene = scenes[gameState.currentSceneIndex]
        if gameState.currentDialogueIndex >= currentScene.count { return }
        
        let remainingMessages = currentScene[gameState.currentDialogueIndex..<currentScene.count]
        gameState.dialogueHistory.append(contentsOf: remainingMessages)
        gameState.currentDialogueIndex = currentScene.count
        showingContinueButton = false
        
        if !postChoiceMessages.isEmpty {
            self.postChoiceMessages.removeAll()
            self.gameState.currentSceneIndex += 1
            self.gameState.currentDialogueIndex = 0
            self.showingContinueButton = true
            self.showNextMessage()
            return
        }
        
        if gameState.currentSceneIndex < choices.count {
            showChoiceButtons = true
        } else if gameState.currentSceneIndex < scenes.count - 1 {
            gameState.currentSceneIndex += 1
            gameState.currentDialogueIndex = 0
            showingContinueButton = true
            showNextMessage()
        } else {
            isAtChapterEnd = true
            showingContinueButton = false
        }
    }
    
    func handleChoice(_ type: String) {
        switch type {
        case "love": gameState.loveValue += 1
        case "rebel": gameState.rebelValue += 1
        case "despair": gameState.despairValue += 1
        default: break
        }
        updateBgmForCurrentStats()
        
        showChoiceButtons = false
        
        var choiceText: String = ""
        if gameState.currentSceneIndex < choices.count {
            if let choice = choices[gameState.currentSceneIndex].first(where: { pair in pair.type == type }) {
                choiceText = choice.text
            }
        }
        
        if !choiceText.isEmpty {
            let msg = Message(type: "player", text: choiceText)
            gameState.dialogueHistory.append(msg)
        }
        gameState.lastChoiceType = type
        
        var reactionMessages: [Message]? = nil
        if gameState.currentChapter >= 1 && gameState.currentChapter <= 5 {
            reactionMessages = GameData.reactionDialogues[gameState.currentChapter]?[type]
        }
        
        if let dialogue = reactionMessages {
            postChoiceMessages = dialogue
            gameState.currentSceneIndex = 0
            gameState.currentDialogueIndex = 0
            showingContinueButton = true
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) { self.showNextMessage() }
            return
        }
        
        if gameState.currentSceneIndex < scenes.count - 1 {
            gameState.currentSceneIndex += 1
            gameState.currentDialogueIndex = 0
            showingContinueButton = true
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) { self.showNextMessage() }
        } else {
            DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
                isAtChapterEnd = true
                showingContinueButton = false
            }
        }
    }
    
    func showFinalEnding() {
        showEnding = true
        showingContinueButton = false
        showChoiceButtons = false
        isAtChapterEnd = false
    }
    
    func startNextChapter() {
        if gameState.currentChapter >= 6 {
            resetGame()
            return
        }
        if let index = gameState.chapterLogs.firstIndex(where: { $0.chapterNumber == gameState.currentChapter }) {
            gameState.chapterLogs[index].isCompleted = true
        }
        if gameState.currentChapter == 5 { gameState.lockedEndingType = finalEndingType }
        gameState.maxChapterCompleted = max(gameState.maxChapterCompleted, gameState.currentChapter)
        gameState.currentChapter += 1
        
        gameState.currentSceneIndex = 0
        gameState.currentDialogueIndex = 0
        showEnding = false
        gameState.dialogueHistory.removeAll()
        showingContinueButton = true
        showChoiceButtons = false
        postChoiceMessages.removeAll()
        isAtChapterEnd = false
        updateBgmForCurrentStats()
        showNextMessage()
    }
    
    func resetGame() {
        gameState.currentChapter = 1
        gameState.loveValue = 0
        gameState.rebelValue = 0
        gameState.despairValue = 0
        gameState.lastChoiceType = ""
        gameState.lockedEndingType = nil
        
        gameState.currentSceneIndex = 0
        gameState.currentDialogueIndex = 0
        showEnding = false
        gameState.dialogueHistory.removeAll()
        showingContinueButton = true
        showChoiceButtons = false
        isAtChapterEnd = false
        updateBgmForCurrentStats()
        showNextMessage()
    }
}

#Preview {
    ContentView(onGameEnd: {})
        .environment(GameState())
        .environmentObject(AudioManager())
}
