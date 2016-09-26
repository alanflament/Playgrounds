// Pattern Matching, Part 3: Custom pattern matching & syntactic sugar
// http://alisoftware.github.io/swift/pattern-matching/2016/04/24/pattern-matching-3/

import UIKit
import Foundation
import CoreFoundation

struct Affine {
  var a: Int
  var b: Int
}

func ~= (lhs: Affine, rhs: Int) -> Bool {
  return rhs % lhs.a == lhs.b
}

switch 5 {
case Affine(a: 2, b: 0): print("Even number")
case Affine(a: 3, b: 1): print("3x+1")
case Affine(a: 3, b: 2): print("3x+2")
default: print("Other")
}



struct Book {
  let title: String
  let author: String
  let year: Int
}

func ~= (lhs: Range<Int>, rhs: Book) -> Bool {
  return lhs ~= rhs.year
}

let aBook = Book(title: "20,000 leagues under the sea", author: "Jules Vernes", year: 1870)
switch aBook {
case 1800..<1900: print("19th century book")
case 1900..<2000: print("20th century book")
default: print("Other century")
}



struct Answer {
  let text: String
  let compareOptions: NSString.CompareOptions = [.caseInsensitive, .diacriticInsensitive, .widthInsensitive]
}

func ~= (lhs: Answer, rhs: String) -> Bool {
  return lhs.text.compare(rhs, options: lhs.compareOptions, range: nil, locale: nil) == ComparisonResult.orderedSame
}

let question = "What's the French word for a face-to-face meeting?"
let userAnswer = "Tete a Tete"

switch userAnswer {
case Answer(text: "tête-à-tête"): print("Good answer!")
case Answer(text: "tête à tête"): print("Almost… don't forget dashes!")
default: print("Sorry, wrong answer!")
}



let anOptional: Int? = 2
switch anOptional {
case 0?: print("Zero")
case 1?: print("One")
case 2?: print("Two")
case nil: print("None")
default: print("Other")
}



enum MenuItem: Int {
  case Home
  case Account
  case Settings
}

guard let menuItem = MenuItem(rawValue: 2) else { fatalError("Invalid indexPath!") } // ex: used with indexPath.row
switch menuItem {
case .Home: print("home")
case .Account: print("account")
case .Settings: print("settings")
}

