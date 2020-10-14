//
//  ViewController.swift
//  diceroller
//
//  Created by Eric Rossi on 14/10/20.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var die1: UIImageView!
    @IBOutlet var die2: UIImageView!
    
    var images = ["die1", "die2", "die3", "die4", "die5", "die6"]
    var animations = [UIImage]()
    
    var score = 0
    @IBOutlet var scoreLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        for image in images {
            animations.append(UIImage(named: image)!)
        }
        let app_bg_image = UIImageView(frame: UIScreen.main.bounds)
        app_bg_image.image = UIImage(named: "bg_image")
        app_bg_image.contentMode = UIView.ContentMode.scaleAspectFill
        self.view.insertSubview(app_bg_image, at: 0)
    }

    func animate(imageView: UIImageView){
        imageView.animationImages = animations
        imageView.animationDuration = 1
        imageView.animationRepeatCount = 1
        imageView.startAnimating()
    }

    @IBAction func buttonPressed(_ sender: Any) {
        animate(imageView: die1)
        animate(imageView: die2)
        let a = Int.random(in: 0...5)
        let b = Int.random(in: 0...5)
        die1.image = UIImage(named: images[a])
        die2.image = UIImage(named: images[b])

        // The +2 is because the dice numbers go from 1 through 6,
        // while the list index goes from 0 through 5
        score = a + b + 2
        scoreLabel.text = "Total: \(score)"
    }
}
