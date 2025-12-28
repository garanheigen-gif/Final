//
//  CreditsView.swift
//  story_test_2
//
//  Created by 114-1iosClassStudent03 on 2025/12/11.
//

// CreditsView.swift

import SwiftUI
import Kingfisher
import DotLottie

struct CreditsView: View {
    var onBackToTitle: () -> Void

    
    struct CharacterProfile: Identifiable {
        let id = UUID()
        let name: String
        let imageName: String
        let desc: String
    }
    
    let characters = [
        CharacterProfile(name: "?", imageName: "playerHead", desc: "。"),
        CharacterProfile(name: "?", imageName: "npcHead", desc: "。"),
    ]
    
    var body: some View {
        ZStack {
            Color.black.ignoresSafeArea()

            ScrollView {
                VStack(spacing: 30) {
                    
                    
                    Image(.design2)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 380, height: 380)
                        .clipShape(Circle())
                        .overlay(Circle().stroke(Color.gray, lineWidth: 1))
                    Text("感謝遊玩!")
                        .font(.largeTitle)
                        .fontWeight(.heavy)
                        .foregroundColor(.white)
                        .padding(.top, 50)
                    
                    Text("製作名單")
                        .font(.title2)
                        .foregroundColor(.gray)
                }
                    
                    VStack(spacing: 20) {
                        Divider().background(Color.gray).padding(.vertical)
                        Text("文本 / App開發 / 美術").foregroundColor(.white)
                        Text("Space Musical")
                            .font(.system(size: 30, weight: .heavy, design: .serif)).foregroundColor(.themePurple)
                        DotLottieAnimation(fileName: "sparkle icon", config: AnimationConfig(autoplay: true, loop: true)).view()
                            .frame(width: 120, height: 120)
                        Divider().background(Color.gray).padding(.vertical)

                        Text("無版權音樂作者").foregroundColor(.white)
                        Text("prod. nevrfall/massobeats")
                            .font(.system(size: 30, weight: .heavy, design: .serif)).foregroundColor(.themePurple)

                        
                        Divider().background(Color.gray).padding(.vertical)
                        
                        Text("Special Thanks").foregroundColor(.white)
                        Text("感謝ChatGPT和Gemini幫我Debug").foregroundColor(.gray)
                        

                    }
                
                    .padding()
                    
                    Divider().background(Color.gray)
                    
                    VStack(spacing: 20) {
                        Image(.MEEFUSTAND)
                            .resizable()
                            .scaledToFit()
                            .frame(width: 380, height: 380)
                            .clipShape(Circle())
                        Text("雜談區")
                            .font(.title2)
                            .foregroundColor(.white)
                            .padding(.top)
                        Text("""
    早安午安晚安我是為了期末作業已經通宵兩天的可悲大一小孩。
    
    我自從入坑了Fate、明日方舟這類優秀的多媒體作品之後，就一直想做些類似的東西，但我真的沒想過第一次實質意義上的開發視覺小說是用SwiftUI（我以為會是RPGmaker這類現成遊戲引擎之類的），總之這次算是用期末APP的名義圓夢了吧XD

    總之這大概就是一個蠻經典的黑深殘魔法少女世界觀小故事，有看過小圓/魔育的兄弟們應該會覺得這些設定挺有既視感的（雖然咪呼最後的設定比較接近那種傳統的惡魔契約模板XD）

    總文本量大約是九千字上下，然後因為我在寫文本的當下剛考完某哲學課期末考，受到了非常嚴重的精神損傷（？），所以後半段和每個章節的結尾小故事就明顯變得非常意義不明。（目前的後兩章甚至是給AI潤飾過的版本， 我剛開始打出來的東西基本上毫無可讀性哈哈）

    對說到這裡，每個章節後面都有一段小故事，故事內容其實是會根據當前的選項積分變化的，總共有十五篇，可以多刷幾次劇情探索看看，裡面有幾篇我自己覺得是真的寫得蠻好玩的。

    數值設定邏輯上我沒有做到很嚴謹，但大概可以歸類為：情感連結相關的選項會加共鳴數值、力量的使用那方面會增加逆行數值，消極不作為會增加陷落。

    然後最後第六章有三個大結局，基本上就是對應上面的數值總和（選最高的，同票出現時則是以共鳴>逆行>陷落判斷），我沒特別寫出那到底是好結局還是壞結局，因為我覺得嚴格來說最後都沒好到哪裡去w（ 真的要講的話，守墓人是Happy End，多謝款待是True end，銜尾蛇是 Normal End。）

    其實我原本的劇本跟現在的差異蠻大的，故事文本量更大更複雜（預估三萬個字左右吧？），大綱裡是有七個章節六個結局的。不過我前幾章寫到一半的時候就意識到自己不可能在學期末獨自做完這麼大的工作量（畢竟其他科目也有期末考要忙），所以就只能放棄原本的故事直接打掉重來了。

    好啦老實說其實也沒有省下多少時間，因為從遊戲引擎裡拔掉已經寫死的第七章比想像中的更困難，而且新版的劇情其實在demo完之後也全部翻修過一次，又花了我一整個禮拜，累死人了嗚呼。

    總之呢希望大家喜歡（？）我這個疑似吸多了寫出來的夢話，下台一鞠躬！

    （題外話，其實魔法少女們是有全身設計的，最初的草稿如下，不過我真的沒空畫完XD）
""")
                            .font(.default)
                            .foregroundColor(.gray)
                            .padding()
                        ScrollView(.horizontal, showsIndicators: false){
                            VStack(spacing: 10){
                                Image(.design)
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 700)
                            }
                        }
                    }

                    Spacer(minLength: 50)
                    
                    // --- 回到標題按鈕 ---
                    Button(action: onBackToTitle) {
                        HStack {
                            Image(systemName: "house.fill")
                            Text("回到標題畫面")
                        }
                        .font(.headline)
                        .foregroundColor(.black)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color.white)
                        .cornerRadius(25)
                        .padding(.horizontal, 50)
                    }
                    .padding(.bottom, 50)
                }
            }
        }
    }
#Preview {
    CreditsView(onBackToTitle: {})
}
