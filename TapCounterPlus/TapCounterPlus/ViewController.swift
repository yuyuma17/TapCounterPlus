//
//  ViewController.swift
//  TapCounterPlus
//
//  Created by 黃士軒 on 2019/9/16.
//  Copyright © 2019 黃士軒. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    enum GameStatus {
        case willGame
        case gaming
        case deadGame
    }
    
    var score = 0
    var time = 5
    var timer = Timer()
    var gameStatus = GameStatus.willGame
    
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var timeLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        timeLabel.text = String(time)
    }

    @IBAction func tapButton(_ sender: Any) {
        switch gameStatus {

        case .willGame:
            score = score + 1
            scoreLabel.text = String(score)
            startToCountDown()
            gameStatus = GameStatus.gaming
        case .gaming:
            score = score + 1
            scoreLabel.text = String(score)
            if time == 0 {
                gameStatus = GameStatus.deadGame
            }
        case .deadGame:
            if time == 0 {
                score = score + 0
                let alert = UIAlertController(title: "Congratulation!", message: "You got \(score) points!", preferredStyle: .alert)
                let action = UIAlertAction(title: "OK", style: .cancel, handler: nil)
                alert.addAction(action)
                present(alert, animated: true, completion: nil)
            }
        @unknown default:
            print("I don't know")
        }

    }
    
    @IBAction func resetButton(_ sender: Any) {
        score = 0
        scoreLabel.text = String(score)
        time = 5
        timeLabel.text = String(time)
        timer.invalidate()
        gameStatus = GameStatus.willGame
    }
    
    @objc func countDown() {
        time = time - 1
        timeLabel.text = String(time)
        
        if time == 0 {
            timer.invalidate()
        }
    }
    
    func startToCountDown() {
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(countDown), userInfo: nil, repeats: true)
    }
}

