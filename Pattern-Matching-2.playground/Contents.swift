// Pattern Matching, Part 2: tuples, ranges & types
// http://alisoftware.github.io/swift/pattern-matching/2016/03/30/pattern-matching-2/

import UIKit

let point = CGPoint(x: 7, y: 0)
switch (point.x, point.y) {
  case (0,0): print("On the origin!")
  case (0,_): print("x=0: on Y-axis!")
  case (_,0): print("y=0: on X-axis!")
  case (let x, let y) where x == y: print("On y=x")
  default: print("Quite a random point here.")
}



let car: Character = "J"
switch car {
case "A", "E", "I", "O", "U", "Y": print("Vowel")
default: print("Consonant")
}



func charType(car: Character) -> String {
  switch car {
  case "A", "E", "I", "O", "U", "Y", "a", "e", "i", "o", "u", "y":
    return "Vowel"
  case "A"..."Z", "a"..."z":
    return "Consonant"
  default:
    return "Other"
  }
}
print("Jules Verne".characters.map(charType))
// Stop at first case which matches, cases are evaluated in order


let count = 7
switch count {
case Int.min..<0: print("Negative count, really?")
case 0: print("Nothing")
case 1: print("One")
case 2..<5: print("A few")
case 5..<10: print("Some")
default: print("Many")
}



protocol Medium {
  var title: String { get }
}
struct Book: Medium {
  let title: String
  let author: String
  let year: Int
}
struct Movie: Medium {
  let title: String
  let director: String
  let year: Int
}
struct WebSite: Medium {
  let url: NSURL
  let title: String
}

// And an array of Media to switch onto
let media: [Medium] = [
  Book(title: "20,000 leagues under the sea", author: "Jules Verne", year: 1870),
  Movie(title: "20,000 leagues under the sea", director: "Richard Fleischer", year: 1955)
]

for medium in media {
  // The title part of the protocol, so no need for a switch there
  print(medium.title)
  // But for the other properties, it depends on the type
  switch medium {
  case let b as Book:
    print("Book published in \(b.year)")
  case let m as Movie:
    print("Movie released in \(m.year)")
  case is WebSite:
    print("A WebSite with no date")
  default:
    print("No year info for \(medium)")
  }
}

