//
//  Option.swift
//  PsycholTest
//
//  Created by Jeanine Chuang on 2023/8/7.
//

import Foundation

//選項
class Option {
    let content:String  //選項文字
    let value:Int       //比重，用以計算分析屬於哪類人格
    init(content: String, value: Int) {
        self.content = content
        self.value = value
    }
}
