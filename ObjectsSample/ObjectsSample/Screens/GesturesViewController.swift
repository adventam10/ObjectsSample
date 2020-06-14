//
//  GesturesViewController.swift
//  ObjectsSample
//
//  Created by am10 on 2020/06/14.
//  Copyright © 2020 am10. All rights reserved.
//

import UIKit

/// 3本指のタップとパンジェスチャに反応する
final class CustomGestureRecognizer: UIGestureRecognizer {

    private let fingers = 3
    override func reset() {
        super.reset()
        state = .possible
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent) {
        super.touchesBegan(touches, with: event)
        if touches.count != fingers {
            state = .failed
            return
        }
        state = .began
    }

    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent) {
        super.touchesMoved(touches, with: event)
        if state == .failed || touches.count != fingers {
            return
        }
        state = .changed
    }

    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent) {
        super.touchesEnded(touches, with: event)
        if state == .failed {
            state = .failed
            return
        }
        state = .ended
    }

    override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent) {
        super.touchesCancelled(touches, with: event)
        state = .cancelled
    }
}

final class GesturesViewController: UIViewController {

    @IBOutlet private var tapGesture: UITapGestureRecognizer! {
        didSet {
            // コードで設定する場合
//            tapGesture.numberOfTouchesRequired = 1
//            tapGesture.numberOfTapsRequired = 1
//            tapGesture.buttonMaskRequired = .primary
//            tapGesture.addTarget(self, action: #selector(tapGestureAction(_:)))
        }
    }
    @IBOutlet private var pinchGesture: UIPinchGestureRecognizer! {
        didSet {
            // コードで設定する場合
//            pinchGesture.scale = 1
//            pinchGesture.addTarget(self, action: #selector(pinchGestureAction(_:)))
        }
    }
    @IBOutlet private var rotationGesture: UIRotationGestureRecognizer! {
        didSet {
            // コードで設定する場合
//            rotationGesture.rotation = 0
//            rotationGesture.addTarget(self, action: #selector(rotationGestureAction(_:)))
        }
    }
    @IBOutlet private var swipeGesture: UISwipeGestureRecognizer! {
        didSet {
            // コードで設定する場合
//            swipeGesture.direction = .right
//            swipeGesture.numberOfTouchesRequired = 1
//            swipeGesture.addTarget(self, action: #selector(swipeGestureAction(_:)))
        }
    }
    @IBOutlet private var panGesture: UIPanGestureRecognizer! {
        didSet {
            // コードで設定する場合
//            panGesture.minimumNumberOfTouches = 1
//            panGesture.maximumNumberOfTouches = Int.max
//            panGesture.addTarget(self, action: #selector(panGestureAction(_:)))
        }
    }
    @IBOutlet private var screenEdgePanGesture: UIScreenEdgePanGestureRecognizer! {
        didSet {
            // コードで設定する場合
//            screenEdgePanGesture.edges = .right
//            screenEdgePanGesture.addTarget(self, action: #selector(screenEdgePanGestureAction(_:)))
        }
    }
    @IBOutlet private var longPressGesture: UILongPressGestureRecognizer! {
        didSet {
            // コードで設定する場合
//            longPressGesture.minimumPressDuration = 0.5
//            longPressGesture.numberOfTouchesRequired = 1
//            longPressGesture.numberOfTapsRequired = 0
//            longPressGesture.allowableMovement = 10
//            longPressGesture.addTarget(self, action: #selector(longPressGestureAction(_:)))
        }
    }
    @IBOutlet private var customGesture: CustomGestureRecognizer!

    @IBOutlet private weak var tapGestureLabel: UILabel!
    @IBOutlet private weak var pinchGestureLabel: UILabel!
    @IBOutlet private weak var rotationGestureLabel: UILabel!
    @IBOutlet private weak var swipeGestureLabel: UILabel!
    @IBOutlet private weak var panGestureLabel: UILabel!
    @IBOutlet private weak var screenEdgeGestureLabel: UILabel!
    @IBOutlet private weak var longPressGestureLabel: UILabel!
    @IBOutlet private weak var customGestureLabel: UILabel!

    private var tapCount = 0
    private var longPressCount = 0
    private var panCount = 0
    private var screenEdgePanCount = 0
    private var swipeCount = 0
    private var customCount = 0

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    @IBAction private func tapGestureAction(_ sender: Any) {
        print("Tap!!")
        tapCount += 1
        tapGestureLabel.text = "Tap!! \(tapCount)回"
    }

    @IBAction private func pinchGestureAction(_ sender: Any) {
        print("Pinch!!")
        pinchGestureLabel.text = "Pinch!! scale: \(pinchGesture.scale)"
    }

    @IBAction private func rotationGestureAction(_ sender: Any) {
        print("Rotation!!")
        rotationGestureLabel.text = "Rotation!! rotation: \(rotationGesture.rotation)"
    }

    @IBAction private func swipeGestureAction(_ sender: Any) {
        print("RightSwipe!!")
        swipeCount += 1
        swipeGestureLabel.text = "RightSwipe!! \(swipeCount)回"
    }

    @IBAction private func panGestureAction(_ sender: Any) {
        print("Pan!!")
        if panGesture.state == .began {
            panCount = 0
        } else {
            panCount += 1
        }
        panGestureLabel.text = "Pan!! \(panCount)"
    }

    @IBAction private func screenEdgePanGestureAction(_ sender: Any) {
        print("RightScreenEdgePan!!")
        if screenEdgePanGesture.state == .began {
            screenEdgePanCount = 0
        } else {
            screenEdgePanCount += 1
        }
        screenEdgeGestureLabel.text = "RightScreenEdgePan!! \(screenEdgePanCount)"
        
    }

    @IBAction private func longPressGestureAction(_ sender: Any) {
        print("LongPress!!")
        if longPressGesture.state == .began {
            longPressCount = 0
        } else {
            longPressCount += 1
        }
        longPressGestureLabel.text = "LongPress!! \(longPressCount)"
    }

    @IBAction private func customGestureAction(_ sender: Any) {
        print("Custom!!")
        if customGesture.state == .began {
            customCount = 0
        } else {
            customCount += 1
        }
        customGestureLabel.text = "Custom ThreeFingersGesture!! \(customCount)"
    }
}
