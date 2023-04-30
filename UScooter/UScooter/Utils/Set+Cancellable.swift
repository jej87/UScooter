//
//  Set+Cancellable.swift
//  UScooter
//
//  Created by Justine-Marie Joseph on 4/18/23.
//

import Combine

extension Set where Element: Cancellable {

    func cancel() {
        forEach { $0.cancel() }
    }
}

