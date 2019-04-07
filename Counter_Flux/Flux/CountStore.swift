//
//  SampleStore.swift
//  Counter_Flux
//
//  Created by 横山新 on 2019/02/21.
//  Copyright © 2019 ARATAYOKOYAMA. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa

final class CountStore: Store {
    
    static let shared = CountStore()
    
    private let disposeBag = DisposeBag()
    // MARK: Output
    var count: Observable<Int> {
        return _countStream.asObservable()
    }
    private let _countStream = BehaviorRelay<Int>(value: 0)
    
    init(with dispatcher: Dispatcher = .shared) {
        
        dispatcher.register(handler: { [weak self] (action: CountAction) in
            guard let `self` = self else { return }
            switch action {
            case .plussButtonDidtap(let count):
                self._countStream.accept(count)
            case .minusButtonDidtap(let count):
                self._countStream.accept(count)
            }
            
        }).disposed(by: disposeBag)
    }
    
}
