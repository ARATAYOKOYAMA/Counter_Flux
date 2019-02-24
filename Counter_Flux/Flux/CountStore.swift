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
    
    private let disposeBag = DisposeBag()
    private let CountStream = PublishRelay<Count>()
    
    init(with dispatcher: Dispatcher = .shared) {
        
        dispatcher.register(handler: { [weak self] (action: CountAction) in
            guard let `self` = self else { return }
            
            switch action {
            case .plussButtonDidtap:
                self.countUP()
            case .minusButtonDidtap:
                self.countDown()
            case .fetchCount:
                print("fetch")
            }
            
        }).disposed(by: disposeBag)
    }
    
    // MARK: Output
    var count: Observable<Count> {
        return CountStream.asObservable()
    }
    
    // MARK: Input
    private func countUP() {
        
    }

    private func countDown() {
        
    }
    
}
