//
//  mycelium.swift
//  Test1
//
//  Created by ZHU YI on 5/11/16.
//  Copyright © 2016 ZHU YI. All rights reserved.
//

import UIKit
import AVFoundation

class mycelium: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    @IBAction func back1(sender: UIButton) {
    }
    let mySpeechSynth = AVSpeechSynthesizer()
    var myRate: Float = 0.50
    var myPitch: Float = 1.15
    var myVolume: Float = 0.92
    var currentLang = ("en-US", "English","United States","American English ","🇺🇸","mycelium")
    
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return langCode5.count
    }
    
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        pickerView.showsSelectionIndicator = true
        let myString = "\(langCode5[row].4) \(langCode5[row].3)"
        return myString
    }
    
    func pickerView(pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        currentLang = langCode5[row]
        speakThisString(currentLang.3)
    }
    
    func speakThisString(passedString: String){
        
        mySpeechSynth.stopSpeakingAtBoundary(AVSpeechBoundary.Immediate)
        
        let myUtterance = AVSpeechUtterance(string: passedString)
        myUtterance.rate = myRate
        myUtterance.pitchMultiplier = myPitch
        myUtterance.volume = myVolume
        myUtterance.voice = AVSpeechSynthesisVoice(language: currentLang.5)
        mySpeechSynth.speakUtterance(myUtterance)
    }
    
    var langCode5 = [
        ("en-US", "English", "United States", "American English","🇺🇸","mycelium"),
        ("fr-FR", "French", "France", "Français","🇫🇷","mycélium"),
        ("zh-CN", "Chinese", "China","漢語/汉语","🇨🇳","菌丝"),
        ("de-DE", "German", "Germany", "Deutsche","🇩🇪","Myzel"),
        ("es-ES", "Spanish", "Spain", "Español","🇪🇸","micelio"),
    ]

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
