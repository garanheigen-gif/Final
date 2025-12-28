//
//  DexVeiw.swift
//  story_test_2
//
//  Created by 114-1iosClassStudent03 on 2025/11/30.
//


import SwiftUI

struct Evidence: Identifiable {
    let id = UUID()
    let imageName: String
    let description: String
    let rotation: Double
    let relativePosition: CGPoint
    let chapterIndex: Int
}

struct EvidenceBoardView: View {
    @Environment(GameState.self) private var gameState
    @State private var selectedEvidence: Evidence? = nil
    @AppStorage("show_hints_toggle") private var showHints: Bool = true

        let evidences: [Evidence] = [
            Evidence(imageName: "1", description:"""
#0042 
契約時間2008年，名字是███。
生日：12月27日
身高/體重：155cm / 35kg
興趣：觀察病房窗外的雲和小鳥 
喜歡吃的東西：不是流質食物就行

她的願望是希望人能活在真正幸福的世界裡。
於是你給予自由支配夢境的魔法，能在自己和其他人的夢裡自由活動。
她能在潛意識的國度裡獲得永生，但你卻也再也找不到她了。
""",
                     rotation: -8, relativePosition: CGPoint(x: 0.75, y: 0.25), chapterIndex: 1),
            
            Evidence(imageName: "2", description: """
#0077
契約時間是2009年，名字是楊春華。
生日：4月7日 
身高/體重：150cm / 41kg
興趣：翻閱百貨公司的DM、收集漂亮的鈕扣 
喜歡吃的東西：美食探店節目上的高級西餐（雖然沒真正吃過就是了），真的要說的話大概是超商打烊前的特價便當

她的願望是滿足自己所匱乏的事物，
於是你給予了她能滿足一切物質願望的魔法，
她能在衣櫃裡創造近乎完美的幻象，甚至能變出不存在的東西。
不過你記得，滿足的快樂總是越來越短暫。
""",
                     rotation: 5, relativePosition: CGPoint(x: 0.40, y: 0.16), chapterIndex: 2),
            
            Evidence(imageName: "3", description: """
#0104
契約時間是2011年，其名為黃雨晴。
生日： 8月14日
身高/體重：161cm / 58kg
興趣：無限重刷特攝英雄片《蜈蚣人》 
喜歡吃的東西：沒有明確的愛好，只知道她是少數完全不挑食的小孩

她的願望是以自己的力量保護人。
於是你給予了她純粹的力量，只要有施力點能輕鬆改變任何東西的物理狀態。
可惜，她深信那套從超英電影裡學來的道理，（而你在意外發生時也是這麼認為的）：
「你在得到的力量的同時，就必須扛起相應的責任。」
你最終無法阻止她毅然決然的奔向毀滅。
""",
                     rotation: 7, relativePosition: CGPoint(x: 0.62, y: 0.45), chapterIndex: 3),
            
            Evidence(imageName: "4", description: """
#0128
契約時間是2015年，其名為李真里。
生日：9月25日
身高/體重：159cm / 49kg
興趣：參與社團活動 
喜歡吃的東西：法式鮮奶油布丁

她是個嚮往正義的少女，也是一名優秀的學生。
她因為想成為公正無私的法官、成為正義的夥伴，許下了知曉一切的真相的願望。
於是你給予她看破一切的魔法，無論是謊言，或者是隱匿的事物。
不過，最終她連你的自己都看不見的那一面也揭穿了。
她到死前都還不明埋妳為什麼能把那裝無辜的眼神演得這麼好⋯⋯事實上，你自始至終都沒有演過戲，你真的不知道自己曾經幹了什麼好事。

""",
                     rotation: -6, relativePosition: CGPoint(x: 0.39, y: 0.75), chapterIndex: 4),
            
            Evidence(imageName: "5", description: """
#XXXX 
契約時間是2005年，其名為林亮瑩。
生日：7月7日
身高/體重：160cm / 45kg
興趣：不存在的。
喜歡吃的東西：來一客海鮮口味泡麵

她一名正值大學聯考前的學生：應該是說，為了那所心目中的第一志願，已經重考了三年的可憐人。
她的願望是消除對未知的迷茫和不確定性，於是惡魔讓她能預知自己的未來：
觀測時空和世界線的魔法是最難以捉摸的，她肯定不出多久後就瘋了。
惡魔這麼不懷好意的忖度，這個少女肯定能在最短的時間內孕育出最混亂的靈魂。
而那少女不久後，也確實在近乎無限種的可能中歸納出了唯一的結局——
「我只有被眼前惡魔吃掉的未來。」
並且陷入絕望。

但，惡魔沒預想到的是，
少女用最後一絲理智，夾雜著對於惡魔的憐憫編寫了一個祝福＝詛咒：
我要讓你『愛』往後的所有契約者。你會窮盡一切來守護她們的願望，卻依然親眼看著理想被現實世界的『必然』扭曲、撕碎，並於最後，痛苦地捕食她們已然被魔法扭曲的靈魂。
我要讓你遺忘自己的本質，你會為自己對於苦難的飢渴感到羞愧。
惡魔啊，我要你也嚐嚐自己的絕望。

最終，惡魔在吞噬了那少女的最後一縷靈魂後，繼續了它的旅途。
而如同詛咒所說的，它總是會「愛」上所有的契約者們，卻無法克制那必須捕食的生存本能。
在每一次撕開少女們的靈魂時無止盡的感到後悔和反胃，
最終，擁有感情的惡魔無法承認自己的「惡」，並且陷入瘋狂。

為了活下去，它遺忘自己的暴行。
它變成只能感知到美好的：
幸福的魔法使。
""",
                     rotation: -10, relativePosition: CGPoint(x: 0.28, y: 0.40), chapterIndex: 5),
            
            Evidence(imageName: "6", description: """
#0301
契約時間是2025年。
""",
                     rotation: 3, relativePosition: CGPoint(x: 0.68, y: 0.65), chapterIndex: 6)
        ]
    
    let connections: [(Int, Int)] = [
        (0, 4), (4, 5), (5, 3), (3, 2), (2, 1)
    ]
    
    var body: some View {
            GeometryReader { geometry in
                ZStack {
                    DotGridBackground()
                    Image("boardTexture")
                        .resizable()
                        .scaledToFill()
                        .ignoresSafeArea()
                    
                    LineLayer(evidences: evidences, connections: connections, size: geometry.size)
                    
                    ForEach(evidences) { evidence in
                        let actualX = evidence.relativePosition.x * geometry.size.width
                        let actualY = evidence.relativePosition.y * geometry.size.height
                        
                        EvidenceImage(evidence: evidence,
                                      isUnlocked: evidence.chapterIndex <= gameState.maxChapterCompleted)
                            .position(x: actualX, y: actualY)
                            .onTapGesture {
                                if evidence.chapterIndex <= gameState.maxChapterCompleted {
                                    selectedEvidence = evidence
                                }
                            }
                    }
                }
            }
            .sheet(item: $selectedEvidence) { evidence in
                EvidenceDetailView(evidence: evidence)
            }
        }
    }
struct LineLayer: View {
    let evidences: [Evidence]
    let connections: [(Int, Int)]
    let size: CGSize
    
    var body: some View {
        Canvas { context, _ in 
            for (fromIndex, toIndex) in connections {
                guard evidences.indices.contains(fromIndex),
                      evidences.indices.contains(toIndex) else { continue }
                
                let start = evidences[fromIndex].relativePosition
                let p1 = CGPoint(x: start.x * size.width, y: start.y * size.height)
                
                let end = evidences[toIndex].relativePosition
                let p2 = CGPoint(x: end.x * size.width, y: end.y * size.height)
                
                var path = Path()
                path.move(to: p1)
                path.addLine(to: p2)
                
                context.stroke(path, with: .color(.red), lineWidth: 3)
            }
        }
        .ignoresSafeArea()
    }
}
struct EvidenceImage: View {
    let evidence: Evidence
    let isUnlocked: Bool
    
    var body: some View {
        ZStack {
            if isUnlocked {
                Image(evidence.imageName)
                    .resizable()
                    .scaledToFill()
                    .frame(width: 130, height: 130)
                    .clipShape(RoundedRectangle(cornerRadius: 10))
                    .rotationEffect(.degrees(evidence.rotation))
                    .shadow(radius: 6)
            } else {
                RoundedRectangle(cornerRadius: 10)
                    .fill(Color.gray.opacity(0.5))
                    .frame(width: 130, height: 130)
                    .rotationEffect(.degrees(evidence.rotation))
                    .shadow(color: .gray, radius:  6)
                
                VStack {
                    Image(systemName: "lock.fill")
                        .font(.largeTitle)
                        .foregroundColor(.white)
                    Text("尚未探尋的記憶")
                        .font(.caption)
                        .foregroundColor(.white)
                        .multilineTextAlignment(.center)
                        .padding(.top, 5)
                }
            }
        }
        .overlay(
            Image(systemName: "pin.fill")
                .foregroundColor(isUnlocked ? .red : .themePurple)
                .offset(y: -75)
        )
    }
}

struct EvidenceDetailView: View {
    let evidence: Evidence
    
    var body: some View {
        NavigationView {
            ScrollView(.vertical, showsIndicators: false) {
                VStack(spacing: 20) {
                    Text("第 \(evidence.chapterIndex) 個記憶")
                        .font(.title)
                        .fontWeight(.bold)
                    
                    Image(evidence.imageName)
                        .resizable()
                        .scaledToFit()
                        .frame(maxHeight: 350)
                        .clipShape(RoundedRectangle(cornerRadius: 15))
                        .shadow(radius: 10)
                    
                    Text(evidence.description)
                        .font(.body)
                        .padding()
                    
                    Spacer()
                }
            }

            .padding()
        }
    }
}

#Preview {
    let state = GameState()
    state.maxChapterCompleted = 5
    return EvidenceBoardView()
        .environment(state)
}
