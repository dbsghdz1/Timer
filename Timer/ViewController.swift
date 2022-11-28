//
//  ViewController.swift
//  Timer
//
//  Created by 김윤홍 on 2022/11/29.
//

import UIKit

    import AVFoundation

    var player: AVAudioPlayer?

    class ViewController: UIViewController {

        @IBOutlet weak var stepperLabel: UILabel!
        
        @IBOutlet weak var image: UIImageView!
        
        @IBOutlet weak var progressBar: UIProgressView!
        
        var timer = Timer()
        var seconds = 0.0
        var totalTime = 0.0
        
        @IBAction func stepperPressed(_ sender: UIStepper) {
            stepperLabel.text = String(format: "%.0f", sender.value)
            totalTime = sender.value * 60
            print(totalTime)
        }
        func playSound() {
            guard let path = Bundle.main.path(forResource: "alarm_sound", ofType: "mp3") else {
                return }
            let url = URL(fileURLWithPath: path)

            do {
                player = try AVAudioPlayer(contentsOf: url)
                player?.play()
                
            } catch let error {
                print(error.localizedDescription)
        }
    }
        @IBAction func buttonPressed(_ sender: UIButton) {
            
            timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateTimer), userInfo: nil, repeats: true)
           
        }
        @objc func updateTimer() {
            
            if seconds < totalTime {
                seconds += 1
              progressBar.progress = Float(seconds) / Float(totalTime)
                print(totalTime - seconds)
                
            } else if seconds == totalTime {
                timer.invalidate()
                stepperLabel.text = "1"
                playSound()
                image.image = #imageLiteral(resourceName: "제목 없는 디자인 (8)")
                progressBar.progress = 0.0
                }
        }

    }




