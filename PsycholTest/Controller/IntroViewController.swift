//
//  IntroViewController.swift
//  PsycholTest
//
//  Created by Jeanine Chuang on 2023/8/7.
//

import UIKit

class IntroViewController: UIViewController {

    @IBOutlet weak var FlowerImageView: UIImageView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        FlowerImageView.image = UIImage(named: "flower-" + String(Int.random(in: 1...20)))
    }
    
    //註冊標記，由結果頁透過unwind segue回到歡迎頁
    @IBAction func unwindToRootViewController(segue: UIStoryboardSegue) {
        print("Unwind to Root View Controller")
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
