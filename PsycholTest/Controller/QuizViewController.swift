//
//  QuizViewController.swift
//  PsycholTest
//
//  Created by Jeanine Chuang on 2023/8/7.
//

import UIKit
import GameplayKit

class QuizViewController: UIViewController {

    var answers:[Int] = [Int]()
    var quizs:[Quiz] = [Quiz]()
    var indexQuiz:Int = 0
    let UnSelectedColor = UIColor.white
    let SelectedColor = UIColor.cyan
    
    @IBOutlet weak var QuestionLabel: UILabel!
    @IBOutlet var OptionButtons: [UIButton]!
    @IBOutlet weak var NextButton: UIButton!
    @IBOutlet weak var FlowerImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        initBackground() //設定背景圖片
        initQuizs()      //產生所有題目與選項
        initQuizUI()     //繪製單一題目畫面
    }
    
    //選項按鈕
    @IBAction func answer(_ sender: UIButton) {
        for button in OptionButtons {
            if button==sender {
                answers.append(sender.tag)
                button.backgroundColor = SelectedColor
            }else{
                button.backgroundColor = UnSelectedColor
            }
        }
    }

    //下一題
    @IBAction func next(_ sender: Any) {
        
        if answers.count<indexQuiz {
            noAnswerAlert()
            return
        }
        if indexQuiz < quizs.count  {
            initQuizUI()    //下一題
        }else{
            gotoResult()    //測試結果
        }
    }
    
    //傳遞資料到結果頁的controller
    @IBSegueAction func showResult(_ coder: NSCoder) -> ResultViewController? {
        let controller = ResultViewController(coder:coder)
        controller?.answers = answers
        return controller
    }
    
    //進入結果頁
    func gotoResult(){
        performSegue(withIdentifier: "showResult", sender: nil)
    }
    
    //繪製背景圖片
    func initBackground(){
        FlowerImageView.image = UIImage(named: "flower-" + String(Int.random(in: 1...20)))
    }
    
    //繪製題目
    func initQuizUI(){
        var index = 0
        
        //背景
        initBackground()
        
        //繪製題目
        QuestionLabel.text = quizs[indexQuiz].question
        
        //亂數排序選項
        //let options:[Any] = GKRandomSource.sharedRandom().arrayByShufflingObjects(in: quizs[indexQuiz].options)
        let options:[Option] = quizs[indexQuiz].options
        
        //繪製選項按鈕
        for button in OptionButtons {
            if index<options.count, let option = options[index] as? Option {
                button.configuration?.attributedTitle = AttributedString(option.content)
                button.tag = option.value
                button.backgroundColor = UnSelectedColor
                button.isHidden = false
            }else{
                button.isHidden = true
            }
            index += 1
        }
        
        //繪製下一題按鈕
        indexQuiz += 1
        var buttonText = "完成"
        if indexQuiz < quizs.count  {
            buttonText = "下一題"
        }
        if let attrFont = UIFont(name: "Helvetica", size: 30) {
            let attrTitle = NSAttributedString(string: buttonText, attributes: [NSAttributedString.Key.font: attrFont])
                    NextButton.setAttributedTitle(attrTitle, for: UIControl.State.normal)
        }
        
    }
    
    //訊息 - 檢查是否回答
    func noAnswerAlert() {
        let alertController = UIAlertController(title: "請作答～", message: "", preferredStyle: .alert)
        let alertAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        alertController.addAction(alertAction)
        present(alertController, animated: true)
    }
    
    //載入題目
    func initQuizs(){
        
        quizs.append(Quiz(sn: 1, question: "你在人群中的行為是？", options: [
            Option(content: "非常外向", value: 5),
            Option(content: "比較外向", value: 4),
            Option(content: "中性", value: 3),
            Option(content: "比較內向", value: 2),
            Option(content: "非常內向", value: 1)
        ]))
        quizs.append(Quiz(sn: 2, question: "你偏好以下哪種活動？", options: [
            Option(content: "戶外運動", value: 5),
            Option(content: "藝術和創意活動", value: 4),
            Option(content: "和朋友聚會", value: 3),
            Option(content: "閱讀或思考", value: 2)
        ]))
        quizs.append(Quiz(sn: 3, question: "當遇到困難時，你的第一反應是？", options: [
            Option(content: "立刻解決問題", value: 5),
            Option(content: "尋求他人的幫助", value: 4),
            Option(content: "冷靜思考解決方法", value: 3),
            Option(content: "感到焦慮或困惑", value: 2)
        ]))
        quizs.append(Quiz(sn: 4, question: "你對於未來的展望是？", options: [
            Option(content: "充滿希望和機會", value: 5),
            Option(content: "持保留態度，謹慎看待", value: 4),
            Option(content: "不太確定，感到迷茫", value: 3),
            Option(content: "感到恐懼或不安", value: 2)
        ]))
        quizs.append(Quiz(sn: 5, question: "你在團隊中的角色是？", options: [
            Option(content: "領導者", value: 5),
            Option(content: "負責創意和點子", value: 4),
            Option(content: "執行者，完成任務", value: 3),
            Option(content: "團隊協調者", value: 2),
            Option(content: "觀察者，提供反饋", value: 1)
        ]))
        quizs.append(Quiz(sn: 6, question: "你喜歡的休閒活動是？", options: [
            Option(content: "參加派對或社交活動", value: 5),
            Option(content: "去自然環境中散步", value: 4),
            Option(content: "看電影或電視劇", value: 3),
            Option(content: "在家閱讀或寫作", value: 2)
        ]))
        quizs.append(Quiz(sn: 7, question: "你對於新事物的接受程度是？", options: [
            Option(content: "非常開放，喜歡嘗試新事物", value: 5),
            Option(content: "有些保守，但願意嘗試", value: 4),
            Option(content: "需要一些時間適應", value: 3),
            Option(content: "非常保守，不太喜歡改變", value: 2)
        ]))
        quizs.append(Quiz(sn: 8, question: "在壓力下，你的應對方式是？", options: [
            Option(content: "積極尋求解決辦法", value: 5),
            Option(content: "找人傾訴，尋求支持", value: 4),
            Option(content: "選擇獨處，冷靜思考", value: 3),
            Option(content: "感到不知所措或焦慮", value: 2)
        ]))
        quizs.append(Quiz(sn: 9, question: "你對於規劃和組織事情的能力如何？", options: [
            Option(content: "非常強，喜歡有組織性", value: 5),
            Option(content: "有一定能力，但不一定非常喜歡", value: 4),
            Option(content: "需要努力，但可以做到", value: 3),
            Option(content: "不太擅長，常常雜亂無章", value: 2)
        ]))
        quizs.append(Quiz(sn: 10, question: "你對於他人情緒的敏感度如何？", options: [
            Option(content: "非常敏感，能夠察覺細微情緒變化", value: 2),
            Option(content: "有一定敏感度，但不是特別強", value: 3),
            Option(content: "偶爾能感受到，但常常忽略", value: 4),
            Option(content: "不太敏感，很難察覺他人情緒", value: 5)
        ]))
        quizs.append(Quiz(sn: 11, question: "你在面對冲突時的傾向是？", options: [
            Option(content: "積極解決，追求共贏", value: 5),
            Option(content: "直接對抗，捍衛自己立場", value: 4),
            Option(content: "嘗試和解，保持和平", value: 3),
            Option(content: "避免衝突，選擇退讓", value: 2)
        ]))
        quizs.append(Quiz(sn: 12, question: "你喜歡的季節是？", options: [
            Option(content: "春季", value: 4),
            Option(content: "夏季", value: 5),
            Option(content: "秋季", value: 3),
            Option(content: "冬季", value: 2)
        ]))
        quizs.append(Quiz(sn: 13, question: "在社交場合，你更喜歡？", options: [
            Option(content: "與不同人交談，擴展社交圈", value: 5),
            Option(content: "與熟悉的朋友交流", value: 4),
            Option(content: "選擇較小的團體，有深入交流", value: 3),
            Option(content: "盡量避免社交場合", value: 2)
        ]))
        quizs.append(Quiz(sn: 14, question: "你對於計劃的完成度如何？", options: [
            Option(content: "常常提前完成，效率高", value: 5),
            Option(content: "多數情況下能夠如期完成", value: 4),
            Option(content: "偶爾拖延，但最終完成", value: 3),
            Option(content: "經常拖延，難以完成", value: 2)
        ]))
        quizs.append(Quiz(sn: 15, question: "你對於不確定性的容忍度如何？", options: [
            Option(content: "非常容忍，喜歡冒險", value: 5),
            Option(content: "有一定容忍度，但偶爾會不安", value: 4),
            Option(content: "較低容忍度，喜歡穩定", value: 3),
            Option(content: "非常難以接受不確定性", value: 2)
        ]))
        quizs.append(Quiz(sn: 16, question: "你在工作中更看重？", options: [
            Option(content: "自主性和創造力", value: 5),
            Option(content: "團隊合作和協調能力", value: 4),
            Option(content: "細心和準確度", value: 3),
            Option(content: "穩定和安全感", value: 2)
        ]))
        quizs.append(Quiz(sn: 17, question: "你對於自己的外表和形象的重視程度是？", options: [
            Option(content: "非常注重，時刻保持最佳狀態", value: 2),
            Option(content: "有一定重視，但不會太過困擾", value: 3),
            Option(content: "隨意，不太在意外表", value: 4),
            Option(content: "很少注意外表和形象", value: 5)
        ]))
        quizs.append(Quiz(sn: 18, question: "你認為自己的情緒管理能力如何？", options: [
            Option(content: "非常好，能夠冷靜處理情緒", value: 2),
            Option(content: "有一定能力，但偶爾會情緒起伏", value: 3),
            Option(content: "需要努力，常常受情緒影響", value: 4),
            Option(content: "情緒管理能力很差", value: 5)
        ]))
        quizs.append(Quiz(sn: 19, question: "你在社交媒體上的活躍程度是？", options: [
            Option(content: "非常活躍，經常分享生活", value: 5),
            Option(content: "有一定活躍度，但不過度", value: 4),
            Option(content: "偶爾使用，不太經常更新", value: 3),
            Option(content: "幾乎不使用社交媒體", value: 2)
        ]))
        quizs.append(Quiz(sn: 20, question: "你對於自己的未來目標感到？", options: [
            Option(content: "非常清晰，有明確的計劃", value: 4),
            Option(content: "有一些想法，但仍在探索中", value: 3),
            Option(content: "感到迷茫，不太確定", value: 2),
            Option(content: "不太關心未來，活在當下", value: 5)
        ]))
        
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
