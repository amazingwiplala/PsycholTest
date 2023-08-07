//
//  Quiz.swift
//  PsycholTest
//
//  Created by Jeanine Chuang on 2023/8/7.
//

import Foundation

//測試題目
class Quiz {
    let sn:Int              //序號
    let question:String     //問題
    let options:[Option]    //選項
    init(sn: Int, question: String, options: [Option]) {
        self.sn = sn
        self.question = question
        self.options = options
    }
}
