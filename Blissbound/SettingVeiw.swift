//
//  SettingVeiw.swift
//  story_test_2
//
//  Created by 114-1iosClassStudent03 on 2025/12/4.
//

import SwiftUI

struct SettingView: View {
    @Environment(GameState.self) private var gameState
    @EnvironmentObject private var audioManager: AudioManager
    @Binding var showStatsToggle: Bool
    @State private var forceRefresh: Bool = false
    @State private var isLogExpanded: Bool = true
    
    var body: some View {
        List {
            HStack {
                Image(.meefu)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 180, height: 180)
                    .clipShape(Circle())
                    .overlay(Circle().stroke(Color.gray, lineWidth: 1))
                    .frame(maxWidth: .infinity, alignment: .leading)
                VStack{
                    HStack{
                        Text("✦✦")
                            .font(.title)
                            .foregroundStyle(Color(.gray))
                        Spacer(minLength: 30)
                        Text("""
-[M-██7]
---active- 

""")
                        .foregroundStyle(Color(.gray))
                        .font(Font.footnote.bold())
                        .frame(maxWidth: .infinity, alignment: .leading)
                        
                    }
                    HStack{
                        Text("咪呼")
                            .font(.title.bold())
                            .foregroundStyle(Color(.black))
                        VStack{
                            Text("MeeFu")
                                .font(.system(size: 20, weight: .heavy, design: .serif))
                                .foregroundStyle(Color(.gray).opacity(0.3))
                            Text("✦✦✦")
                                .font(.title2)
                                .foregroundStyle(Color(.gray).opacity(0.3))
                        }
                        .frame(maxWidth: .infinity, alignment: .bottom)
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                    Rectangle()
                        .foregroundColor(.gray.opacity(0.3))
                        .frame(width: 150, height: 1)
                    Text("""
                「幸福的魔法使！」
                """)
                    .font(.callout.bold())
                    .foregroundColor(Color.themePurple)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.vertical, 2)
                    Rectangle()
                        .foregroundColor(.gray.opacity(0.3))
                        .frame(width: 150, height: 1)
                }
                .padding(.leading)
            }

            Section {
                Text("✦ ReadMe ✦").fontDesign(.serif).font(.title3).foregroundColor(.black)
                DisclosureGroup("「也許是服用說明？」") {
                    VStack(alignment: .leading, spacing: 5) {
                        Text("「我」是誰？")
                            .font(.headline)
                            .foregroundColor(.primary)
                        Text("你是一隻自稱「幸福魔法使」的謎之超自然生物，能藉由把人類變成魔法少女為人間帶來幸福。不過，你因為不明原因失去了幫助少女們的珍貴記憶。")
                            .font(.subheadline)
                            .foregroundColor(.secondary)
                        Text("✦✦✦")
                            .font(.headline)
                            .foregroundStyle(Color(.gray).opacity(0.3))
                        Text("「我」該做什麼？")
                            .font(.headline)
                            .foregroundColor(.primary)
                        Text("你將在對話和行動中發掘自己的過去，你的抉擇將會影響故事的結局。")
                            .font(.subheadline)
                            .foregroundColor(.secondary)
                        Text("✦✦✦")
                            .font(.headline)
                            .foregroundStyle(Color(.gray).opacity(0.3))
                    }
                    .padding(.vertical, 5)
                }
            }
            Section {
                Text("✦ 日誌 ✦").font(.title3).foregroundColor(.black)
                DisclosureGroup("「為避免再次遺忘？」", isExpanded: $isLogExpanded) {
                    ForEach(gameState.completedChapterLogs) { log in
                        VStack(alignment: .leading, spacing: 5) {
                            Text("第 \(log.chapterNumber) 章：\(log.title)")
                                .font(.headline)
                                .foregroundColor(.primary)
                            Text(log.description)
                                .font(.subheadline)
                                .foregroundColor(.secondary)
                                .lineLimit(nil)
                        }
                        .padding(.vertical, 5)
                    }
                }
            }
            .headerProminence(.increased)
            
            VStack(alignment: .leading, spacing: 0) {
                Toggle(isOn: $showStatsToggle) {
                    VStack(alignment: .leading, spacing: 7) {
                        Text("✦ 或許一切已成定局 ✦").font(.title3).foregroundColor(.black)
                        Text("「這真的是你所期待的道路？」").font(.default).foregroundColor(.black)
                    }
                }
                .tint(.themePurple)
                .padding(.vertical, 5)
            }
            .listRowBackground(Color.clear)
            .listRowSeparator(.hidden)
            
            if showStatsToggle {
                HStack {
                    VStack {
                        Text("共鳴").font(.caption).foregroundColor(.themePurple)
                        Text("\(gameState.loveValue)").fontWeight(.bold)
                    }.frame(maxWidth: .infinity)
                    
                    VStack {
                        Text("逆行").font(.caption).foregroundColor(.themePurple)
                        Text("\(gameState.rebelValue)").fontWeight(.bold)
                    }.frame(maxWidth: .infinity)
                    
                    VStack {
                        Text("陷落").font(.caption).foregroundColor(.themePurple)
                        Text("\(gameState.despairValue)").fontWeight(.bold)
                    }
                    .frame(maxWidth: .infinity)
                }
                .padding()
                .background(Color.gray.opacity(0.1))
                .cornerRadius(10)
                .listRowSeparator(.hidden)
            }
            
            Section {
                Toggle(isOn: .init(
                    get: { audioManager.isBgmEnabled },
                    set: { newValue in audioManager.isBgmEnabled = newValue }
                )) {
                    VStack(alignment: .leading, spacing: 4) {
                        Text("✦ 背景音樂 ✦").font(.title3).foregroundColor(.black)
                        Text(audioManager.isBgmEnabled ? "「正在播放」" : "「已關閉」")
                            .font(.footnote)
                            .foregroundColor(.gray)
                    }
                }
                .tint(.themePurple)
                
                VStack(alignment: .leading, spacing: 8) {
                    HStack {
                        Text("音量")
                            .font(.subheadline)
                            .foregroundColor(.primary)
                        Spacer()
                        Text("\(Int(audioManager.volume * 100))%")
                            .font(.caption)
                            .foregroundColor(.secondary)
                            .monospacedDigit()
                    }
                    Slider(
                        value: .init(
                            get: { Double(audioManager.volume) },
                            set: { audioManager.volume = Float($0) }
                        ),
                        in: 0.0...1.0
                    )
                    .tint(.themePurple)
                    .disabled(!audioManager.isBgmEnabled)
                    .opacity(audioManager.isBgmEnabled ? 1.0 : 0.5)
                    .accessibilityLabel("BGM 音量")
                }
                .padding(.top, 6)
            }
        }
        .listStyle(.insetGrouped)
        .navigationTitle("日誌")
    }
}

#Preview {
    let state = GameState()
    state.loveValue = 5
    state.rebelValue = 3
    state.despairValue = 1
    
    @State var showStats = true
    let audio = AudioManager()
    
    return SettingView(showStatsToggle: $showStats)
        .environment(state)
        .environmentObject(audio)
}
