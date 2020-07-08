//
//  ViewController.swift
//  EggTimer
//
//  Created by Angela Yu on 08/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    @IBOutlet weak var progressBar: UIProgressView!
    @IBOutlet weak var titleLabel: UILabel!
    
    let eggTimes = ["Soft": 3, "Medium": 4 ,"Hard": 5]
    var timer = Timer()
    var player:  AVAudioPlayer!
    var totalTime = 0 //총 시간
    var secondPassed = 0 // secondRemaining과 다르게 이것은 0부터 올라간다.
    
    @IBAction func hardnessSelected(_ sender: UIButton) {
        
        timer.invalidate()
        let hardness = sender.currentTitle!
        
        totalTime = eggTimes[hardness]!
        
        progressBar.progress = 0.0 //다른 버튼을 눌렀을때 진행바를 초기화해주는 코드
        secondPassed = 0 // 지나간 시간도 0으로 초기화
        titleLabel.text = hardness //우리가 현재 진행하고 있는 버튼의 이름을 출력해줌.
        
       timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateTimer), userInfo: nil, repeats: true)
        print(eggTimes[hardness]!)
         
        
    }
    
    
    @objc func updateTimer(){
           if secondPassed < totalTime {
            
            secondPassed += 1
            progressBar.progress = Float(secondPassed) / Float(totalTime)
            print(Float(secondPassed) / Float(totalTime))
            
        
                //secondPassed += 1  이 코드를 위로 올려주면, 진행바를 끝까지 출력할수 있도록 해준다.
           } else {
            timer.invalidate()
            titleLabel.text = "Done!"
            
            let url = Bundle.main.url(forResource: "alarm_sound", withExtension: "mp3")
            player = try! AVAudioPlayer(contentsOf: url!)
            player.play()
        }
    
    }
    
}
