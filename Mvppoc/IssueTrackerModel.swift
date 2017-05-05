//
//  IssueTrackerModel.swift
//  Mvppoc
//
//  Created by Puja Kumari on 5/5/17.
//  Copyright © 2017 nineleaps. All rights reserved.
//

import Foundation
import Moya
import Mapper
import Moya_ModelMapper
import RxOptional
import RxSwift

struct IssueTrackerModel {
    
    let provider: RxMoyaProvider<GitHub>
    let repositoryName: Observable<String>
    
    func trackIssues() -> Observable<[Issue]> {
        
    }
    
    internal func findIssues(repository: Repository) -> Observable<[Issue]?> {
        
    }
    
    internal func findRepository(name: String) -> Observable<Repository?> {
        
    }
}
