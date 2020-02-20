//
//  ViewController.swift
//  Bip The Guy
//
//  Created by Nicholas Mercadante on 2/18/20.
//  Copyright © 2020 Nicholas Mercadante. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate
{

    @IBOutlet weak var imageToPunch: UIImageView!
    
    var audioPlayer = AVAudioPlayer ()
    
    var imagePicker = UIImagePickerController ()
    

    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        imagePicker.delegate = self
        
    }
    
    func animateImage() {
        let bounds = self.imageToPunch.bounds
        let shrinkValue : CGFloat = 60
        
        self.imageToPunch.bounds = CGRect(x: self.imageToPunch.bounds.origin.x + shrinkValue , y: self.imageToPunch.bounds.origin.y - shrinkValue , width: self.imageToPunch.bounds.size.width - shrinkValue, height: self.imageToPunch.bounds.size.height - shrinkValue)
        
        UIView.animate(withDuration: 0.25, delay: 0.0, usingSpringWithDamping: 0.1, initialSpringVelocity: 10, options: [], animations: { self.imageToPunch.bounds = bounds }, completion: nil)
    }

  func playSound(soundName: String, audioPlayer: inout AVAudioPlayer) {
        if let sound = NSDataAsset(name: soundName) {
            do {
                try audioPlayer = AVAudioPlayer(data: sound.data)
                audioPlayer.play()
            } catch {
                print("ERROR: Data from \(soundName) could not be played as an audio file")
            }
        } else {
            print("ERROR: Could not load datea from file \(soundName)")
        }
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
           let selectedImage = info[UIImagePickerController.InfoKey.originalImage] as! UIImage
           
           imageToPunch.image = selectedImage
           
           dismiss(animated: true, completion: nil)
       }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
           // All we need to do is call the dismiss method.
           dismiss(animated: true, completion: nil)
       }
    
   @IBAction func libraryPressed(_ sender: UIButton) {
               imagePicker.sourceType = .photoLibrary
 
    
        present(imagePicker, animated: true, completion: nil)
           }
           
           @IBAction func cameraPressed(_ sender: UIButton) {
               
               // Check to see if the camera is available.  If we didn't have this & clicked the "Camera" button in the simulator, our app would crash.
               if UIImagePickerController.isSourceTypeAvailable(.camera) {
                   imagePicker.sourceType = .camera
                   present(imagePicker, animated: true, completion: nil)
              
           }
    

    }
    
    @IBAction func imageTapped(_ sender: UITapGestureRecognizer) {
           animateImage()
           playSound(soundName: "punchSound", audioPlayer: &audioPlayer)
       }
}

