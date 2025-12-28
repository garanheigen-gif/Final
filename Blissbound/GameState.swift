//
//  GameState.swift
//  story_test_2
//
//  Created by 114-1iosClassStudent03 on 2025/12/2.
//

import SwiftUI

// 結構定義：用於日誌列表中的單一項目
struct ChapterLog: Identifiable, Equatable {
    let id = UUID()
    let chapterNumber: Int // 新增章節編號，方便操作
    let title: String
    let description: String
    var isCompleted: Bool = false // 預設為 false
}

@Observable class GameState {
    // 章節與解鎖資訊
    var currentChapter: Int = 1
    // maxChapterCompleted 追蹤玩家成功完成的最高章節，用於圖鑑解鎖
    var maxChapterCompleted: Int = 0
    
    // 屬性分數與選擇狀態
    var loveValue: Int = 0
    var rebelValue: Int = 0
    var despairValue: Int = 0
    var lastChoiceType: String = ""
    var lockedEndingType: String? = nil
    
    // 對話與場景進度 (必須有預設值)
    var currentSceneIndex: Int = 0
    var currentDialogueIndex: Int = 0
    var dialogueHistory: [Message] = []
    
    //  日誌列表：包含所有章節的預設資料
    var chapterLogs: [ChapterLog] = [
        ChapterLog(chapterNumber: 1, title: "關於夢境", description: "魔法使為病榻上的少女編織了永恆的幻夢， 而在那美麗的夢境盡頭，是「██」。"),
        ChapterLog(chapterNumber: 2, title: "關於匱乏", description: "貧困的少女在衣櫃中築起了完美的物質堡壘， 卻發現填滿空間的幻象，無法填補內心巨大的空洞。"),
        ChapterLog(chapterNumber: 3, title: "關於力量", description: "渴望助人的少女獲得了無堅不摧的力量， 最終在自我犧牲的狂熱中，將自己獻祭。"),
        ChapterLog(chapterNumber: 4, title: "關於真實", description: "少女許願看穿世間一切謊言與虛偽， 卻因此直視了魔法使其實是惡魔的本質，選擇了以死抵抗。"),
        ChapterLog(chapterNumber: 5, title: "關於愛", description: "揭開了那份源自於過去、 由預知未來的魔女所留下的，名為「愛」的惡毒詛咒。"),
        ChapterLog(chapterNumber: 6, title: "關於必然", description: "這是你所期待的結局。"),
    ]
    
    var completedChapterLogs: [ChapterLog] {
        return chapterLogs.filter { $0.isCompleted }
    }
    
    func reset() {
        currentChapter = 1
        maxChapterCompleted = 0
        
        loveValue = 0
        rebelValue = 0
        despairValue = 0
        lastChoiceType = ""
        lockedEndingType = nil
        
        currentSceneIndex = 0
        currentDialogueIndex = 0
        dialogueHistory.removeAll()
        
        for idx in chapterLogs.indices {
            chapterLogs[idx].isCompleted = false
        }
    }
}
