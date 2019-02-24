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
    
    struct Dependency {
        let countStore: CountStore
        let actionCreator: CountActionCreator
    }
    
    private let disposeBag = DisposeBag()
    
    private let viewWillAppearStream = PublishSubject<Void>()
    private let plussButtonDidTapStream = PublishSubject<Void>()
    private let minusButtonDidTapStream = PublishSubject<Void>()
    
    var viewWillAppear: AnyObserver<()> {
        return viewWillAppearStream.asObserver()
    }
    
    var plussButtonDidTap: AnyObserver<()> {
        return plussButtonDidTapStream.asObserver()
    }
    
    var minusButtonDidTap: AnyObserver<()> {
        return minusButtonDidTapStream.asObserver()
    }
    
    private let countStore: CountStore
    private let countActionCreator: CountActionCreator
    
    init(with dependency: Dependency) {
        
        CountActionCreator = dependency.actionCreator
        
        
//        viewWillAppearStream
//            .flatMapLatest { _ -> Observable<Int> in
//                return model.fetchCount()
//            }
//            .bind(to: countStream)
//            .disposed(by: disposeBag)
//
//        plussButtonDidTapStream.subscribe(onNext: { [] in
//            model.countUp()
//        })
//            .disposed(by: disposeBag)
//
//        minusButtonDidTapStream.subscribe(onNext: { [] in
//            model.countDown()
//        })
//            .disposed(by: disposeBag)
        
    }
}
