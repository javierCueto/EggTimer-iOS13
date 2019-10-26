//
//  ViewController.swift
//  EggTimer
//
//  Created by Angela Yu on 08/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//  Edit Javier CM

import UIKit
import AVFoundation

class ViewController: UIViewController {
    let eggTimes = ["Crudos": 3 ,"Medio": 5 , "Duros" : 7]
    var timer = Timer()
    var player: AVAudioPlayer!
    //let title = Title
    //var count = 50
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var progressEgg: UIProgressView!
    
    @IBAction func buttonEgg(_ sender: UIButton) {
        progressEgg.progress=0
        self.titleLabel.text=sender.currentTitle!
        let hardness = sender.currentTitle!
        
        let result = eggTimes[hardness]!

        timerEgg(result : result)
    }
    
    
    
    func timerEgg(result : Int) {
        let progressValue : Float = (1/Float(result))
        timer.invalidate()
        var resultDown = result;
        timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { (Timer) in
               if resultDown > 0 {
                self.progressEgg.progress += progressValue
                   resultDown -= 1
                if(resultDown == 0){
                    self.finalEgg()
                }
               }
           }
        
       
        

    }
    
    func finalEgg(){
        timer.invalidate()
        titleLabel.text="Tus huevos ya se cocieron!!"
        let url = Bundle.main.url(forResource: "alarm_sound", withExtension: "mp3")
        player = try! AVAudioPlayer(contentsOf: url!)
        player.play()
    }

   

}
