//
//  ViewController.swift
//  TapCounterPlus
//
//  Created by 黃士軒 on 2019/9/16.
//  Copyright © 2019 黃士軒. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var tapButtonIBOutlet: UIButton!
    
    enum GameStatus {
        case notYetStart
        case inGaming
    }
    
    var score = 0
    var time = 5
    var timer = Timer()
    var gameStatus = GameStatus.notYetStart
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func tapButton(_ sender: UIButton) {
        
        switch gameStatus {
            
        case .notYetStart:
            score = score + 1
            scoreLabel.text = String(score)
            startToCountDown()
            gameStatus = GameStatus.inGaming
        case .inGaming:
            score = score + 1
            scoreLabel.text = String(score)
        }
    }
    
    @IBAction func resetButton(_ sender: UIButton) {
        score = 0
        scoreLabel.text = String(score)
        time = 5
        timeLabel.text = String(time)
        timer.invalidate()
        gameStatus = GameStatus.notYetStart
        tapButtonIBOutlet.isEnabled = true
    }
    
    @objc func timeCountDown() {
        time = time - 1
        timeLabel.text = String(time)
        
        if time == 0 {
            timer.invalidate()
            tapButtonIBOutlet.isEnabled = false
            let alert = UIAlertController(title: "Congratulation!", message: "You got \(score) points!", preferredStyle: .alert)
            let action = UIAlertAction(title: "OK", style: .cancel, handler: nil)
            alert.addAction(action)
            present(alert, animated: true, completion: nil)
        }
    }
    
    func startToCountDown() {
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(timeCountDown), userInfo: nil, repeats: true)
    }
}

