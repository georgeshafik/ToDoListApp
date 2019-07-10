import Foundation

func square(x: Int) -> Int {
  return x * x
}

var num: Int? = nil

if let newnum = num {
  print(square(x: newnum))
} else {
  print("num is nill")       // prints - num is nill
}

print(num.map(square))

num = 10

print(num.map(square))

func each(array: [Int], callback: (Int, Int) -> Void) {
  for i in 0..<array.count {
    callback(i, array[i])
  }
}
