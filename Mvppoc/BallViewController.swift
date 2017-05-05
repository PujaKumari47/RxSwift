//
//  BallViewController.swift
//  Mvppoc
//
//  Created by Puja Kumari on 5/3/17.
//  Copyright © 2017 nineleaps. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa
import ChameleonFramework

class BallViewController: ViewController {
    @IBOutlet weak var ballView: UIView!
    @IBOutlet weak var cityLabel: UILabel!
   
    let label = UILabel()
    //let disposeBag = DisposeBag()
    override func viewDidLoad() {
        super.viewDidLoad()
        setUp()
        setupRx()
        
    }
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
//        label.textColor = .white
//        let frame = CGRect(x: 140, y: 300, width: 30, height: 30)
//        label.frame = frame
//        label.textAlignment = .center
//        label.text = "abc"
//        self.ballView.addSubview(label)
    }
    func setUp() {
    self.ballView.layer.cornerRadius = self.ballView.frame.width/2
    self.ballView.clipsToBounds = true
    self.cityLabel.text = label.text
    print("cityLabel",self.cityLabel.text)
    self.cityLabel.textColor = UIColor.blue
      
        let circleViewModel = BallViewModel()
        // Bind the center point of the CircleView to the centerObservable
        ballView
            .rx.observe(CGPoint.self, "center")
            .bindTo(circleViewModel.centerVariable)
            .addDisposableTo(disposeBag)
        
        // Subscribe to backgroundObservable to get new colors from the ViewModel.
        circleViewModel.backgroundColorObservable
            .subscribe(onNext: { [weak self] backgroundColor in
                UIView.animate(withDuration: 0.1) {
                    self?.ballView.backgroundColor = backgroundColor
                    // Try to get complementary color for given background color
                    let viewBackgroundColor = UIColor(complementaryFlatColorOf: backgroundColor)
                    // If it is different that the color
                    if viewBackgroundColor != backgroundColor {
                        // Assign it as a background color of the view
                        // We only want different color to be able to see that circle in a view
                        self?.view.backgroundColor = viewBackgroundColor
                    }
                }
            })
            .addDisposableTo(disposeBag)
        // Add gesture recognizer
        let gestureRecognizer = UIPanGestureRecognizer(target: self, action: #selector(circleMoved(_:)))
        ballView.addGestureRecognizer(gestureRecognizer)
    }
    
    func setupRx() {
    
        provider = RxMoyaProvider<GitHub>()
        
        // Here we tell table view that if user clicks on a cell,
        // and the keyboard is still visible, hide it
        tableViewOutlet
            .rx.itemSelected
            .subscribe(onNext: { indexPath in
                if self.searchBarOutlet.isFirstResponder == true {
                    self.view.endEditing(true)
                }
            })
            .addDisposableTo(disposeBag)
    }
    
    func circleMoved(_ recognizer: UIPanGestureRecognizer) {
        let location = recognizer.location(in: view)
        UIView.animate(withDuration: 0.1) {
            self.ballView.center = location
        }
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

 

}
