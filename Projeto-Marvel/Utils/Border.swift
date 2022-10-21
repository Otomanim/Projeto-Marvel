//
//  Border.swift
//  Projeto-Marvel
//
//  Created by Evandro Rodrigo Minamoto on 22/08/21.
//

import Foundation
import UIKit
class Border{
    
}
extension UIButton {
    
    /// <#Description#>
    /// - Parameters:
    ///   - bordeColor: <#bordeColor description#>
    ///   - borderWidth: <#borderWidth description#>
    func borderButton(bordeColor: UIColor? = .white, borderWidth: CGFloat? = 1.0) {
        
        self.layer.borderWidth = borderWidth ?? 0
        self.layer.borderColor = bordeColor?.cgColor
        
    }
}
extension UITextField {
    
    /// <#Description#>
    /// - Parameters:
    ///   - bordeColor: <#bordeColor description#>
    ///   - borderWidth: <#borderWidth description#>
    func borderTextField(bordeColor: UIColor? = .white, borderWidth: CGFloat? = 1.0) {
        
        self.layer.borderWidth = borderWidth ?? 0
        self.layer.borderColor = bordeColor?.cgColor
        
        
    }
    
}
extension UIView {
    
    /// <#Description#>
    /// - Parameters:
    ///   - bordeColor: <#bordeColor description#>
    ///   - borderWidth: <#borderWidth description#>
    func borderView(bordeColor: UIColor? = .white, borderWidth: CGFloat? = 1.0){
        
        self.layer.borderWidth = borderWidth ?? 0
        self.layer.borderColor = bordeColor?.cgColor
    }
}
