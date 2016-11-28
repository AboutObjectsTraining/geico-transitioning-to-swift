//
// Copyright (C) 2016 About Objects, Inc. All Rights Reserved.
// See LICENSE.txt for this example's licensing information.
//
import XCTest

class OptionalsLabTests: XCTestCase
{
    func testInitializeCustomer() {
        let customer = Customer()
        customer.name = "Fred Smith"
        print(customer)
        
        customer.address = Address(street: "2 Elm", city: "Elmville", state: "VA")
        print(customer)
        customer.address?.street2 = "Apt B"
        print(customer)
    }
    
    func testCustomerNamed() {
        let customer = customers.customer(named: "Anna Graham")
        print(customer)
    }
}

