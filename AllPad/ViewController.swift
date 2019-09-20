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
    var lastSender : Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    func fading(){audioPlayer.setVolume(0.0, fadeDuration: 2)}
    
    @IBAction func buttonStopPressed(_ sender: UIButton) {
        
        C.backgroundColor = UIColor.black
        cSharp.backgroundColor = UIColor.black
        D.backgroundColor = UIColor.black
        dSharp.backgroundColor = UIColor.black
        E.backgroundColor = UIColor.black
        F.backgroundColor = UIColor.black
        fSharp.backgroundColor = UIColor.black
        G.backgroundColor = UIColor.black
        gSharp.backgroundColor = UIColor.black
        A.backgroundColor = UIColor.black
        aSharp.backgroundColor = UIColor.black
        B.backgroundColor = UIColor.black
        fading()

    }
    
    @IBOutlet weak var buttonColor: UIButton!
    @IBOutlet weak var C: UIButton!
    @IBOutlet weak var cSharp: UIButton!
    @IBOutlet weak var D: UIButton!
    @IBOutlet weak var dSharp: UIButton!
    @IBOutlet weak var E: UIButton!
    @IBOutlet weak var F: UIButton!
    @IBOutlet weak var fSharp: UIButton!
    @IBOutlet weak var G: UIButton!
    @IBOutlet weak var gSharp: UIButton!
    @IBOutlet weak var A: UIButton!
    @IBOutlet weak var aSharp: UIButton!
    @IBOutlet weak var B: UIButton!
    
    
    @IBAction func buttonPressed(_ sender: UIButton) {
        
        C.backgroundColor = UIColor.black
        cSharp.backgroundColor = UIColor.black
        D.backgroundColor = UIColor.black
        dSharp.backgroundColor = UIColor.black
        E.backgroundColor = UIColor.black
        F.backgroundColor = UIColor.black
        fSharp.backgroundColor = UIColor.black
        G.backgroundColor = UIColor.black
        gSharp.backgroundColor = UIColor.black
        A.backgroundColor = UIColor.black
        aSharp.backgroundColor = UIColor.black
        B.backgroundColor = UIColor.black
        
        print(flag)
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
