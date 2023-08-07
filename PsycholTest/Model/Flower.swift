//
//  Flower.swift
//  PsycholTest
//
//  Created by Jeanine Chuang on 2023/8/7.
//

import Foundation

//花朵人格
class Flower {
    let code:String     //代碼 - 作為Dictionary的Key
    let name:String     //花名
    let summary:String  //簡介
    let traits:[Trait]  //各種特質
    
    init(code: String, name: String, summary: String, traits: [Trait]) {
        self.code = code
        self.name = name
        self.summary = summary
        self.traits = traits
    }
}

