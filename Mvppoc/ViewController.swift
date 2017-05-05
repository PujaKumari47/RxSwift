//
//  ViewController.swift
//  Mvppoc
//
//  Created by Puja Kumari on 5/2/17.
//  Copyright © 2017 nineleaps. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa
import Moya
import Moya_ModelMapper

class ViewController: UIViewController,UITableViewDelegate,UITableViewDataSource{
    var shownCities = [String]()
    let allCities = ["NewYork","Goa","India","Patna","Gaya","Ranchi","Jaipur","Gorakhpur","BodhGaya","Raipur","Rampur","Durga","Rajasthan"]
    
    let disposeBag = DisposeBag()
    let ballViewController = BallViewController()
    
    @IBOutlet weak var tableViewOutlet: UITableView!
    @IBOutlet weak var searchBarOutlet: UISearchBar!
    
    override func viewDidLoad() {
        super.viewDidLoad()
            searchBarOutlet
            .rx.text
            .orEmpty
            .debounce(0.5,scheduler: MainScheduler.instance)
            .distinctUntilChanged()
            .filter { !$0.isEmpty }
            .subscribe(onNext: { [unowned self] query in // Here we will be notified of every new value
                self.shownCities = self.allCities.filter { $0.hasPrefix(query) } // We now do our "API Request" to find cities.
                self.tableViewOutlet.reloadData() // And reload table view data.
            })
            .addDisposableTo(disposeBag)
        self.tableViewOutlet.delegate = self
        self.tableViewOutlet.dataSource = self
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return shownCities.count
    }
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 64
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellIodentifier = "shownCityCell"
        let cell = tableViewOutlet.dequeueReusableCell(withIdentifier: cellIodentifier, for: indexPath)
        cell.textLabel!.text = shownCities[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        ballViewController.label.text = shownCities[indexPath.row]
        print(ballViewController.label.text)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

