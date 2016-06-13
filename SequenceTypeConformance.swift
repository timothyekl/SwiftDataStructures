extension OrderedDictionary : SequenceType {
  func generate() -> OrderedDictionaryGenerator<key, value> {
    return OrderedDictionaryGenerator<key, value>(orderedDictionary: self)
  }
}

struct OrderedDictionaryGenerator<key: Hashable, value>: GeneratorType {

  var orderedDictionary: OrderedDictionary<key, value>
  var index = 0
  
  init(orderedDictionary: OrderedDictionary<key, value>) {
    self.orderedDictionary = orderedDictionary
  }
  
  mutating func next() ->  (key, value)? {
    if index < orderedDictionary.count {
      let key = orderedDictionary.keys[index]
      let value = orderedDictionary[index]
      index += 1
      return(key, value!)
    } else {
      index = 0
      return nil
    }
  }
}
