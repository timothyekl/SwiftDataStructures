//
//  OrderedDictionary.swift
//  SwiftDataStructures
//
//  Created by Tim Ekl on 6/2/14.
//  Copyright (c) 2014 Tim Ekl. All rights reserved.
//

import Foundation

struct OrderedDictionary<Tk: Hashable, Tv> {
    var keys: Array<Tk> = []
    var values: Dictionary<Tk,Tv> = [:]
    
    var count: Int {
    assert(keys.count == values.count, "Keys and values array out of sync")
    return self.keys.count;
    }
    
    // Explicitly define an empty initializer to prevent the default memberwise initializer from being generated
    init() {}
    
    subscript(index: Int) -> Tv? {
        get {
            let key = self.keys[index]
            return self.values[key]
        }
        set(newValue) {
            let key = self.keys[index]
            if newValue.hasValue {
                self.values[key] = newValue
            } else {
                self.values.removeValueForKey(key)
                self.keys.removeAtIndex(index)
            }
        }
    }
    
    subscript(key: Tk) -> Tv? {
        get {
            return self.values[key]
        }
        set(newValue) {
            if !newValue.hasValue {
                self.values.removeValueForKey(key)
                self.keys = self.keys.filter {$0 != key}
                return
            }
            
            let oldValue = self.values.updateValue(newValue!, forKey: key)
            if !oldValue.hasValue {
                self.keys.append(key)
            }
        }
    }
    
    var description: String {
        var result = "{\n"
        for i in 0..self.count {
            result += "[\(i)]: \(self.keys[i]) => \(self[i])\n"
        }
        result += "}"
        return result
    }
}
