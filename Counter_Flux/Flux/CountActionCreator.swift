//
//  SampleActionCreator.swift
//  Counter_Flux
//
//  Created by 横山新 on 2019/02/13.
//  Copyright © 2019 ARATAYOKOYAMA. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa

final class CountActionCreator: ActionCreator {
    
    static let shared = CountActionCreator()
    
    var dispatcher: Dispatcher
    
    private let disposeBag = DisposeBag()
    
    init(with dispatcher: Dispatcher = .shared) {
        self.dispatcher = dispatcher
    }
    
    func countUP(count: Int) {
        dispatcher.dispatch(CountAction.plussButtonDidtap(count + 1))
    }
    
    func countDown(count: Int) {
        dispatcher.dispatch(CountAction.minusButtonDidtap(count - 1))
    }
    
}
