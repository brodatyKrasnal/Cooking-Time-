//
//  TimerViewController.swift
//  Cooking Time!
//
//  Created by Daniel Golęba Frygies on 14/04:105.
//  Copyright © 2020 Tymon Golęba Frygies. All rights reserved.
//

import UIKit

class TimerViewController: UIViewController {
    
    @IBOutlet weak var counterLabels: UIDatePicker!
    @IBOutlet weak var progressBar: UIProgressView!
    
    var minutesToCountDown: Double = 0.0
    var countDown: Float = 0.0
    
    var timer: Timer?

    override func viewDidLoad() {
        super.viewDidLoad()
        progressBar.progress = 0
        // Do any additional setup after loading the view.
    }
    
    @IBAction func scrollPushed(_ sender: UIDatePicker) {
        timer?.invalidate()
        countDown = Float(sender.countDownDuration)
        minutesToCountDown = sender.countDownDuration
    }

    @IBAction func runButton(_ sender: UIButton) {
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(countdown), userInfo: nil, repeats: true)
    }

    
    @IBAction func returnCommand(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
}

//MARK: - Timer Countdown Mechanism
extension TimerViewController {
    
@objc func countdown () {
    progressBar.progress = 1 - (countDown / Float(minutesToCountDown))
    print(countDown)
    countDown -= 1
    counterLabels.countDownDuration = TimeInterval(countDown)
    
    if countDown == 31 {
        playSound(sound: "clock_timer", type: "mp3")
        progressBar.trackTintColor = .red
    }
    
    if countDown <= 0 {
        playSound(sound: "final_countdown", type: "mp3")
        timer?.invalidate()
        timer = nil
    }
    
    if countDown < 0 {
        timer = nil
        timer?.invalidate()
    }
}
}
