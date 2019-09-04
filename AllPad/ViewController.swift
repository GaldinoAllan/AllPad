	//
//  ViewController.swift
//  AllPad
//
//  Created by Allan Galdino on 03/09/19.
//  Copyright © 2019 Allan Galdino. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController, AVAudioPlayerDelegate {

    var audioPlayer : AVAudioPlayer!
    let soundArray = ["C","C#","D","D#","E","F","F#","G","G#","A","A#","B"]
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }

    
    @IBAction func buttonStopPressed(_ sender: UIButton) {
        
        audioPlayer.setVolume(0, fadeDuration: 2)
 
        audioPlayer.currentTime = 0

    }
    
    @IBAction func buttonPressed(_ sender: UIButton) {
        
        print(sender.tag)
        playPad(SoundFileName: soundArray[sender.tag])
        
    }
    
    func playPad(SoundFileName : String){
        
        let soundURL = Bundle.main.url(forResource: SoundFileName, withExtension : "mp3")
        
        do{
            audioPlayer = try AVAudioPlayer(contentsOf: soundURL!)
        }
        catch{
            print(error)
        }
        audioPlayer.setVolume(1, fadeDuration: 1)
        audioPlayer.play()
    }
    

}

