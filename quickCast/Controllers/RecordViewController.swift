//
//  RecordViewController.swift
//  quickCast
//
//  Created by Malik Adebiyi on 2020-05-25.
//  Copyright © 2020 dotSandbox. All rights reserved.
//

import Foundation
import AVFoundation
import UIKit

class RecordViewController: UIViewController, AVAudioRecorderDelegate, UITableViewDelegate, UITableViewDataSource {
    
    var recordingSession: AVAudioSession!
    var audioRecorder: AVAudioRecorder!
    var audioPlayer: AVAudioPlayer!
    
    var numberOfRecords: Int = 0
    var timer = Timer()
    var totalTime = 20
    var secondsPassed = 0
    @IBOutlet weak var recordButton: UIButton!
    var timerActive : Bool = false
    
    let playSymbol = UIImage(systemName: "play.fill")
    let stopSymbol = UIImage(systemName: "stop.fill")
    
    @IBOutlet weak var progressBar: UIProgressView!
    @IBOutlet weak var timerLabel: UILabel!
    @IBOutlet weak var recTableView: UITableView!
    @IBOutlet weak var recBTN: UIButton!
    @IBOutlet weak var gifImage: UIImageView!
    
    // create file path to document folder
    let dataFilePath = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first?.appendingPathComponent("Items.plist")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        recTableView.rowHeight = 63.9
        progressBar.progress = 0.0
        
                print("device path is: ")
        
                if let number : Int = UserDefaults.standard.object(forKey: "lastNumber") as? Int
                {
                    numberOfRecords = number
                }
        print(numberOfRecords)
        
        //set up session
        recordingSession = AVAudioSession.sharedInstance()
        //request permission
        AVAudioSession.sharedInstance().requestRecordPermission { (hasPermission) in
            if hasPermission
            {
                print("audio Permission granted")
            }
            
        }
    }
    
    @IBAction func record(_ sender: UIButton)
    {
        updateTimer()

        //Timer
        timer.invalidate()
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateTimer), userInfo: nil, repeats: true)

        //Check if we have an active recorder
        if audioRecorder == nil
        {
            numberOfRecords += 1
            let filename = getDirectory().appendingPathComponent("Cast\(numberOfRecords).m4a")
            let settings = [AVFormatIDKey: Int(kAudioFormatMPEG4AAC), AVSampleRateKey: 32000, AVNumberOfChannelsKey: 1, AVEncoderAudioQualityKey: AVAudioQuality.max.rawValue]
        
            //start audio recording
            do
            {
                audioRecorder = try AVAudioRecorder(url: filename, settings: settings)
                audioRecorder.delegate = self
                audioRecorder.record()
                recBTN.setTitle("Recording..", for: .normal)
                sender.setImage(stopSymbol, for: .normal)

            }
            catch
            {
                displayAlert(title: "Oops!", message: "Something went wrong, try again.")
            }
        }
        else
        {
            //stop audio recording
            timer.invalidate()
            audioRecorder.stop()
            audioRecorder = nil
            timerLabel.text = String(secondsPassed)
            progressBar.progress = 0.0
            
            UserDefaults.standard.set(numberOfRecords, forKey: "lastNumber")

            recTableView.reloadData()
            recBTN.setTitle("Start Recording", for: .normal)
            sender.setImage(playSymbol, for: .normal)
        }
    }
    
    //function gets path to directory
    func getDirectory() -> URL
    {
        // finds path where audio is stored
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        //picks first path
        let documentDirectory = paths[0]
        return documentDirectory
    }
    
    //function displays alert
    func displayAlert(title:String, message:String)
    {
        let alert = UIAlertController(title: title, message: message, preferredStyle:.alert)
        alert.addAction(UIAlertAction(title: "dismiss", style: .default, handler: nil))
        present(alert, animated: true, completion: nil)
    }
    
    //function gets the name of the recorded audio
    func getRecordName()
    {
        let recPath = getDirectory()
        
        do
        {
            let audioPath = try FileManager.default.contentsOfDirectory(at: recPath, includingPropertiesForKeys: nil, options: .skipsHiddenFiles)
            
            for audio in audioPath
{
                let myAudio = audio.absoluteString
                
                if myAudio.contains(".m4a")
                {
                    let findString = myAudio.components(separatedBy: "/")
                    print(findString[findString.count - 1])
                    print(myAudio)
                }
            }
        }
        catch
        {
            
        }
        
    }
    //MARK: - Timer & Progress Bar
    @objc func updateTimer()
    {
        if  secondsPassed < totalTime {
            let progressPercentage = Float(secondsPassed) / Float(totalTime)
            progressBar.progress = progressPercentage
            secondsPassed += 1
            timerLabel.text = String(secondsPassed)
            recordButton.setImage(stopSymbol, for: .normal)

            
        }
        else
        {
            timer.invalidate()
            recBTN.setTitle("Start Recording", for: .normal)
            //stop audio recording
            audioRecorder = nil
            audioRecorder?.stop()
            progressBar.progress = 0.0
            recTableView.reloadData()
            recordButton.setImage(playSymbol, for: .normal)
        }
    }
    
    //MARK: - Load GIF
    
    
    //MARK: - Setting Up Table View
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return numberOfRecords
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = String(indexPath.row + 1)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)
    {
        let path = getDirectory().appendingPathComponent("Cast\(indexPath.row + 1).m4a")
        print(path)
        
        do
        {
            audioPlayer = try? AVAudioPlayer(contentsOf: path)
            audioPlayer.prepareToPlay()
            audioPlayer.play()
        }
        catch
        {
            print(error)
        }
    }
 
}
