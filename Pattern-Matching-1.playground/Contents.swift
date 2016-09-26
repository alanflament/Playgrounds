// Pattern Matching, Part 1: switch, enums & where clauses
// http://alisoftware.github.io/swift/pattern-matching/2016/03/27/pattern-matching-1/

import UIKit

enum Direction {
  case North, South, East, West
}

extension Direction: CustomStringConvertible {
  var description: String {
    switch self {
    case .North: return "⬆️"
    case .South: return "⬇️"
    case .East: return "➡️"
    case .West: return "⬅️"
    }
  }
}

Direction.East



enum Media {
  case Book(title: String, author: String, year: Int)
  case Movie(title: String, director: String, year: Int)
  case WebSite(url: NSURL, title: String)
}

extension Media {
  var mediaTitle: String {
    switch self {
    case .Book(title: let aTitle, author: _, year: _):
      return aTitle
    case .Movie(title: let aTitle, director: _, year: _):
      return aTitle
    case .WebSite(url: _, title: let aTitle):
      return aTitle
    }
  }
}

let book = Media.Book(title: "20,000 leagues under the sea", author: "Jules Verne", year: 1870)
book.mediaTitle



extension Media {
  func checkAuthor(author: String) -> Bool {
    switch self {
    case .Book(title: _, author: author, year: _): return true
    case .Movie(title: _, director: author, year: _): return true
    default: return false
    }
  }
}

book.checkAuthor(author: "Jules Verne")



//enum Response {
//  case HTTPResponse(statusCode: Int)
//  case NetworkError(NSError)
//  …
//}

//let response: Response = …
//switch response {
//case .HTTPResponse(200): …
//case .HTTPResponse(404): …
//  …
//}

// cleaner than using stuff like `case .HTTPResponse(let code) where code == 200`, right?



extension Media {
  var mediaTitle2: String {
    switch self {
    case let .Book(aTitle, _, _), let .Movie(aTitle, _, _):
      return aTitle
    case let .WebSite(_, aTitle):
      return aTitle
    }
  }
}

book.mediaTitle2

let movie = Media.Movie(title: "Pulp Fiction", director: "Quentin Tarantino", year: 1994)
movie.mediaTitle2



extension Media {
  var mediaTitle3: String {
    switch self {
    case let .Book(tuple): return tuple.title
    case let .Movie(tuple): return tuple.title
    case let .WebSite(tuple): return tuple.title
    }
  }
}

movie.mediaTitle3



extension Media {
  var publishedAfter1930: Bool {
    switch self {
    case let .Book(_, _, year) where year > 1930: return true
    case let .Movie(_, _, year) where year > 1930: return true
    case .WebSite: return true // same as "case .WebSite(_)" but we ignore the associated tuple value
    default: return false
    }
  }
}

book.publishedAfter1930
movie.publishedAfter1930


