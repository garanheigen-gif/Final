//
//  GameData.swift
//  story_test_2
//
//  Created by 114-1iosClassStudent03 on 2025/11/28.
//

import Foundation
import SwiftUI

struct Message: Identifiable, Equatable {
    let id = UUID()
    let type: String
    let text: String
    let name: String?
    var shouldAnimate: Bool = true
    
    init(type: String, text: String, name: String? = nil, shouldAnimate: Bool = true) {
        self.type = type
        self.text = text
        self.name = name
        self.shouldAnimate = shouldAnimate
    }
}

struct GameData {
    // 第一章
    static let scenes1: [[Message]] = [
        [
            Message(type: "narration", text: "你，失憶的魔法使，穿梭於水泥叢林之中。"),
            Message(type: "player", text: "雖然現在依然什麼都記不起來⋯⋯"),
            Message(type: "player", text: "不過，還是得先履行咪呼我的職責！"),
            Message(type: "narration", text: "你經過了一片面積特別大的建築物，湊近一看，發現那是一棟醫院。"),
            Message(type: "player", text: "啊啊，這個充滿了絕望的地方⋯⋯"),
            Message(type: "player", text: "這裡肯定有需要「幸福」的人！"),
            Message(type: "narration", text: "你穿過一個病房的窗戶，看見了一個少女，她無力的癱在病床上，身上插滿了通往維生儀器的管子。"),
            Message(type: "alice", text: "（神啊，為什麼不回應我呢？）", name: "少女"),
            Message(type: "alice", text: "（為什麼要把我囚禁於如此痛苦的現實中呢？）", name: "少女"),
            Message(type: "narration", text: "看到這一切不幸的你，決定要將奇蹟贈予這名少女。"),
            Message(type: "player", text: "你好咪呼，我是魔法使咪呼，能透過實現人類的願望創造幸福喔！"),
            Message(type: "alice", text: "⋯⋯欸？", name: "少女"),
            Message(type: "alice", text: "亮閃閃的，漂浮在天上⋯⋯我已經死掉了嗎？", name: "少女"),
            Message(type: "player", text: "沒有喔咪呼。"),
            Message(type: "player", text: "我觀測到了你身上傳來強烈的絕望氣息，所以我就來拯救你了！"),
            Message(type: "alice", text: "咦？", name: "少女")
        ],
        [
            Message(type: "player", text: "總之，告訴我你的願望，並用你的名字和我簽訂契約，成為魔法少女吧！"),
            Message(type: "alice", text: "嗯⋯⋯", name: "少女"),
            Message(type: "alice", text: "我的名字是███", name: "少女"),
            Message(type: "alice", text: "我希望⋯⋯能活在一個真正幸福的世界裡。", name: "少女"),
            Message(type: "narration", text: "一束耀眼的金光綻放。"),
            Message(type: "narration", text: "一瞬間，從少女身上的病服換成了漂亮的洋裝，周圍從慘白的病房牆面變成了一片美麗的花田，維生機器的噪音變成了悅耳的蟲鳴鳥叫。"),
            Message(type: "narration", text: "她用不可思議的驚喜表情看著你。"),
            Message(type: "alice", text: "這⋯⋯", name: "少女"),
            Message(type: "alice", text: "這就是我夢想中的世界！", name: "少女"),
            Message(type: "alice", text: "咪呼⋯⋯謝謝你。", name: "少女"),
            Message(type: "narration", text: "記憶在此刻中斷。"),
            Message(type: "narration", text: "在你回過神時，你又回到了城市的夜空中。"),
            Message(type: "narration", text: "你遺忘了，後來你和少女經歷了什麼，建立起了多美好的羈絆，你在最後又是怎麼和少女道別的。"),
            Message(type: "player", text: "哎⋯⋯"),
            Message(type: "player", text: "只能希望她能在沒有我的時候，能繼續幸福的生活吧。"),
        ]
    ]
    
    static let choices1: [[(text: String, type: String)]] = [
        [
            ("只要是你想要的東西我都能變出來！", "love"),
            ("魔法能讓你擺脫一切痛苦喔！", "despair"),
            ("我能讓傷害你的付出代價！", "rebel")
        ]
    ]
    
    static let endings1 = [
        "love": """
            那天下午，我們決定數一數藍色玫瑰花到底有幾片花瓣。
            
            她很認真地數到了無限大，
            而我則數到了零。
            
            我們相視而笑，
            因為我們發現這兩個答案是一模一樣的。
            茶杯裡的紅茶，永遠維持著不會燙傷舌頭的溫度。
            """,
        "rebel": """
            少女提議說，我們來跟「重力」玩捉迷藏吧。
            
            於是她從雲端用力跳了下去。
            我故意不去接住她，
            結果她就這樣一直往天空的深處「墜落」了上去。
            
            我們大聲嘲笑著地面，
            一致認同「往下」是大人生產出來的無聊謊言。
            """,
        "despair": """
            
            我們花了一整天的時間，試圖捕捉「安靜」的聲音。
            
            她說那聽起來像是壞掉的電視機，
            我說那像是雪花落在死掉的鳥兒身上。
            
            為了聽得更清楚，
            我們捏住彼此的鼻子停止了呼吸，
            比賽誰能先把心跳停下來。
            """
    ]
    
    // 第二章
    static let scenes2: [[Message]] = [
        [
            Message(type: "narration", text: "去商場看看吧，不知道是從哪裡聽來的，但有人說過漂亮的櫥窗能激發人對於美好未來的想像。"),
            Message(type: "narration", text: "你在宜室百貨公司裡閑晃著，飄過電器、廚具和各式最新款的時裝。"),
            Message(type: "narration", text: "最終，你在家具區駐足。"),
            Message(type: "narration", text: "在那個夢幻一般的展示房間對面，同樣站著一名少女。"),
            Message(type: "narration", text: "少女身旁還圍繞著一群「家人」——埋怨的老者、嚎哭的小孩以及無力的大人。從那嘈雜的喧譁聲和寒酸的衣著可以看出，他們並不富裕。"),
            Message(type: "haru", text: "（好想要一個只屬於我的房間呢。）", name: "？？？"),
            Message(type: "narration", text: "少女渴望地凝視著那個精緻整潔的陳設。"),
            Message(type: "haru", text: "（好希望有一個，能真正的、自由自在地方呢。）", name: "？？？"),
            Message(type: "narration", text: "這次的願望非常簡單，你對自己充滿信心。"),
            Message(type: "player", text: "妳好！我是幸福的魔法使咪呼！"),
            Message(type: "player", text: "告訴我你的名字，與我簽訂契約成為魔法少女，就能用魔法來實現你的願望喔！"),
            Message(type: "haru", text: "⋯⋯我叫做小春。", name: "？？？"),
            Message(type: "narration", text: "很意外的，那個眼神空洞的少女並沒有對身邊突然出現的漂浮超自然生物感到驚訝。"),
            Message(type: "narration", text: "不過那晚，在你照著商場DM的設計原封不動地，在衣櫃中創造出她理想中小窩時，她真心的笑得合不攏嘴。"),
            Message(type: "narration", text: "而在之後的幾個禮拜，她的其餘願望的難度也不大。"),
            Message(type: "haru", text: "我想要舒服的床。", name: "小春"),
            Message(type: "haru", text: "我想要漂亮的衣服。", name: "小春"),
            Message(type: "haru", text: "我想要理想的██。", name: "小春"),
            Message(type: "narration", text: "你都一一照做了，但她的笑容似乎一直隨著時間變淡。"),
            Message(type: "haru", text: "為什麼，我已經擁有了那麼多，心裡卻越來越空虛呢？", name: "小春"),
            Message(type: "narration", text: "在衣櫃中，最終永不匱乏的妄想之庭裡，她這麼面無表情地提問。")
        ],
        [
            Message(type: "haru", text: "啊啊⋯⋯", name: "小春"),
            Message(type: "haru", text: "我好想離開這裡。", name: "小春"),
            Message(type: "player", text: "但你說你討厭外面⋯⋯"),
            Message(type: "haru", text: "對啊。", name: "小春"),
            Message(type: "haru", text: "我真是連我自己都搞太不懂了呢。", name: "小春"),
            Message(type: "narration", text: "記憶戛然而止。")
        ]
    ]
    
    static let choices2: [[(text: String, type: String)]] = [
        [
            ("嘛……咪呼會再努力的。", "love"),
            ("再想想咪呼！妳一定還有沒實現的願望吧！", "rebel"),
            ("咪呼也不知道呢……", "despair")
        ]
    ]
    
    static let endings2 = [
        "love": """
            某天下午，她向我討要了「一雙男性的皮鞋，尺寸要36號的」。
            
            理由是：「如果在玄關擺上這個，感覺就像是有誰在等我回家一樣。」
            
            我照做了。
            她小心翼翼地把那雙幻象皮鞋擺在衣櫃的角落，接著跪坐在旁邊盯著看了二十分鐘。
            
            最後她伸出手指，用力把左腳的那隻鞋推倒。
            「他在外面有女人了。」她說。「我們吃飯吧。」
            """,
        "rebel": """
            那是她第一次主動要求「一把左輪手槍」。
            
            理由是：「隔壁鄰居的小孩太吵了，我想讓他稍微安靜一點。」
            
            我將沈甸甸的鋼鐵幻象交給她。
            她熟練地轉動彈巢，將槍口抵住衣櫃的木板壁，那個方向正對著鄰居的客廳。
            
            她扣下板機。
            「啪。」
            只有像是在捏破氣泡紙一樣的可笑聲響。
            
            「啊，對喔。」她看著槍口冒出的彩色紙花。「我根本沒看過真的子彈長什麼樣子。」
            """,
        "despair": """
            深夜，她突然搖醒我，說想要「一扇窗戶」。
            
            理由是：「這裡面樟腦丸的味道太重了，我想要通風。」
            
            我在衣櫃的深處為她開了一扇落地窗。
            透過玻璃，看見的不是房間的牆壁，而是一片灰濛濛的大海。
            
            她把臉貼在玻璃上，卻沒有動手去開窗。
            
            「怎麼了？」我問。
            「那個浪的聲音，」她指著外面。「一直重複同樣的頻率，聽起來好像洗衣機。」
            「關掉吧，好吵。」
            """
    ]
    
    // 第三章
    static let scenes3: [[Message]] = [
        [
            Message(type: "narration", text: "今天的天氣很好。"),
            Message(type: "narration", text: "你飄浮在晴空下的公園中，孩子在樹下嬉笑著，年輕的情侶在一旁的步道上遛著他們的愛犬。"),
            Message(type: "narration", text: "真是美麗的景象呢，你不禁這麼想。"),
            Message(type: "narration", text: "雖然魔法使理論上並不是人類，似乎也不完全具備情感，但你仍不由自主地將當前的「狀態」定義為愉悅，面具下的嘴角上揚著。"),
            Message(type: "narration", text: "因為，最令你感到由衷喜悅的，是這個如同午後的暖陽一樣令人感到溫暖的孩子。"),
            Message(type: "yu", text: "嘿咻！", name: "？？？"),
            Message(type: "narration", text: "少女從少說兩公尺的樹上俐落地跳下，手上抓著一面風箏。"),
            Message(type: "narration", text: "『嗚、謝謝大姐姐！』一旁孩子破涕為笑。"),
            Message(type: "yu", text: "哈哈，路過順手幫忙而已，下次小心點喔。", name: "？？？"),
            Message(type: "narration", text: "少女笑著說。"),
            Message(type: "player", text: "小雨真的很樂於助人呢！"),
            Message(type: "yu", text: "嘿嘿……", name: "小雨"),
            Message(type: "player", text: "太好了，我們可以一起讓世界變幸福！"),
            Message(type: "narration", text: "比起前兩個令人感到擔心的孩子，你對於這次的契約者充滿希望。"),
            Message(type: "narration", text: "她健康強壯，唯一的願望只有幫助有需要的人。"),
            Message(type: "narration", text: "「我想成為像蜈蚣人一樣的英雄！」她說，於是你給予她能飛天遁地的無窮力量。"),
            Message(type: "player", text: "（就算我又失去了解除契約時的記憶⋯⋯小雨也會是一個不用擔心的、無比良善堅強孩子咪呼！）"),
            Message(type: "narration", text: "時空跳躍。"),
            Message(type: "narration", text: "在一片狼藉的廢墟，記憶中你所處的地點似乎經歷過一場恐怖的災難，塵埃和火星在空氣中飛舞。"),
            Message(type: "narration", text: "而那個少女依然站在你面前，再次露出的笑容。"),
            Message(type: "yu", text: "太好了⋯⋯房子裡面的人應該都逃出去了吧。", name: "小雨"),
            Message(type: "narration", text: "你只是沈默地看著她。"),
            Message(type: "narration", text: "少女的傷勢已經無法用遍體鱗傷來形容了，已經有一段鋼筋絕望地刺穿她的身體，但她仍支撐著那面瀕臨崩塌的牆面。"),
            Message(type: "yu", text: "吶、咪呼，我很棒對吧。", name: "小雨"),
            Message(type: "player", text: "⋯⋯"),
            Message(type: "yu", text: "我這次也有幫助了很多人，對吧！", name: "小雨"),
            Message(type: "yu", text: "你怎麼不回答我了呢，咪呼。", name: "小雨"),
            Message(type: "witch", text: "回 答 我 啊", name: "小雨")
        ],
        [
            Message(type: "narration", text: "記憶也就此停滯。在你回過神時，你又回到了城市的夜空中。"),
            Message(type: "narration", text: "你感受到一股惡寒從背後竄起。"),
            Message(type: "player", text: "（為什麼，每一次都是這樣⋯⋯）"),
            Message(type: "narration", text: "你的直覺告訴你，記憶斷片的時間似乎越來越接近契約終止的時間點。"),
            Message(type: "player", text: "（而每一次的最後，乎指向了最令人絕望的結果）")
        ]
    ]
    
    static let choices3: [[(text: String, type: String)]] = [
        [
            ("⋯⋯對啊，我們確實拯救了很多人的生命呢。", "love"),
            ("沒錯！這就是幸福魔法的真諦啊。", "rebel"),
            ("小雨，妳太努力了咪呼……", "despair")
        ]
    ]
    
    static let endings3 = [
        "love": """
            某個週末，我們窩在沙發上重看了一百遍《蜈蚣人》的電影版。
            
            看到主角為了保護城市而自爆時，小雨的眼睛閃閃發亮。
            「咪呼，果然英雄最後就是要像煙火一樣炸開才帥氣對吧？」
            
            看著她那副隨時準備去送死的熱切表情，
            我什麼話都沒說，
            只是抓起一把特大號的焦糖爆米花塞進她的嘴裡。
            
            「唔唔唔？」
            「⋯⋯吃就對了咪呼。」我說。
            你真想自爆的話我也攔不了，但至少不要選在在這個沒發生任何危機的平凡下午。
            """,
        "rebel": """
            早餐時間，小雨盯著那罐打不開的草莓果醬皺起眉頭。
            
            「交給我吧！」
            她自信滿滿地說，然後深吸一口氣，擺出了《蜈蚣人》中必殺技的架勢。
            
            『嘿咻！』
            
            伴隨著一聲巨響，我們不只失去了那罐果醬，還失去了餐桌、半面牆壁以及鄰居的安寧。
            
            「啊哈⋯⋯力量好像稍微用過頭了。」
            她看著沾滿果醬的廢墟，不好意思地吐了吐舌頭。
            而我看著手裡僅存的吐司，思考著等下小雨會被她爸媽罵成什麼鳥樣。
            """,
        "despair": """
            公園裡有個小男孩在哭，因為他心愛的玩具機器人摔斷了手。
            
            「別擔心！正義的夥伴來幫你修好！」
            小雨自信地接過那個脆弱的塑膠玩具。
            
            她擁有能粉碎鋼筋的握力，擁有能扛起大樓的臂力。
            但當她試圖小心翼翼地把那根比牙籤還細的塑膠接回去時，
            『啪擦』。
            玩具在她指尖化為了粉末。
            
            男孩哭得更大聲了。
            小雨慌張地捧著那些粉末，臉上的笑容逐漸僵硬。
"""
    ]
    
    // 第四章
    static let scenes4: [[Message]] = [
        [
            Message(type: "narration", text: "長話短說，你又拯救了一名少女。"),
            Message(type: "narration", text: "當時，你正在台北上空漫無目的的飄蕩著，然後看到了一名少女呆立在三角私立中學的頂樓。"),
            Message(type: "narration", text: "那是一所升學率很高的學校，而眾所皆知升學率和「意外致死」率是成正比的。"),
            Message(type: "narration", text: "而正當你這麼想著的時候，就看見她翻過頂樓邊的護欄。"),
            Message(type: "player", text: "等等！不要！"),
            Message(type: "narration", text: "你很確定那少女要做什麼傻事。")
        ],
        [
            Message(type: "player", text: "我是幸福的魔法使咪呼！"),
            Message(type: "narration", text: "你高呼道。"),
            Message(type: "player", text: "和咪呼簽訂契約，成為魔法少女吧！"),
            Message(type: "zhi", text: "⋯⋯魔法？", name: "準備尋短的少女"),
            Message(type: "zhi", text: "⋯⋯一定是我眼花了吧。", name: "準備尋短的少女"),
            Message(type: "player", text: "這是真的！咪呼能實現你的所有願望！咪呼的使命是讓人類變得幸福！"),
            Message(type: "narration", text: "空氣再次陷入寂靜。"),
            Message(type: "narration", text: "少女依然選擇閉上眼，往十層樓的高空邁去。"),
            Message(type: "zhi", text: "（什麼願望、人類什麼的。我已經不在乎了）", name: "準備尋短的少女"),
            Message(type: "player", text: "不可以咪呼！！！"),
            Message(type: "narration", text: "你用力扯住了少女的手臂，她半截身體已經懸在高空中。"),
            Message(type: "zhi", text: "放開我⋯⋯", name: "準備尋短的少女"),
            Message(type: "narration", text: "少女有氣無力的喊道，你總覺得這個場景有點似曾相識——。"),
            Message(type: "player", text: "（這是⋯⋯失去的記憶？）"),
            Message(type: "narration", text: "你陷入了記憶的旋渦。"),
            Message(type: "narration", text: "這是你第一次，在實質意義上的「記起」一份契約如何起始與終結。"),
            Message(type: "player", text: "不過咪呼，不是所有的真實都是幸福美好的就是了。"),
            Message(type: "narration", text: "你給予另一名少女看見「真相」的雙眼時，如此的警告過她。"),
            Message(type: "narration", text: "她叫真里。她的願望是："),
            Message(type: "mari", text: "我想看透所有的虛偽。", name: "真里"),
            Message(type: "narration", text: "一開始，真里很滿足。她用能力看穿了朋友的假意奉承，看穿了老師的偏袒，看穿了父母「為你好」背後的病態期望。"),
            Message(type: "narration", text: "然後她開始看穿更多。看穿新聞裡的隱瞞。看穿政治口號的空洞。看穿社會制度的不公。看穿笑容背後的算計。看穿愛情裡的不忠。看穿親情裡的捆綁。"),
            Message(type: "narration", text: "最後，她看穿了「你」。"),
            Message(type: "mari", text: "你不是什麼幸福魔法使，對吧。", name: "真里"),
            Message(type: "narration", text: "位於國立台北女中頂樓，真里突然說。"),
            Message(type: "narration", text: "當時的「你」愣了一下。"),
            Message(type: "player", text: "你在說什麼呢咪呼？我不是幫助你實現了願望——"),
            Message(type: "mari", text: "幫助？", name: "真里"),
            Message(type: "narration", text: "真里笑了。"),
            Message(type: "mari", text: "你意識不到，你開口的每一秒都在撒謊嗎？", name: "真里"),
            Message(type: "player", text: "咪呼不知道你在說什麼——"),
            Message(type: "mari", text: "我都看見了。", name: "真里"),
            Message(type: "mari", text: "真正的你。", name: "真里"),
            Message(type: "player", text: "怎麼會呢⋯⋯咪呼就是咪呼⋯⋯", name: "？？？"),
            Message(type: "narration", text: "「你」的語氣變了。那不是「咪呼」的聲音。那是某種怪物的聲音。"),
            Message(type: "mari", text: "不要再狡辯了。", name: "真里"),
            Message(type: "mari", text: "不止有我。你到底殘害了多少個像我這樣的女孩？", name: "真里"),
            Message(type: "mari", text: "你很清楚的促成了她們，看見不應該看見的東西、持有不應該擁有的力量、承擔不應該背負的代價，對吧？", name: "真里"),
            Message(type: "mari", text: "最後她們將面對什麼都無法改變的絕望，然後⋯⋯你會以不幸的靈魂為食。", name: "真里"),
            Message(type: "player", text: "不⋯⋯咪呼沒有做過這麼殘酷的事⋯⋯", name: "？？？"),
            Message(type: "mari", text: "對對對，你總說你忘記了每次忘記契約解除的經過，這都是騙人的對吧！", name: "真里"),
            Message(type: "player", text: "咪呼真的什麼都不記得啊⋯⋯但咪呼真的都希望讓他們能幸福啊", name: "？？？"),
            Message(type: "player", text: "⋯⋯可是有時候，就算給予無敵的魔法，也沒辦法改變最終陷入不幸的「必然」⋯⋯", name: "？？？"),
            Message(type: "player", text: "真里，你看起來好痛苦⋯⋯咪呼說過了，你可以不看這些東西的", name: "？？？"),
            Message(type: "mari", text: "我沒辦法不看啊！", name: "真里"),
            Message(type: "narration", text: "少女終於哭喊。"),
            Message(type: "mari", text: "我試過了你的所有餿主意，魔法卻依然沒辦法停止！", name: "真里"),
            Message(type: "mari", text: "每天一醒來腦中都充滿了陌生的惡念、嫉妒、仇恨和隱瞞", name: "真里"),
            Message(type: "narration", text: "她往樓頂的邊緣走去，那時的頂樓風很大。"),
            Message(type: "mari", text: "一直浸泡在人類的醜惡裡，我真的快瘋掉了⋯⋯", name: "真里"),
            Message(type: "player", text: "不要！", name: "？？？"),
            Message(type: "narration", text: "「你」用扭曲的聲音呼喊。"),
            Message(type: "player", text: "咪呼還是想幫助真里的！不要走！", name: "？？？"),
            Message(type: "mari", text: "恕我拒絕。", name: "真里"),
            Message(type: "narration", text: "她轉身，對「你」露出一個慘淡的笑容。"),
            Message(type: "mari", text: "我現在雖然確實不太想活了。", name: "真里"),
            Message(type: "mari", text: "但如果我不是死於魔法——你應該就什麼都得不到了。", name: "真里"),
            Message(type: "player", text: "真里，不要——", name: "？？？"),
            Message(type: "mari", text: "再見了，惡魔。", name: "真里"),
            Message(type: "narration", text: "她向後仰倒。「你」也飛出屋頂，卻沒有接住她。"),
            Message(type: "narration", text: "你覺得自己已經無法拯救那個不幸的「必然」——儘管你並沒有沒有嘗試過。"),
            Message(type: "narration", text: "那個源自於心底的聲音告訴你——"),
            Message(type: "player", text: "消失是之於不幸最好的解脫吧。", name: "？？？"),
            Message(type: "narration", text: "你並不明白如此恐怖的念頭是怎麼冒出來的，它就如同膝跳反應一樣的存在了。"),
            Message(type: "narration", text: "於是你聽到了撞擊聲，接著是令人窒息的死寂。"),
            Message(type: "narration", text: "「你」飄在空中，看著下面聚集的人群，看著血泊，看著那個再也不會睜開眼的少女。"),
            Message(type: "narration", text: "真里猜錯了，「你」仍然嘗到了痛苦靈魂的一絲鮮美。"),
            Message(type: "narration", text: "回憶在此刻戛然而止。")
        ]
    ]
    
    static let choices4: [[(text: String, type: String)]] = [
        [
            ("無論你經歷了什麼，我都是願意傾聽的！", "love"),
            ("是誰把你逼到這一步的！", "rebel"),
            ("先告訴我你想跳下去的理由吧！", "despair")
        ]
    ]
    
    static let endings4: [String: String] = [
        "love": """
                為了準備模擬法庭的社團活動，我們在家裡進行了一場「審判」。
                
                被告：魔法使咪呼。
                罪名：偷吃放在冰箱裡的限定版法式布丁。
                
                「我宣誓，我絕對沒有吃！」我信誓旦旦地舉起手，嘴角還沾著焦糖。
                
                真里推了推眼鏡，拿著原子筆當法槌。
                她的眼睛看見了「真相」——看見了我偷吃的過程，也看見了我其實是想試毒看有沒有壞掉（雖然是藉口）。
                
                她嘆了口氣，輕輕敲下筆桿。
                「雖然證據確鑿⋯⋯但考量到被告平日的辛勞，本庭宣判：緩刑，並處以『下樓買兩個布丁回來賠償』之刑罰。」
""",
        "rebel": """
                真里參加了全國高中生辯論大賽，題目是「善意的謊言是否存在」。
                
                對手是隔壁名校的冠軍，正口若懸河地引用各種社會學研究理論。
                真里只是安靜地看著他，然後開口：
                
                「對方辯友，既然你支持善意的謊言，那你為了贏得這場比賽，不惜在申論草稿中偽造那幾份根本不存在的社會調查數據，並宣稱那是為了『說服聽眾』的必要手段，這也算是善意嗎？」   
                
                全場譁然。
                
                無論如何，那天我們拿到了冠軍獎盃。
                但沒有幾個人願意過來跟我們握手道賀。
                """,
        "despair": """
                真里坐在圖書館裡，翻閱著一本關於「冤獄平反」的法律案例集。
                
                「咪呼，你看這個案子。」她指著書上一張被判無期徒刑的犯人照片。
                「書上說，經過十年纏訟，因為證據不足，法律最終還是認定他有罪。」
                
                「那真相是什麼？」我問。
                
                「我看見了。他是無辜的。」真里的手指在顫抖，「照片裡的他，靈魂是清白的。」
                
                她蓋上厚重的六法全書，眼神黯淡。
                「但我救不了他。在『法律』的世界裡，沒有證據的『真相』，就只是瘋子的囈語而已。」
                「⋯⋯原來，就算懂得法律也無法成為正義的夥伴嗎？」
                """
    ]
    
    // 第五章
    static let scenes5: [[Message]] = [
        [
            Message(type: "narration", text: "從高空墜落的風聲停止了。場景回到方才試圖輕生的少女那間單調乏味、沒有任何多餘裝飾的房間。窗戶開著，風吹動著窗簾。"),
            Message(type: "player", text: "⋯⋯為什麼？"),
            Message(type: "player", text: "明明只要活下去，總會遇到好事的。這是人類常說的話不是嗎？"),
            Message(type: "zhi", text: "咪呼，你不會覺得，存在本身就很沒有意義嗎？", name: "虛無的少女"),
            Message(type: "player", text: "意義？"),
            Message(type: "zhi", text: "對啊。每天早上醒來，刷牙洗臉，擠公車上學。", name: "虛無的少女"),
            Message(type: "zhi", text: "做著和所有人一模一樣的事情，迎合著社會的期待，拼盡全力努力讀書、工作。", name: "虛無的少女"),
            Message(type: "zhi", text: "只為了變成那個巨大社會集群中，一顆隨時可以被替換的小齒輪。", name: "虛無的少女"),
            Message(type: "zhi", text: "然後在某個不起眼的角落，默默地死掉。", name: "虛無的少女"),
            Message(type: "narration", text: "少女坐在床邊，語氣平淡得像是討談論等下要叫哪家外送，而不是自己方才的自殺未遂。"),
            Message(type: "zhi", text: "未來一眼就能看到頭了，不過如此而已。", name: "虛無的少女"),
            Message(type: "zhi", text: "為了這種一眼就能看穿的劇本，忍受幾十年的痛苦，這樣的存在真的有意義嗎？", name: "虛無的少女"),
            Message(type: "player", text: "所以你想死？"),
            Message(type: "zhi", text: "應該說，我覺得我應該在自己還沒麻木、還有能力思考「這有沒有意義」的時候去死。", name: "虛無的少女"),
            Message(type: "zhi", text: "等到我也變成那群麻木的大人時，我就連死的勇氣都沒有了吧。", name: "虛無的少女"),
            Message(type: "player", text: "⋯⋯呵。"),
            Message(type: "narration", text: "你發出了一聲乾笑。那不是咪呼會有的笑聲。"),
            Message(type: "player", text: "這讓我想起了一個人。"),
            Message(type: "player", text: "以前也有一個少女，她的想法和你完全相反，但最後殊途同歸。"),
            Message(type: "zhi", text: "相反？", name: "虛無的少女"),
            Message(type: "player", text: "她和你不同，她討厭「虛無」，她最恨的就是「不確定性」。"),
            Message(type: "narration", text: "回憶如潮水般湧現。你看見那個焦慮地咬著指甲的資優生。"),
            Message(type: "player", text: "「我想看見未來。」"),
            Message(type: "player", text: "那個無名少女曾這麼對我說。"),
            Message(type: "lin", text: "我受夠了這一切的不確定！受夠了大人說什麼「努力就會有收穫」的心靈雞湯！", name: "無名少女"),
            Message(type: "lin", text: "這個世界充滿了變數，我只想知道，如果我走上某條路，終點到底是什麼！只要能保證結果，我什麼代價都願意付！", name: "無名少女"),
            Message(type: "player", text: "於是，她和沒有感情的惡魔——也就是最初的我，簽下了契約。"),
            Message(type: "player", text: "惡魔賦予了她「未來視」，而她授權惡魔在自己的靈魂「死去」時，吃掉靈魂的殘骸。"),
            Message(type: "zhi", text: "聽起來很公平。", name: "虛無的少女"),
            Message(type: "player", text: "一開始是公平的。她最初只能看見幾個小時後的事。"),
            Message(type: "player", text: "但惡魔是貪婪的，它給予的饋贈總是伴隨著代價。"),
            Message(type: "player", text: "預知範圍開始失控地擴大。半天、一天、一個禮拜⋯⋯最後變成了一年、五年，直到生命的盡頭。"),
            Message(type: "player", text: "你知道的，人類的大腦並不是為了處理全知而設計的。"),
            Message(type: "player", text: "她能預見自己踏出的每一步、說的每一句話，將會牽動的所有時間線和可能性。"),
            Message(type: "player", text: "所有的未知都變成了既定的數據灌入腦海，時間流逝的每一分每一秒都在折磨著她幼小的心智。"),
            Message(type: "player", text: "在少女的最後一天，她已經接近六十小時沒睡了。"),
            Message(type: "player", text: "她臉色慘白、眼睛布滿血絲，癱坐在地圖和筆記堆中。"),
            Message(type: "lin", text: "我看見了⋯⋯我觀測到了最好的可能性。", name: "無名少女"),
            Message(type: "lin", text: "我看見我會考上合太醫科。看見我會成為學弟妹們的榜樣。看見爸媽終於認可了我。", name: "無名少女"),
            Message(type: "player", text: "當時的「我」笑著對她說：「那很好啊！這就是你想要的確定性吧？」"),
            Message(type: "lin", text: "然後我看見更多⋯⋯", name: "無名少女"),
            Message(type: "lin", text: "我看見我會在大六時死在醉月湖裡。看見我的葬禮上，我媽哭到昏厥。看見我弟從此之後發誓要超越我，要走我沒走完的路。", name: "無名少女"),
            Message(type: "player", text: "「我」試圖安慰她——或者說，試圖讓獵物保持鮮活——我說：「那只是可能性之一，未來可以改變——」"),
            Message(type: "lin", text: "閉嘴。", name: "無名少女"),
            Message(type: "lin", text: "不用用謊言安慰我了，我知道我的結局。", name: "無名少女"),
            Message(type: "lin", text: "這是所有未來的收束點：不管我怎麼掙扎，你都會確保我在十年內死透，並且吞食我的靈魂。", name: "無名少女"),
            Message(type: "player", text: "⋯⋯"),
            Message(type: "player", text: "被識破了。惡魔用最短時間將少女逼入絕境的詭計，其實也是她「未來」的一部分。"),
            Message(type: "lin", text: "我認輸了。", name: "無名少女"),
            Message(type: "narration", text: "最後，確定自己的結局無可改變的絕望少女，對著惡魔張開了雙臂。"),
            Message(type: "player", text: "她自願獻上了靈魂。"),
            Message(type: "player", text: "⋯⋯。"),
            Message(type: "zhi", text: "⋯⋯啊。", name: "虛無的少女"),
            Message(type: "zhi", text: "我喜歡這個結局。", name: "虛無的少女")
        ],
        [
            Message(type: "narration", text: "你們沈默了幾秒，曉芷只是聳了聳肩，示意你繼續說下去。"),
            Message(type: "player", text: "當然啦，故事還沒結束。"),
            Message(type: "player", text: "如果只是吃了她，那我也許現在還是一個快樂的、單純的捕食者。"),
            Message(type: "player", text: "但在那個少女死前，在她的靈魂被我從軀殼中拉出來的瞬間⋯⋯"),
            Message(type: "player", text: "那個能看見未來的女孩，貼在惡魔的耳邊低語了。"),
            Message(type: "lin", text: "惡魔啊⋯⋯我憐憫你。", name: "無名少女"),
            Message(type: "player", text: "憐憫？當時的我無法理解。"),
            Message(type: "lin", text: "每次捕食都要經受如此的孤獨，假裝著能同理人類、假裝能感受到那些複雜的情緒，卻什麼都不懂。", name: "無名少女"),
            Message(type: "witch", text: "因此在最後，我想要用我的靈魂來祝福你。", name: "無名少女"),
            Message(type: "witch", text: "我祝福你能夠真正的愛所有的契約者。", name: "無名少女"),
            Message(type: "witch", text: "我祝福你——能真心地為她們感到開心、為她們感到難過，真心地想為人類創造幸福。", name: "無名少女"),
            Message(type: "narration", text: "這就是「幸福的魔法使」誕生的瞬間。"),
            Message(type: "player", text: "她成功了。那個詛咒生效了。"),
            Message(type: "player", text: "我真的開始愛著人類，真心期望你們能得到幸福！"),
            Message(type: "player", text: "但我本屬於惡魔的能力，卻註定只能創造毀滅，註定只能以你們的靈魂為食。"),
            Message(type: "narration", text: "你看向身旁的少女。"),
            Message(type: "narration", text: "她以異常堅定的眼神回望著你，開口道："),
            Message(type: "zhi", text: "惡魔，我的名字是江曉芷。", name: "虛無的少女"),
            Message(type: "zhi", text: "我想與你簽訂契約。", name: "曉芷"),
        ]
    ]
    
    static let choices5: [[(text: String, type: String)]] = [
        [
            ("所謂的意義和確定性⋯⋯", "love"),
            ("你原來是這麼覺得的嗎⋯⋯", "rebel"),
            ("你也覺得⋯⋯", "despair")
        ]
    ]
    
    static let endings5: [String: String] = [
        "love": """
                我們約定好要飼養一頭名為永恆的怪物。                      
                我們哪裡也不去，就在這裡等到時間腐爛為止。
                
                永遠，永遠的在一起。
                ——拜託你了。
                """,
        "rebel": """
                我們試著把萬物放在天秤的左邊，把虛無放在右邊。
                結果天秤紋絲不動。
                
                於是我們交換了名字，交換了皮膚，交換了手中的餐具。
                你看，現在我不餓了。
                而之於你呢，世界就像是一塊巨大的、等待被切開的鮮奶油蛋糕。
                """,
        "despair": """
                時鐘敲響了第十三下。
                昨天死去的金魚，正快樂地在乾燥的空氣中游泳。
                
                你問我出口在哪裡？別傻了！
                我是咬住自己尾巴的蛇，我是阿爾法也是歐米茄。
                
                晚安，
                然後，早安。
                """
    ]
    
    // 第六章（分歧）
    static let ending6_love: [[Message]] = [
        [
            Message(type: "zhi", text: "我想到了一個方法。", name: "曉芷"),
            Message(type: "zhi", text: "既不用讓你去傷害別人，又能賦予我的生命「意義」的方法。", name: "曉芷"),
            Message(type: "player", text: "什麼方法？"),
            Message(type: "narration", text: "曉芷伸出手，主動觸碰了你。"),
            Message(type: "zhi", text: "我要成為魔法少女，但我不會許下任何願望。", name: "曉芷"),
            Message(type: "player", text: "⋯⋯欸？"),
            Message(type: "player", text: "如果不許願，契約就無法完成，我就無法收取你的靈魂，但我必須維持契約的存在，這會持續消耗我的魔力⋯⋯"),
            Message(type: "player", text: "如果一直這樣下去，我會被徹底消耗殆盡？"),
            Message(type: "zhi", text: "對。", name: "曉芷"),
            Message(type: "zhi", text: "這就是我的計畫。", name: "曉芷"),
            Message(type: "narration", text: "少女露出了你從未見過的、發自內心的笑容。那是一種發現了新玩具的孩子般的笑容。"),
            Message(type: "zhi", text: "我會一直把你帶在身邊，但我永遠不會許願。", name: "曉芷"),
            Message(type: "zhi", text: "我會看著你一天比一天虛弱，看著你從強大的惡魔變成連一隻螞蟻都殺不死的廢物。", name: "曉芷"),
            Message(type: "zhi", text: "只要我還活著的一天，就是對你這個「幸福魔法使」最大的折磨。", name: "曉芷"),
            Message(type: "zhi", text: "這聽起來，不是比隨便找個工作然後死掉，還要有趣得多了！", name: "曉芷"),
            Message(type: "player", text: "⋯⋯哈。"),
            Message(type: "player", text: "⋯⋯你真是瘋了呢咪呼。"),
            Message(type: "player", text: "好吧。這或許是我配得上的結局。")
        ]
    ]
    
    static let ending6_rebel: [[Message]] = [
        [
            Message(type: "zhi", text: "聽完你的故事，我明白了一件事。", name: "曉芷"),
            Message(type: "zhi", text: "你痛苦，是因為你太軟弱了。", name: "曉芷"),
            Message(type: "player", text: "軟弱？"),
            Message(type: "zhi", text: "你有著吞噬無數靈魂的胃口，卻始終裝著一顆聖人的心，無論是先前的偽裝的惡魔、亦或者是被那個祝福所控制。", name: "曉芷"),
            Message(type: "zhi", text: "為什麼想吃掉一個人的靈魂、想讓人免於不幸，還會需要契約、魔法什麼的繁瑣步驟？你不透過人類就沒辦法施法是嗎？", name: "曉芷"),
            Message(type: "zhi", text: "這不是就只是張口和吞嚥的事情嗎？", name: "曉芷"),
            Message(type: "zhi", text: "咪呼，我要許願。", name: "曉芷"),
            Message(type: "witch", text: "我不需要你來實現願望，我要成為你。", name: "曉芷"),
            Message(type: "player", text: "妳在說什麼，住手！妳的精神力承受不住的！"),
            Message(type: "narration", text: "你想阻止少女瘋狂的念頭，但已經來不及了。"),
            Message(type: "narration", text: "你觀測到了，那個少女的靈魂，如同黑洞一般的膨脹著，吞沒了你。"),
            Message(type: "witch", text: "把你的力量、你的詛咒、你的飢餓全部給我。", name: "曉芷"),
            Message(type: "witch", text: "我來幫你承擔那份罪惡感。因為對我來說——這一切都沒有意義啊。", name: "曉芷"),
            Message(type: "player", text: "——！！！"),
            Message(type: "narration", text: "屋子裡的光線被吞噬殆盡。站在原地的不再是曉芷，也不再是你。"),
            Message(type: "narration", text: "那是一名穿著漆黑禮服的怪物，她張開了嘴喙。"),
            Message(type: "witch", text: "「我開動了。」", name: "惡食的魔女")
        ]
    ]
    
    static let ending6_despair: [[Message]] = [
        [
            Message(type: "zhi", text: "⋯⋯太累了。", name: "曉芷"),
            Message(type: "zhi", text: "聽完你的故事，我覺得更累了。", name: "曉芷"),
            Message(type: "player", text: "曉芷？"),
            Message(type: "zhi", text: "抵抗有什麼意義？救贖有什麼意義？", name: "曉芷"),
            Message(type: "zhi", text: "反正不管哪個未來，最後都會導向痛苦。那個祝福你的魔女是對的，確定性才是唯一的安寧。", name: "曉芷"),
            Message(type: "narration", text: "曉芷張開雙臂。"),
            Message(type: "zhi", text: "咪呼，我不想努力了。", name: "曉芷"),
            Message(type: "zhi", text: "我許願。", name: "曉芷"),
            Message(type: "zhi", text: "「請讓我從這個無聊的世界上消失，去一個永遠幸福的夢裡吧。」", name: "曉芷"),
            Message(type: "narration", text: "那天晚上，曉芷確實做了一個很長的夢。"),
            Message(type: "narration", text: "她看見了另一名自稱為「夢境的魔女」少女。"),
            Message(type: "alice", text: "我們來聊聊「人類」這個概念。", name: "夢境的魔女"),
            Message(type: "narration", text: "夢境的魔女笑著說。"),
            Message(type: "alice", text: "他們啊，總是活在層層疊疊的虛構裡：金錢是虛構，國家是虛構，道德是虛構，連「自我的意義」都沒有幾個人真正了解。", name: "夢境的魔女"),
            Message(type: "alice", text: "而你是一個明智的人——你給自己寫了一個好的結局。", name: "夢境的魔女"),
            Message(type: "zhi", text: "⋯⋯好結局？", name: "曉芷"),
            Message(type: "narration", text: "夢境的魔女站起來，走到曉芷面前，蹲下，仰頭看著她。"),
            Message(type: "alice", text: "歡迎來到我們的世界。", name: "夢境的魔女")
        ]
    ]
    
    static let ending6_normal: [[Message]] = [
        [
            Message(type: "narration", text: "Test"),
        ]
    ]
    
    static let endings6: [String: String] = [
        "love": """
                這是一場漫長的謀殺。
                一名少女用她的餘生作為牢籠，囚禁了想要給予她幸福的惡魔。
                
                沒有魔法，沒有奇蹟，只有日復一日、依然平庸至極的人生。
                
                「你看，你今天又比昨天更透明了一點呢。」
                她溫柔地對著懷裡那個連說話力氣都沒有的白色團塊說道。
                
                """,
        "rebel": """
                惡魔消失了，取而代之的是更加貪婪的『虛空』。
                                
                新生的魔女不會感到痛苦，也不感到罪惡，更沒有什麼契約、魔法之類的無聊餐桌禮儀。
                它只想要進食，用那些毫無意義的人類來填滿它深不見底的空洞身軀。
                從某個時間點起，城市裡的失蹤人數開始緩慢的增加，沒有人知道原因。
                """,
        "despair": """
                太陽照常升起，人們照常歡笑。
                
                那個白色的魔法使再次飄浮在台北的高空，尋找著下一個眼神死寂的少女。
                它的笑容完美無缺，它的記憶一片空白。
                
                它並不記得自己曾經愛過誰，也不記得自己曾經為誰哭泣過。
                
                它只知道一件事：
                它很飢餓。
                因為它真的、真的，希望能讓人類獲得「幸福」。
                """
    ]
    
    static let reactionDialogues: [Int: [String: [Message]]] = [
        1: [
            "love": [
                Message(type: "alice", text: "可是，我需要並不是什麼東西而已⋯⋯", name: "少女"),
                Message(type: "player", text: "告訴我你的願望吧，我都能幫你實現！")
            ],
            "despair": [
                Message(type: "alice", text: "真的嗎？", name: "少女"),
                Message(type: "player", text: "真的喔！畢竟我可是幸福的魔法使啊。")
            ],
            "rebel": [
                Message(type: "alice", text: "這個嗎⋯⋯", name: "少女"),
                Message(type: "player", text: "總之，我什麼都做得到就對了！")
            ]
        ],
        2: [
            "love": [
                Message(type: "haru", text: "真的嗎⋯⋯", name: "小春"),
                Message(type: "haru", text: "你不是說，你一定能帶來幸福的嗎。", name: "小春")
            ],
            "rebel": [
                Message(type: "haru", text: "我想不到⋯⋯我想要的東西，明明都在這裡了", name: "小春"),
                Message(type: "haru", text: "明明，我已經什麼都不需要了啊，為什麼心裡的大洞都還是沒有填滿呢。", name: "小春")
            ],
            "despair": [
                Message(type: "haru", text: "連你也不知道了嗎。", name: "小春"),
                Message(type: "haru", text: "明明我什麼都有了，怎麼還是感覺不到幸福呢？", name: "小春")
            ]
        ],
        3: [
            "love": [
                Message(type: "yu", text: "這樣才對⋯⋯", name: "小雨"),
                Message(type: "narration", text: "少女嗆一口混濁的血液，崩壞的建築物開始降下了如同冰雹一樣的碎石塊， 向那名小「英雄」發起最後的挑戰。"),
                Message(type: "yu", text: "蜈蚣人說過⋯⋯在變得強大的同時，就必須扛起相應的責任⋯⋯", name: "小雨"),
                Message(type: "narration", text: "你沈默地看著少女——你發現自己的魔法無法治癒注定消亡的生命。"),
                Message(type: "narration", text: "你最終開口。"),
                Message(type: "player", text: "小雨，你很棒，你是咪呼見過⋯⋯最好的孩子。")
            ],
            "rebel": [
                Message(type: "yu", text: "⋯⋯呼。", name: "小雨"),
                Message(type: "narration", text: "少女釋然的笑了，但她已然無法支撐斷壁的重量，單薄的肉身開始顫抖。"),
                Message(type: "yu", text: "我真的成為了⋯⋯配得上使用奇蹟的「英雄」", name: "小雨"),
                Message(type: "yu", text: "我真的好幸福。", name: "小雨"),
                Message(type: "narration", text: "正當她的力量瀕臨耗盡時，少女看見了一道耀眼的輝光。"),
                Message(type: "narration", text: "碎石塊浮起、煙塵散去、傷口癒合——陽光再次照耀美麗的大地。"),
                Message(type: "player", text: "不要懷疑了，你一直以來都是咪呼認可的英雄⋯⋯"),
                Message(type: "narration", text: "少女沒有回答，最終微笑著閉上了眼睛。")
            ],
            "despair": [
                Message(type: "yu", text: "⋯⋯我還有做得更好的空間嗎？", name: "小雨"),
                Message(type: "narration", text: "少女看起來非常痛苦，混濁的血液沿著她的嘴角滴落。"),
                Message(type: "yu", text: "回應我，魔法使。我只想知道我是不是真的配得上這奇蹟⋯⋯", name: "小雨"),
                Message(type: "narration", text: "你不知道該如何回應那個已然燃盡生命，卻靠著魔法撐到了現在的⋯⋯活屍。"),
                Message(type: "player", text: "其實你就是奇蹟本身啊⋯⋯小雨。")
            ]
        ],
        4: [
            "love": [
                Message(type: "zhi", text: "啊⋯⋯？", name: "準備尋短的少女"),
                Message(type: "narration", text: "少女遲疑地轉過頭。")
            ],
            "rebel": [
                Message(type: "zhi", text: "哎⋯⋯。", name: "準備尋短的少女"),
                Message(type: "narration", text: "少女沒有回頭。")
            ],
            "despair": [
                Message(type: "zhi", text: "⋯⋯。", name: "準備尋短的少女"),
                Message(type: "narration", text: "少女轉過頭，神情木然。"),
                Message(type: "zhi", text: "什麼東西。", name: "準備尋短的少女")
            ]
        ],
        5: [
            "love": [
                Message(type: "player", text: "確實是痛苦靈魂的絕佳調味呢。")
            ],
            "rebel": [
                Message(type: "player", text: "我覺得你挺有當惡魔的潛能的，可惜你是個人類。")
            ],
            "despair": [
                Message(type: "player", text: "這是一種解脫嗎？")
            ]
        ],
    ]
}

#Preview {
    MainView()
        .environmentObject(AudioManager())
}
