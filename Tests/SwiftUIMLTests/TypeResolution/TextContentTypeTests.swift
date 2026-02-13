import SwiftUI
import SwiftUIMLCore
import XCTest

@testable import SwiftUIML

final class TextContentTypeTests: XCTestCase {
  func testTextContentTypeName() {
    let result = UITextContentType(AttributeValue("name"))
    XCTAssertNotNil(result)
  }

  func testTextContentTypeNamePrefix() {
    let result = UITextContentType(AttributeValue("namePrefix"))
    XCTAssertNotNil(result)
  }

  func testTextContentTypeGivenName() {
    let result = UITextContentType(AttributeValue("givenName"))
    XCTAssertNotNil(result)
  }

  func testTextContentTypeMiddleName() {
    let result = UITextContentType(AttributeValue("middleName"))
    XCTAssertNotNil(result)
  }

  func testTextContentTypeFamilyName() {
    let result = UITextContentType(AttributeValue("familyName"))
    XCTAssertNotNil(result)
  }

  func testTextContentTypeNameSuffix() {
    let result = UITextContentType(AttributeValue("nameSuffix"))
    XCTAssertNotNil(result)
  }

  func testTextContentTypeNickname() {
    let result = UITextContentType(AttributeValue("nickname"))
    XCTAssertNotNil(result)
  }

  func testTextContentTypeEmailAddress() {
    let result = UITextContentType(AttributeValue("emailAddress"))
    XCTAssertNotNil(result)
  }

  func testTextContentTypeTelephoneNumber() {
    let result = UITextContentType(AttributeValue("telephoneNumber"))
    XCTAssertNotNil(result)
  }

  func testTextContentTypeURL() {
    let result = UITextContentType(AttributeValue("URL"))
    XCTAssertNotNil(result)
  }

  func testTextContentTypeStreetAddressLine1() {
    let result = UITextContentType(AttributeValue("streetAddressLine1"))
    XCTAssertNotNil(result)
  }

  func testTextContentTypeStreetAddressLine2() {
    let result = UITextContentType(AttributeValue("streetAddressLine2"))
    XCTAssertNotNil(result)
  }

  func testTextContentTypeFullStreetAddress() {
    let result = UITextContentType(AttributeValue("fullStreetAddress"))
    XCTAssertNotNil(result)
  }

  func testTextContentTypeAddressCity() {
    let result = UITextContentType(AttributeValue("addressCity"))
    XCTAssertNotNil(result)
  }

  func testTextContentTypeAddressState() {
    let result = UITextContentType(AttributeValue("addressState"))
    XCTAssertNotNil(result)
  }

  func testTextContentTypeAddressCityAndState() {
    let result = UITextContentType(AttributeValue("addressCityAndState"))
    XCTAssertNotNil(result)
  }

  func testTextContentTypePostalCode() {
    let result = UITextContentType(AttributeValue("postalCode"))
    XCTAssertNotNil(result)
  }

  func testTextContentTypeCountryName() {
    let result = UITextContentType(AttributeValue("countryName"))
    XCTAssertNotNil(result)
  }

  func testTextContentTypeOrganizationName() {
    let result = UITextContentType(AttributeValue("organizationName"))
    XCTAssertNotNil(result)
  }

  func testTextContentTypeJobTitle() {
    let result = UITextContentType(AttributeValue("jobTitle"))
    XCTAssertNotNil(result)
  }

  func testTextContentTypeUsername() {
    let result = UITextContentType(AttributeValue("username"))
    XCTAssertNotNil(result)
  }

  func testTextContentTypePassword() {
    let result = UITextContentType(AttributeValue("password"))
    XCTAssertNotNil(result)
  }

  func testTextContentTypeNewPassword() {
    let result = UITextContentType(AttributeValue("newPassword"))
    XCTAssertNotNil(result)
  }

  func testTextContentTypeOneTimeCode() {
    let result = UITextContentType(AttributeValue("oneTimeCode"))
    XCTAssertNotNil(result)
  }

  func testTextContentTypeCreditCardNumber() {
    let result = UITextContentType(AttributeValue("creditCardNumber"))
    XCTAssertNotNil(result)
  }

  func testTextContentTypeBirthdate() {
    let result = UITextContentType(AttributeValue("birthdate"))
    XCTAssertNotNil(result)
  }

  func testTextContentTypeBirthdateDay() {
    let result = UITextContentType(AttributeValue("birthdateDay"))
    XCTAssertNotNil(result)
  }

  func testTextContentTypeBirthdateMonth() {
    let result = UITextContentType(AttributeValue("birthdateMonth"))
    XCTAssertNotNil(result)
  }

  func testTextContentTypeBirthdateYear() {
    let result = UITextContentType(AttributeValue("birthdateYear"))
    XCTAssertNotNil(result)
  }

  func testTextContentTypeDateTime() {
    let result = UITextContentType(AttributeValue("dateTime"))
    XCTAssertNotNil(result)
  }

  func testTextContentTypeLocation() {
    let result = UITextContentType(AttributeValue("location"))
    XCTAssertNotNil(result)
  }

  func testTextContentTypeFlightNumber() {
    let result = UITextContentType(AttributeValue("flightNumber"))
    XCTAssertNotNil(result)
  }

  func testTextContentTypeShipmentTrackingNumber() {
    let result = UITextContentType(AttributeValue("shipmentTrackingNumber"))
    XCTAssertNotNil(result)
  }

  func testTextContentTypeInvalid() {
    let result = UITextContentType(AttributeValue("invalid"))
    XCTAssertNil(result)
  }
}
