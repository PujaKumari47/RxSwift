//
//  BallViewModel.swift
//  Mvppoc
//
//  Created by Puja Kumari on 5/3/17.
//  Copyright © 2017 nineleaps. All rights reserved.
//

import Foundation
import ChameleonFramework
import Foundation
import RxSwift
import RxCocoa

class BallViewModel {
    
    var centerVariable = Variable<CGPoint?>(.zero)
    var backgroundColorObservable: Observable<UIColor>!
    
    init() {
        setup()
    }
   
    func setup() {
        // When we get new center, emit new UIColor
        backgroundColorObservable = centerVariable.asObservable()
            .map { center in
                guard let center = center else { return UIColor.flatten(.black)() }
                
                let red: CGFloat = ((center.x + center.y).truncatingRemainder(dividingBy: 255.0)) / 255.0 // We just manipulate red, but you can do w/e
                let green: CGFloat = 0.0
                let blue: CGFloat = 0.0
                
                return UIColor.flatten(UIColor(red: red, green: green, blue: blue, alpha: 1.0))()
        }
    }
}
