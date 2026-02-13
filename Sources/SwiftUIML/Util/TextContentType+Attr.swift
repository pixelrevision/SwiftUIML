import SwiftUI
import SwiftUIMLCore

extension UITextContentType {
  // swiftlint:disable:next cyclomatic_complexity
  init?(_ value: AttributeValue) {
    switch value.string {
    // Names
    case "name":
      self = .name
    case "namePrefix":
      self = .namePrefix
    case "givenName":
      self = .givenName
    case "middleName":
      self = .middleName
    case "familyName":
      self = .familyName
    case "nameSuffix":
      self = .nameSuffix
    case "nickname":
      self = .nickname

    // Contact information
    case "emailAddress":
      self = .emailAddress
    case "telephoneNumber":
      self = .telephoneNumber
    case "URL":
      self = .URL

    // Address
    case "streetAddressLine1":
      self = .streetAddressLine1
    case "streetAddressLine2":
      self = .streetAddressLine2
    case "fullStreetAddress":
      self = .fullStreetAddress
    case "addressCity":
      self = .addressCity
    case "addressState":
      self = .addressState
    case "addressCityAndState":
      self = .addressCityAndState
    case "postalCode":
      self = .postalCode
    case "countryName":
      self = .countryName

    // Organization
    case "organizationName":
      self = .organizationName
    case "jobTitle":
      self = .jobTitle

    // Authentication
    case "username":
      self = .username
    case "password":
      self = .password
    case "newPassword":
      self = .newPassword
    case "oneTimeCode":
      self = .oneTimeCode

    // Payment
    case "creditCardNumber":
      self = .creditCardNumber

    // Date and time
    case "birthdate":
      self = .birthdate
    case "birthdateDay":
      self = .birthdateDay
    case "birthdateMonth":
      self = .birthdateMonth
    case "birthdateYear":
      self = .birthdateYear
    case "dateTime":
      self = .dateTime

    // Location
    case "location":
      self = .location

    // Tracking
    case "flightNumber":
      self = .flightNumber
    case "shipmentTrackingNumber":
      self = .shipmentTrackingNumber

    default:
      return nil
    }
  }
}
