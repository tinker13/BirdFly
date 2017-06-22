//
//  ViewController.swift
//  birdFly
//
//  Created by hungtran on 6/21/17.
//  Copyright © 2017 hungtran. All rights reserved.
//

import UIKit
import AVFoundation
class ViewController: UIViewController {

    var bird = UIImageView()
    var audio = AVAudioPlayer()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        drawJungle()
        addBird()
        flyUpandDown()
        playSong()
    }

    func drawJungle() {
        let background = UIImageView(image: UIImage(named: "jungle.jpg"))
        background.frame = self.view.bounds
        background.contentMode = .scaleAspectFill
        self.view.addSubview(background)
    }

    func addBird() {
        bird = UIImageView(frame: CGRect(x: 0, y: 0, width: 110, height: 68))
        bird.animationImages = [UIImage(named: "bird0.png")!, UIImage(named: "bird1.png")!, UIImage(named: "bird2.png")!, UIImage(named: "bird3.png")!, UIImage(named: "bird4.png")!, UIImage(named: "bird5.png")!]
        bird.animationRepeatCount = 0
        bird.animationDuration = 0.2
        bird.startAnimating()
        self.view.addSubview(bird)
    }
    
    func flyUpandDown()  {
        UIView.animate(withDuration: 3, animations: { 
            self.bird.center = CGPoint(x: self.view.bounds.size.width, y: self.view.bounds.size.height)
            
        }) { (finished) in
            self.bird.transform = self.bird.transform.scaledBy(x: -1, y: 1).concatenating(CGAffineTransform(rotationAngle: 0))
            UIView.animate(withDuration: 4, animations: { 
                self.bird.center = CGPoint(x: 0, y: self.view.bounds.size.height)
            }, completion: { (quaydau) in
                self.bird.transform = self.bird.transform.scaledBy(x: -1, y: 1).concatenating(CGAffineTransform(rotationAngle :0))
                UIView.animate(withDuration: 4, animations: { 
                    self.bird.center = CGPoint(x: self.view.bounds.size.width, y: 0)
                }, completion: { _ in
                    self.bird.transform = self.bird.transform.scaledBy(x: -1, y: 1)
                    UIView.animate(withDuration: 3, animations: { 
                        self.bird.center = CGPoint(x: 0, y: 0)
                    }, completion: { _ in
                        self.bird.transform = self.bird.transform.scaledBy(x: -1, y: 1)
                     self.flyUpandDown()
                    })
                })
                
            })
        }
    }
    
    func playSong() {
        let filePath = Bundle.main.path(forResource: "A+ – Chào Mào Mái Hót", ofType: ".mp3")
        let url = URL(fileURLWithPath: filePath!)
        audio = try! AVAudioPlayer(contentsOf: url)
        audio.prepareToPlay()
        audio.play()
        
    }
}

