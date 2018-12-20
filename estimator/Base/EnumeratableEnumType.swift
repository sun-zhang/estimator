//
//  EnumeratableEnumType.swift
//  estimator
//
//  Created by Sam Zhang on 2018/12/20.
//  Copyright © 2018 Sam Zhang. All rights reserved.
//

import Foundation

protocol EnumeratableEnumType {
    static var allValues: [Self] {get}
}
