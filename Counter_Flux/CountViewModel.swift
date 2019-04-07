//
//  CountViewModel.swift
//  Counter_Flux
//
//  Created by 横山新 on 2019/02/21.
//  Copyright © 2019 ARATAYOKOYAMA. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa

final class CountViewModel {
    
    enum type {
        case up
        case down
    }
    
    private let _plussButtonDidTapStream = PublishSubject<Void>()
    private let _minusButtonDidTapStream = PublishSubject<Void>()
    private let _count = BehaviorRelay<Int>(value: 0)
    
    private let disposeBag = DisposeBag()
    
    private var countStore: CountStore
    private var countActionCreator: CountActionCreator
    
    init(with actionCreator: CountActionCreator = .shared, store: CountStore = .shared) {
        countActionCreator = actionCreator
        countStore = store
        
        _plussButtonDidTapStream.subscribe({ [weak self] _ in
            self?.count(type: .up)
        })
        .disposed(by: disposeBag)
        
        _minusButtonDidTapStream.subscribe({ [weak self] _ in
            self?.count(type: .down)
        })
        .disposed(by: disposeBag)
        
        countStore.count
            .bind(to: _count)
            .disposed(by: disposeBag)
    }
    
    private func count(type: type) {
        switch type {
        case .up:
            countActionCreator.countUP(count: _count.value)
        case .down:
            countActionCreator.countDown(count: _count.value)
        }
    }
}

// Input
extension CountViewModel {
    var plussButtonDidTap: AnyObserver<()> {
        return _plussButtonDidTapStream.asObserver()
    }
    
    var minusButtonDidTap: AnyObserver<()> {
        return _minusButtonDidTapStream.asObserver()
    }
}

// Output
extension CountViewModel {
    var count: Observable<Int> {
        return _count.asObservable()
    }
}
