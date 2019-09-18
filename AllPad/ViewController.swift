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
    var flag : Bool = false
    let soundArray = ["C","C#","D","D#","E","F","F#","G","G#","A","A#","B"]
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    func fading(){audioPlayer.setVolume(0.0, fadeDuration: 2)}
    
    @IBAction func buttonStopPressed(_ sender: UIButton) {
        
        fading()

    }
    
    @IBOutlet weak var buttonColor: UIButton!
    
    @IBAction func buttonPressed(_ sender: UIButton) {
        
        
        if (flag == true){
            fading()
        }
        
        sender.backgroundColor = UIColor.darkGray
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
        
        audioPlayer.prepareToPlay()
        audioPlayer.delegate = self
        audioPlayer.numberOfLoops = 10
        flag = true
        audioPlayer.play()
        
    }
}
