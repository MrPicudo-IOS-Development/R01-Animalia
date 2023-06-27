/* ViewController.swift --> Animalia. Created by Miguel Torres on 23/06/23. */

import UIKit
import AVFoundation

class ViewController: UIViewController {

    var player: AVAudioPlayer!
    
    @IBOutlet weak var doggy: UIButton!
    @IBOutlet weak var michi: UIButton!
    @IBOutlet weak var blue: UIButton!
    @IBOutlet weak var windy: UIButton!
    @IBOutlet weak var infoLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        doggy.layer.cornerRadius = 25
        michi.layer.cornerRadius = 25
        blue.layer.cornerRadius = 25
        windy.layer.cornerRadius = 25
        // Necessary if we are not check the clip to bounds option.
        doggy.clipsToBounds = true
        infoLabel.text = ""
    }
    
    @IBAction func pressedButton(_ sender: UIButton) {
        if let title = sender.currentTitle {
            sender.alpha = 0.5
            playSound(title)
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                sender.alpha = 1.0
            }
            switch title {
            case "Doggy": infoLabel.text = "Dogs bark"
            case "Michi": infoLabel.text = "Cats meow"
            case "Blue": infoLabel.text = "Dolphins click and whistle"
            case "Windy": infoLabel.text = "Birds chirp or tweet"
            default: infoLabel.text = ""
            }
        } else {
            print("The button doesn't have a title for it's current state.")
        }
    }
    
    func playSound(_ name: String) {
        guard let url = Bundle.main.url(forResource: name, withExtension: "mp3") else {
            print("Audio file not found.")
            return
        }
        player = try! AVAudioPlayer(contentsOf: url)
        player.play()
    }
}

