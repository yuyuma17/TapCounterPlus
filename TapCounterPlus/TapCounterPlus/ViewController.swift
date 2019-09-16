//
//  ViewController.swift
//  TapCounterPlus
//
//  Created by 黃士軒 on 2019/9/16.
//  Copyright © 2019 黃士軒. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var score = 0
    
    @IBOutlet weak var scoreLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func tapButton(_ sender: Any) {
        score = score + 1
        scoreLabel.text = String(score)
    }
    
    @IBAction func resetButton(_ sender: Any) {
        score = 0
        scoreLabel.text = String(score)
    }
    
}

