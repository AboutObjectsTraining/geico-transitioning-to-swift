import XCTest

class Lab4Tests: XCTestCase
{
    func testFirstNameOnly()
    {
        let fred = Contact()
        fred.firstName = "Fred"
        print(fred)
    }
    
    func testLastNameOnly()
    {
        let fred = Contact()
        fred.lastName = "Smith"
        print(fred)
    }
    
    func testLastAndFirst()
    {
        let fred = Contact()
        fred.firstName = "Fred"
        fred.lastName = "Smith"
        print(fred)
    }
    
    func testPhoneNumbers()
    {
        let fred = Contact()
        fred.firstName = "Fred"
        fred.lastName = "Smith"
        fred.phoneNumbers = [
            .Home: "987-654-3210",
            .Work: "876-543-2109"
        ]
        print(fred)
    }
}
