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

final class CountActionCreator {
    
    static let shared = CountActionCreator()
    
    var dispatcher: Dispatcher
    
    private let disposeBag = DisposeBag()
    
    init(with dispatcher: Dispatcher = .shared) {
        self.dispatcher = dispatcher
    }
    
    func countUP() {
        dispatcher.dispatch(CountAction.plussButtonDidtap)
    }
    
    func countDown() {
        dispatcher.dispatch(CountAction.minusButtonDidtap)
    }
    
    func fetchCount() {
        dispatcher.dispatch(CountAction.fetchCount)
    }
}
