import XCTest

class MiscTests: XCTestCase
{
    override func setUp() { print("") }
    override func tearDown() { print("") }
    
    func testStrings()
    {
        let emojiText = "Hello World! 😊 🌍 "
        print(emojiText.characters.count)
    }

    func testCreateDog()
    {
        let rover = Dog()
        rover.isPet = true;
        rover.name = "Rover"
        rover.barkText = "Bow, wow!"
        
        print(rover.description())
        
        print("Address is \(Unmanaged.passUnretained(rover).toOpaque()) ")
        
        print(rover.numberOfLegs)
    }

    var path: String { return Bundle(for: type(of: self)).path(forResource: "Info", ofType: ".plist")! }
    
    func testFileHandle()
    {
        do {
            try showFile(atPath: path)
        }
        catch FileError.nonexistent(let message) { // unwraps associated value
            print(message)
        }
        catch is FileError {
            print("Some other file error occurred.")
        }
        catch {
            print("Unexpected error.")
        }
        
        print("End of test")
    }
    
    func testMatchingPhones() {
        let contact = ContactInfo()
        
        // Calling method with trailing closure
        let phonesMatchingAreaCodes = contact.phones() { key, value in
            value.hasPrefix("914")
        }
        print(phonesMatchingAreaCodes)
        // produces ["other:": "914-456-7890", "mobile": "914-789-1234"]

        // When the only param is a trailing closure, parameter list can be ommitted entirely
        let daytimePhones = contact.phones { key, value in
            key == "work" || key == "mobile"
        }
        print(daytimePhones)
        // produces ["mobile": "914-789-1234", "work": "516-456-7890"]
        
        
        let areaCode = "914"
        
        let phonesMatchingCapturedValue = contact.phones { key, value in
            value.hasPrefix(areaCode)
        }
        
        print(phonesMatchingCapturedValue)
        // produces ["other:": "914-456-7890", "mobile": "914-789-1234"]
        
        let daytimePhonesWithCapturedValue = contact.phones { [unowned self] key, value in
            self.daytimeKeys.contains(key)
        }
        print(daytimePhonesWithCapturedValue)
        // produces ["mobile": "914-789-1234", "work": "516-456-7890"]
    }
    
    var daytimeKeys = Set(["work", "mobile"])
}

struct ContactInfo {
    let phones = [
        "home": "202-123-4567",
        "work": "516-456-7890",
        "mobile": "914-789-1234",
        "other:": "914-456-7890"
    ]
    
    // method with single argument of type closure
    func phones(matching: (String, String) -> Bool) -> [String: String] {
        var matchedPhones = [String: String]()
        for (key, value) in phones {
            if matching(key, value) {
                matchedPhones[key] = value
            }
        }
        return matchedPhones
    }
}

enum FileError: Error {
    case unknown
    case nonexistent(String) // Note: associated value
}

func showFile(atPath path: String) throws {
    guard let fileHandle = FileHandle(forReadingAtPath: path) else {
        // throws error with associated value
        throw FileError.nonexistent("No file at path \(path)")
    }
    
    defer {
        fileHandle.closeFile()
        print("Closed fileHandle \(fileHandle)")
    }
    
    let data = fileHandle.readDataToEndOfFile()
    FileHandle.standardOutput.write(data)
}

