//
//  ViewController.swift
//  29th-iOS-SeminarPractice-week8
//
//  Created by kimhyungyu on 2021/12/18.
//

import UIKit
import Lottie

class ViewController: UIViewController {

    // MARK: - Properties
    
    var animator: UIViewPropertyAnimator?
    
    lazy var lottieView: AnimationView = {
        let animationView = AnimationView(name: "seminar8-sample")
        animationView.frame = CGRect(x: 0, y: 0, width: 300, height: 300)
        animationView.center = self.view.center
        animationView.contentMode = .scaleAspectFit
        animationView.stop()
        animationView.isHidden = true
        
        return animationView
    }()
    
    // MARK: - @IBOutlet Properties
    
//    @IBOutlet weak var targetView: UIView!
    
    // MARK: - View Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        initAnimator()
        
        view.addSubview(lottieView)
    }
    
    // MARK: - @IBAction Properties

    @IBAction func touchUpToStartAnimation(_ sender: Any) {
//        animator?.startAnimation()
        
        lottieView.isHidden = false
        lottieView.play()
    }
    @IBAction func touchUpToPauseAnimation(_ sender: Any) {
//        animator?.pauseAnimation()
        
        lottieView.pause()
    }
    @IBAction func touchUpToStopAnimation(_ sender: Any) {
//        animator.stopAnimation(true)

//        animator?.stopAnimation(false)
//        animator?.finishAnimation(at: .current)
        
        lottieView.isHidden = true
        lottieView.stop()
    }
    
}

extension ViewController {
    /*
    private func initAnimator() {
        animator = UIViewPropertyAnimator(duration: 1, curve: .easeInOut) {
            self.targetView.frame = CGRect(x: self.view.center.x - 50, y: self.view.center.y - 50, width: 100, height: 100)
        }
        
        animator?.addAnimations {
            self.targetView.backgroundColor = .green
        }
        
        animator?.addCompletion { position in
            print(position.rawValue)
            print("completion 블록 호출됨")
        }
        
        animator?.addCompletion {
            print($0.rawValue)
            print("completion 블록 호출됨")
        }
    }
     */
}
