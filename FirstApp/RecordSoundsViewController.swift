//
//  ViewController.swift
//  FirstApp
//
//  Created by Peter Fam on 5/4/17.
//  Copyright © 2017 Peter Fam. All rights reserved.
//
import AVFoundation
import UIKit

class ViewController: UIViewController {
    
    var audioRecorder : AVAudioRecorder

    @IBOutlet weak var recordBtn: UIButton!
    @IBOutlet weak var stopRecordingBtn: UIButton!
    @IBOutlet weak var recordID: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        stopRecordingBtn.isEnabled = false
        print("viewWillAppear Called")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    @IBAction func recordAudio(_ sender: Any) {
    
        recordID.text = "Recording is in progress..."
        recordBtn.isEnabled = false
        stopRecordingBtn.isEnabled = true
        
        let dirPath = NSSearchPathForDirectoriesInDomains(.documentDirectory,.userDomainMask, true)[0] as String
       let recordingName = "recordedVoice.wav"
        let pathArray = [dirPath, recordingName]
        
        let filePath = URL (string: pathArray.joined(separator: "/"))
        
        let session = AVAudioSession.sharedInstance()
        try! session.setCategory(AVAudioSessionCategoryPlayAndRecord, with: .defaultToSpeaker)
        
        try! audioRecorder = AVAudioRecorder(url: filePath!, settings: [:])
        audioRecorder.isMeteringEnabled = true
        audioRecorder.prepareToRecord()
        audioRecorder.record()
        
    }
    
    @IBAction func stopRecording(_ sender: Any) {
        recordID.text =  "Tap to Record"
        recordBtn.isEnabled = true
        stopRecordingBtn.isEnabled = false
    }
    
}

