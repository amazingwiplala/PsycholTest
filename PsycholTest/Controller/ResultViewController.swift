//
//  ResultViewController.swift
//  PsycholTest
//
//  Created by Jeanine Chuang on 2023/8/7.
//

import UIKit

class ResultViewController: UIViewController {

    var flowers:[String:Flower] = [String:Flower]()
    var answers:[Int] = [Int]()
    
    @IBOutlet weak var FlowerImageView: UIImageView!
    
    @IBOutlet weak var FlowerLabel: UILabel!
    
    @IBOutlet weak var DetailLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        initFlowers()
        initResultUI(calculateAnswers())
        
    }
    
    //繪製花朵性格說明
    func initResultUI(_ code:String){
        FlowerImageView.image = UIImage(named: code)
        FlowerLabel.text = flowers[code]?.name
        
        DetailLabel.text?.append("\n\n")
        let traits:[Trait] = flowers[code]?.traits ?? [Trait]()
        for trait in traits {
            DetailLabel.text?.append(trait.title + "\n" + trait.description + "\n\n")
        }
        
        //使用此style來設定lineSpacing
        //這裡要記得如果有設定文字的alignment，要再次設定，不然會回復到預設靠左
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineSpacing = 8
        paragraphStyle.alignment = .left
        
        //建立attributes及設定attributed.Key.paragraphStyle
        let attributes = NSAttributedString(string: DetailLabel.text!, attributes: [NSAttributedString.Key.paragraphStyle : paragraphStyle])
            //設定label的attributedText
        DetailLabel.attributedText = attributes
        
    }
    
    //計算測試結果
    func calculateAnswers() -> String{
        var sum:Int = 0
        for answer in answers {
            sum += answer
        }
        var code:String = ""
        switch sum {
            case 1..<21:
                code = "Daisy"
            case 21..<41:
                code = "Orchid"
            case 41..<61:
                code = "Rose"
            case 61..<81:
                code = "Tulip"
            case 81..<101:
                code = "SunFlower"
            default:
                code = ""
        }

        return code
    }
    
    //花型人格說明
    func initFlowers(){
        flowers = [
            
            "SunFlower":    //向日葵 100~81
            Flower(code: "SunFlower", name: "向日葵", summary: "陽光、希望、正向、友善、開朗",
              traits: [
                 Trait(title: "陽光和希望", description: "向日葵總是朝向太陽，這象徵著它們對陽光和希望的渴望。這種人格特質可能表現為對生活的積極態度和樂觀情緒，即使在困難時期也能保持前進的動力。"),
                 Trait(title: "正向和友善", description: "向日葵的明亮和友好的外觀可以反映出正向和友善的人格特質。擁有這種特質的人可能對他人感到開放和友好，並以積極的態度對待生活和人際關係。"),
                 Trait(title: "開朗和活潑", description: "向日葵的大而明亮的花朵可能象徵著開朗和活潑的性格。具有這種人格特質的人可能喜歡社交活動，並表現出活躍和充滿活力的態度。"),
                 Trait(title: "成長和進步", description: "向日葵的成長過程是快速且堅定的，這可能反映了對於成長和進步的渴望。這種人格特質可能表現為對於自我提升和學習的積極態度，並且不斷追求個人目標。"),
                 Trait(title: "分享和關懷", description: "向日葵在成長過程中常常吸引許多生物，這可能反映了它們能夠分享和關懷的人格特質。具有這種特質的人可能愿意與他人分享，並表現出對他人的關心和支持。"),
                 Trait(title: "適應能力", description: "向日葵能夠根據陽光的方向調整自己的生長方向，這顯示出它們的適應能力。這種人格特質可能表現為在不同的環境和情況下適應能力強，能夠迅速調整自己的行為和思維。")
                 ]),
            
            "Tulip":    //鬱金香 80~61
            Flower(code: "Tulip", name: "鬱金香", summary: "尊貴、宏偉、充滿活力、風采、希望",
              traits: [
                 Trait(title: "高貴和尊貴", description: "鬱金香的外表華麗且高貴，這反映了高貴和尊貴的人格特質。擁有這種特質的人可能表現出自信和自尊，並在舉止中展現出一種優雅的風采。"),
                 Trait(title: "充滿活力", description: "鬱金香的花瓣形狀和色彩鮮豔，這可能象徵著充滿活力和能量的人格特質。具有這種特質的人可能充滿生命力，對事物充滿熱情，並能夠在周圍散發出積極的能量。"),
                 Trait(title: "追求卓越", description: "鬱金香的花朵通常被認為具有高度的品質和價值，這可能反映了對卓越和優質的追求。這種人格特質可能表現為對自我提升和成長的渴望，並追求在各個領域取得優越的表現。"),
                 Trait(title: "謹慎和理性", description: "鬱金香的外表經過精心照料和培育，這可能反映了謹慎和理性的人格特質。擁有這種特質的人可能在做決定時非常謹慎，並倚重理性和深思熟慮。"),
                 Trait(title: "精緻和品味", description: "鬱金香的花瓣造型和色彩搭配都顯示出精緻和品味。這種人格特質可能表現為對藝術、文化和美的敏感性，並在生活中追求高品質和細緻。"),
                 Trait(title: "自信和堅強", description: "鬱金香的花朵在風雨中仍能保持挺立，這可能反映了自信和堅強的人格特質。具有這種特質的人可能在面對挑戰時能保持冷靜和堅定，並展現出內在的力量。")
                 ]),
            
            "Rose":  //玫瑰 60~41
            Flower(code: "Rose", name: "玫瑰", summary: "愛情、熱情、浪漫、美麗、敏感",
             traits: [
                Trait(title: "愛情和熱情", description: "玫瑰花代表著愛情的情感，它們象徵著激情和感情的深度。具有這種人格特質的人可能對愛情和人際關係非常熱衷，他們可能在感情上非常投入，並尋求深刻的連結。"),
                Trait(title: "浪漫和溫柔", description: "玫瑰花的美麗和芬芳常常與浪漫情懷聯繫在一起。具有這種人格特質的人可能對浪漫的事物和細節非常敏感，並可能展現出溫柔、體貼的態度。"),
                Trait(title: "敏感和細膩", description: "玫瑰花的花瓣細膩而脆弱，這也反映了敏感性和細膩性。擁有這種人格特質的人可能對周圍的情感和環境變化非常敏感，他們可能需要更多的時間來處理情緒和感受。"),
                Trait(title: "追求美好和藝術", description: "玫瑰花的外表美麗，這可能反映出追求美好事物和藝術的人格特質。有這種特質的人可能喜歡欣賞藝術、音樂、文學等，並且對美的細節和表現方式非常關注。"),
                Trait(title: "關愛他人", description: "玫瑰花在送贈時通常表達著對他人的關心和關愛。這種人格特質可能反映出具有同情心和照顧他人的意願，這些人可能是很好的朋友和伴侶。")
                ]),
           
            "Orchid":   //蘭花 40~21
            Flower(code: "Orchid", name: "蘭花", summary: "高雅、優雅、神秘、自信、典雅",
              traits: [
                 Trait(title: "高雅和優雅", description: "蘭花的外觀優雅且高貴，這反映了高雅和優雅的人格特質。擁有這種特質的人可能表現出高品味和尊貴，並在行為和舉止中展現出一種獨特的魅力。"),
                 Trait(title: "自信和自尊", description: "蘭花的優雅外表可能反映出自信和自尊的人格特質。具有這種特質的人可能對自己充滿信心，並有一種健康的自尊心，不容易受到外界評價的影響。"),
                 Trait(title: "神秘和內省", description: "蘭花的花瓣常常呈現出神秘的花紋，這可能象徵著內在的深度和內省的特質。擁有這種特質的人可能喜歡深入思考，並有一種神秘感，不容易將所有內心都展現給他人。"),
                 Trait(title: "典雅和品味", description: "蘭花被視為一種高品味的象徵，它們的外觀典雅而精緻。這種人格特質可能表現為對藝術、文化和美的敏感性，並在生活中追求高品質和精緻。"),
                 Trait(title: "獨立和自主", description: "蘭花生長在高處，需要一些特殊的環境條件，這可能反映出獨立和自主的人格特質。擁有這種特質的人可能喜歡自主和獨立思考，並追求獨立解決問題的能力。"),
                 Trait(title: "追求卓越", description: "蘭花在品種培育上有著極高的標準，這可能反映出對卓越和優質的追求。這種人格特質可能表現為對自我提升和成長的渴望，並追求在各個方面取得優越表現。")
                 ]),
            
            "Daisy":    //雛菊 20~1
            Flower(code: "Daisy", name: "雛菊", summary: "真誠、純潔、單純、堅強、耐心",
              traits: [
                 Trait(title: "真誠和純潔", description: "雛菊代表真誠和純潔的品質。這種人格特質可能表現為對誠實和純潔價值的重視，以及對偽裝和虛偽行為的不容忍。"),
                 Trait(title: "單純和純真", description: "雛菊的外觀簡單而純潔，這可能象徵著單純和純真的人格特質。擁有這種特質的人可能表現出率直的態度，並且相信善意和美好。"),
                 Trait(title: "堅強和耐心", description: "雛菊的花瓣可能看起來脆弱，但它們卻很堅韌，能夠在各種環境下生長。這種人格特質可能表現為堅持和耐心，即使在困難時期也能保持堅強的意志。"),
                 Trait(title: "保守和審慎", description: "雛菊的外表較為保守，這可能反映了審慎和謹慎的人格特質。具有這種特質的人可能喜歡傳統和穩定，並且選擇謹慎地行動。"),
                 Trait(title: "關愛和耐心", description: "雛菊的花瓣層層堆疊，這可能反映了關愛和耐心的人格特質。具有這種特質的人可能對他人感到關心，並願意投入時間和努力去照顧和支持他人。"),
                 Trait(title: "與自然連結", description: "雛菊是自然界的一部分，它們生長在草地和野花園中。這種人格特質可能表現為對自然的愛護和與環境的連結，以及對自然美麗的欣賞。")
                ])
             
        ]
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
