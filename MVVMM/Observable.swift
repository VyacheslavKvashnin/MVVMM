//
//  Observable.swift
//  MVVMM
//
//  Created by Вячеслав Квашнин on 16.08.2022.
//

import Foundation

class Observable<T> {
    var listener: ((T?) -> Void)?
    
    var value: T? {
        didSet {
            listener?(value)
        }
    }
    
    func bind(_ closure: @escaping (T?) -> Void) {
        listener = closure
        listener?(value)
    }
    
    init(_ value: T?) {
        self.value = value
    }
}
