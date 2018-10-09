import Foundation

let forecastURL: NSURL = NSURL(string: "http://api.openweathermap.org/data/2.5/weather?lat=40.443229&lon=-79.944137&APPID=ad83d72d867862de7a87faec3178ffa6")!

let data = NSData(contentsOf: forecastURL as URL)!

var results = [(key: AnyObject, value: AnyObject)]()

//do {

  // get the data as json and then parse it,
  // adding each (key,value) pair in the forecast
  // to the results array and also print out a special
  // line "Temp is: \(whatever_value_from_forecast_json)"
  // when you parse the temp part of the forecast.
  
  
  
  
  
  
  
  
//} catch {
//  print("error serializing JSON: \(error)")
//}

print("  ")
print(results)

//============================//
// Now try this the SwiftyJSON way (SwiftyJSON already added to repo)

let swiftyjson = try JSON(data: data as Data)

if let temp_data = swiftyjson["main"]["temp"].float {
  print("Temp is: \(temp_data)")
}

