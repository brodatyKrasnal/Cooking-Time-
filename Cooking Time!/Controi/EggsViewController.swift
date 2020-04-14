//
//  EggsViewController.swift
//  Cooking Time!
//
//  Created by Daniel Golęba Frygies on 14/04:105.
//  Copyright © 2020 Tymon Golęba Frygies. All rights reserved.
//

import UIKit

class EggsViewController: UIViewController{
    
    @IBOutlet weak var progressBar: UIProgressView!
    @IBOutlet weak var runTimeButtonLabel: UIButton!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    var countDown = 0
    var pickedButton: String = ""
    var timer: Timer?
    var slicerMax: Int = 0
    
    let item = Item()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        progressBar.progress = 0
        descriptionLabel.text = ""
        
    }
    
    @IBAction func eggPicked(_ sender: UIButton) {
        //the following part is to prevent timers to interfere in case tapped multiple times
        timer?.invalidate()
        progressBar.trackTintColor = .blue
        audioPlayer?.stop()
        runTimeButtonLabel.titleLabel?.text = "Run"
        
        pickedButton = sender.currentTitle!
        slicerMax = item.eggButtonPressed(title: pickedButton).1
        print(slicerMax) // to check
        countDown = item.eggButtonPressed(title: pickedButton).1
        descriptionLabel.text = item.eggButtonPressed(title: pickedButton).2
    }
    
    @IBAction func runTimer(_ sender: UIButton) {
        timer?.invalidate() // if double pressed
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(counterMechanism), userInfo: nil, repeats: true)
    }
    
    @IBAction func returnCommand(_ sender: UIButton) {
        timer?.invalidate()
        dismiss(animated: true, completion:nil)
    }
}

//MARK: - CounterMechanism

extension EggsViewController {
    
    @objc func counterMechanism() {
        countDown -= 1
        print("\(countDown) seconds left") //to check
        
        progressBar.progress = 1 - (Float(countDown) / Float(slicerMax))
        if countDown == 31 {
            playSound(sound: "clock_timer", type: "mp3")
            progressBar.trackTintColor = .red
        }
        
        if countDown <= 0 {
            playSound(sound: "final_countdown", type: "mp3")
            timer?.invalidate()
            timer = nil
        }
    }
}
