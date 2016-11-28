// Copyright (C) 2015 About Objects, Inc. All Rights Reserved.
// See LICENSE.txt for this example's licensing information.
//
import XCTest

let FahrenheitValues: [Double] = [-10, 0, 10, 32, 72, 100]
let format = "\n%5.1f°F equals %5.1f°C "

func toCelsius(_ fahrenheit: Double) -> Double
{
    return (fahrenheit - 32) * (5/9)
}


class Lab1Tests: XCTestCase
{
    func testIntMax()
    {
        print(Int8.max)
        print(UInt8.max)
        print(Int16.max)
        print(Int32.max)
        print(Int64.max)
    }
    
    func testConvertFahrenheitToCelsiusUsingForLoop()
    {
        for Fahrenheit in FahrenheitValues {
            let Celsius = toCelsius(Fahrenheit)
            let formattedValue = String(format: "%.1f", Celsius)
            print("\(Fahrenheit)°F equals \(formattedValue)°C")
            // NSLog(format, fahrenheit, toCelsius(fahrenheit))
        }
    }
    
    func testConvertFahrenheitToCelsiusUsingMap()
    {
        let CelsiusValues = FahrenheitValues.map { toCelsius($0) }
        print(CelsiusValues)
        
        let formattedValues = CelsiusValues.map { String(format: "%.1f", $0) }
        print(formattedValues)
    }
    
    func testConvertFahrenheitToCelsiusUsingMapReduce1()
    {
        let formattedValues = FahrenheitValues.map {
            String(format: format, $0, toCelsius($0))
        }
        let text = formattedValues.reduce("") { $0 + $1 }
        print(text)
    }

    
    func testConvertFahrenheitToCelsiusUsingMapReduce2()
    {
        print(FahrenheitValues
            .map { String(format: format, $0, toCelsius($0)) }
            .reduce("") { $0 + $1 })
    }
    
    func testConvertFahrenheitToCelsiusUsingTuples()
    {
        let tuples = FahrenheitValues.map { return (F: $0, C: toCelsius($0)) }
        
        let text = tuples.reduce("") {
            $0 + String(format: format, $1.F, $1.C)
        }
        print(text)
    }
}


