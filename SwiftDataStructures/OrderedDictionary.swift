//
//  Bijection.swift
//  SwiftDataStructures
//
//  Created by Tim Ekl on 6/2/14.
//  Copyright (c) 2014 Tim Ekl. All rights reserved.
//

import Foundation

struct OrderedDictionary<Tk: Hashable,Tv> {
    var keys: Array<Tk>
    var values: Dictionary<Tk,Tv>
}
