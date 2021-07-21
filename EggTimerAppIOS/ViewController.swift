//
//  ViewController.swift
//  EggTimerAppIOS
//
//  Created by chekir walid on 21/7/2021.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    var eggTimes = ["Soft": 300, "Medium": 420, "Hard": 720]
    var totalTime = 0
    var secondsPassed = 0
    var timer = Timer()
    var player : AVAudioPlayer?
    @IBOutlet weak var txtResult: UILabel!
    @IBOutlet weak var progressBar: UIProgressView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let url = Bundle.main.url(forResource: "alarm_sound", withExtension: "mp3")
        player = try! AVAudioPlayer(contentsOf: url!)
        // Do any additional setup after loading the view.
    }

    @IBAction func buttonPressed(_ sender: UIButton) {
        timer.invalidate()
        let hardness = sender.currentTitle! // ! to say 3 button have a title sure
        totalTime = eggTimes[hardness]!
        progressBar.progress = 0.0
        secondsPassed = 0
        txtResult.text = hardness
        timer = Timer.scheduledTimer(timeInterval: 1 ,target: self,selector: #selector(updateTimer),userInfo: nil,repeats: true)
    }

    @objc func updateTimer()
    {
         if secondsPassed < totalTime
         {
            secondsPassed += 1
            progressBar.progress =  Float(secondsPassed) / Float(totalTime)
         } else {
            timer.invalidate()
            txtResult.text = "Done !"
            player!.play()
         }
    }
    
}

