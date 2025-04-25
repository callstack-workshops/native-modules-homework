//
//  RNCustomButtonManager.swift
//  mobile
//
//  Created by bartlomiejtomczyk on 25/04/2025.
//

import Foundation
import UIKit

@objc(RNCustomButtonManager)
class RNCustomButtonManager: RCTViewManager {
  override func view() -> (RNCustomButton) {
    return RNCustomButton()
  }

  @objc override static func requiresMainQueueSetup() -> Bool {
    return false
  }
}

class RNCustomButton: UIButton {
  
  @objc var onPress: RCTBubblingEventBlock?

   @objc var text: String = "" {
    didSet {
      self.setTitle(text, for: .normal)
    }
  }
  
  @objc var disabled: NSNumber =  0 {
    didSet {
      if(disabled.boolValue) {
        self.isEnabled = false
        self.backgroundColor = .white
        self.setTitleColor(.lightGray, for: .normal)
    
      } else {
        self.isEnabled = true
        self.backgroundColor = .lightGray
        self.setTitleColor(.white, for: .normal)
      }
    }
  }
  
  override init(frame: CGRect) {
      super.init(frame: frame)
      self.addTarget(self, action: #selector(onClick), for: .touchUpInside)
  }
  
  required init?(coder: NSCoder) {
      fatalError("init(coder:) has not been implemented")
  }
  
  @objc func onClick() {
    guard let onPress = self.onPress else {return}
    onPress([:]);
  }
}
