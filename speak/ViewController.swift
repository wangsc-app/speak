//
//  ViewController.swift
//  speak
//
//  Created by wangsc on 2018/12/16.
//  Copyright © 2018 wangsc. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController, UITextFieldDelegate {
    
//Outlet
    @IBOutlet weak var sayTextField: UITextField!
    
    @IBOutlet weak var speedText: UILabel!
    
    @IBOutlet weak var speedRate: UISlider!
    
    @IBOutlet weak var voiceText: UILabel!
    
    @IBOutlet weak var voiceType: UISlider!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    //顯示slider數值，取小數點後面兩位
    @IBAction func changeSlider(_ sender: Any) {
        speedText.text = String(format: "%.2f", speedRate.value)
        voiceText.text = String(format: "%.2f", voiceType.value)
    }
    
    
    
//說話
    @IBAction func speakButtonPressed(_ sender: UIButton) {
        let saySpeechUtterance = AVSpeechUtterance(string: sayTextField.text!)
        let saySpeechSynthesizer = AVSpeechSynthesizer()
        saySpeechUtterance.voice = AVSpeechSynthesisVoice(language: "zh-tw")
        saySpeechUtterance.pitchMultiplier = voiceType.value
        saySpeechUtterance.rate = speedRate.value
        saySpeechSynthesizer.speak(saySpeechUtterance)
    }
    //隱藏鍵盤
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    //按下return鍵盤收回，要在class ViewController後面加上一個UITextFieldDelegate
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        sayTextField.resignFirstResponder()
        return(true)
    }
}


