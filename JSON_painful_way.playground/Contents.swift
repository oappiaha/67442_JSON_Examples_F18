
import Foundation

let githubURL: NSURL = NSURL(string: "https://api.github.com/search/repositories?q=language:swift&sort=stars&order=desc")!

let data = NSData(contentsOf: githubURL as URL)!

var logins = [String]()

do {
  let json = try JSONSerialization.jsonObject(with: data as Data, options: .allowFragments) as! [String:AnyObject]
  
  // Doing it the painful way first...
  
  if let items = json["items"] as? [NSDictionary] {
    for item in items {
      //    print("Optional Binding: \(item)")
      if let ownerData = item["owner"] as? NSDictionary {
        //        print("Optional Binding: \(ownerData)")
        for ownerItem in ownerData {
          //          print("Optional Binding: \(ownerItem)")
          if let lhdata = ownerItem.0 as? String {
            if lhdata == "login" {
              if let rhdata = ownerItem.1 as? String {
                logins.append(rhdata)
              }
            }
          }
        }
      }
    }
  }
} catch {
  print("error serializing JSON: \(error)")
}

print("\n---------\n")
print(logins)
