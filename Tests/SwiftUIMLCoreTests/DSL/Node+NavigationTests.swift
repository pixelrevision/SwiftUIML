import XCTest
@testable import SwiftUIMLCore

final class NodeNavigationTests: XCTestCase {
  // MARK: - Sheet Tests

  func testSheetWithSingleNode() {
    let sheetContent = TextNode("Sheet Content")
    let node = VStackNode {
      TextNode("Main")
    }
    .sheet(content: sheetContent)

    let sheet = node.attributes[.sheet]?.dict
    XCTAssertNotNil(sheet)
    XCTAssertEqual(sheet?[.isPresented]?.bool, true)
    XCTAssertEqual(sheet?[.animated]?.bool, true)
    XCTAssertEqual(sheet?[.value]?.node?.type, .text)
  }

  func testSheetWithNodeBuilder() {
    let node = VStackNode {
      TextNode("Main")
    }
    .sheet {
      TextNode("Sheet Line 1")
      TextNode("Sheet Line 2")
    }

    let sheet = node.attributes[.sheet]?.dict
    XCTAssertNotNil(sheet)
    XCTAssertEqual(sheet?[.value]?.node?.type, .vStack)
    XCTAssertEqual(sheet?[.value]?.node?.children?.count, 2)
  }

  func testSheetWithAllOptions() {
    let sheetContent = TextNode("Sheet")
    let onPresented: AttributeValue = .dict([.action: "opened"])
    let onDismiss: AttributeValue = .dict([.action: "closed"])

    let node = VStackNode {
      TextNode("Main")
    }
    .sheet(
      id: "my-sheet",
      isPresented: false,
      animated: false,
      content: sheetContent,
      onPresented: onPresented,
      onDismiss: onDismiss
    )

    let sheet = node.attributes[.sheet]?.dict
    XCTAssertEqual(sheet?[.id]?.string, "my-sheet")
    XCTAssertEqual(sheet?[.isPresented]?.bool, false)
    XCTAssertEqual(sheet?[.animated]?.bool, false)
    XCTAssertEqual(sheet?[.onPresented]?.dict?[.action]?.string, "opened")
    XCTAssertEqual(sheet?[.onDismiss]?.dict?[.action]?.string, "closed")
  }

  func testSheetDefaults() {
    let node = VStackNode {
      TextNode("Main")
    }
    .sheet(content: TextNode("Sheet"))

    let sheet = node.attributes[.sheet]?.dict
    XCTAssertNil(sheet?[.id])
    XCTAssertEqual(sheet?[.isPresented]?.bool, true)
    XCTAssertEqual(sheet?[.animated]?.bool, true)
    XCTAssertNil(sheet?[.onPresented])
    XCTAssertNil(sheet?[.onDismiss])
  }

  // MARK: - FullScreenCover Tests

  func testFullScreenCoverWithSingleNode() {
    let coverContent = TextNode("Cover Content")
    let node = VStackNode {
      TextNode("Main")
    }
    .fullScreenCover(content: coverContent)

    let cover = node.attributes[.fullScreenCover]?.dict
    XCTAssertNotNil(cover)
    XCTAssertEqual(cover?[.isPresented]?.bool, true)
    XCTAssertEqual(cover?[.animated]?.bool, true)
    XCTAssertEqual(cover?[.value]?.node?.type, .text)
  }

  func testFullScreenCoverWithNodeBuilder() {
    let node = VStackNode {
      TextNode("Main")
    }
    .fullScreenCover {
      TextNode("Cover Line 1")
      TextNode("Cover Line 2")
    }

    let cover = node.attributes[.fullScreenCover]?.dict
    XCTAssertNotNil(cover)
    XCTAssertEqual(cover?[.value]?.node?.type, .vStack)
    XCTAssertEqual(cover?[.value]?.node?.children?.count, 2)
  }

  func testFullScreenCoverWithAllOptions() {
    let coverContent = TextNode("Cover")
    let onPresented: AttributeValue = .dict([.action: "opened"])
    let onDismiss: AttributeValue = .dict([.action: "closed"])

    let node = VStackNode {
      TextNode("Main")
    }
    .fullScreenCover(
      id: "my-cover",
      isPresented: false,
      animated: false,
      content: coverContent,
      onPresented: onPresented,
      onDismiss: onDismiss
    )

    let cover = node.attributes[.fullScreenCover]?.dict
    XCTAssertEqual(cover?[.id]?.string, "my-cover")
    XCTAssertEqual(cover?[.isPresented]?.bool, false)
    XCTAssertEqual(cover?[.animated]?.bool, false)
    XCTAssertEqual(cover?[.onPresented]?.dict?[.action]?.string, "opened")
    XCTAssertEqual(cover?[.onDismiss]?.dict?[.action]?.string, "closed")
  }

  func testFullScreenCoverDefaults() {
    let node = VStackNode {
      TextNode("Main")
    }
    .fullScreenCover(content: TextNode("Cover"))

    let cover = node.attributes[.fullScreenCover]?.dict
    XCTAssertNil(cover?[.id])
    XCTAssertEqual(cover?[.isPresented]?.bool, true)
    XCTAssertEqual(cover?[.animated]?.bool, true)
    XCTAssertNil(cover?[.onPresented])
    XCTAssertNil(cover?[.onDismiss])
  }

  // MARK: - Chaining Tests

  func testSheetCanBeChainedWithOtherModifiers() {
    let node = VStackNode {
      TextNode("Main")
    }
    .padding(20)
    .sheet(content: TextNode("Sheet"))
    .background(ColorNode("#FF0000"))

    XCTAssertEqual(node.attributes[.padding]?.float, 20)
    XCTAssertNotNil(node.attributes[.sheet])
    XCTAssertNotNil(node.attributes[.background])
  }

  func testFullScreenCoverCanBeChainedWithOtherModifiers() {
    let node = VStackNode {
      TextNode("Main")
    }
    .padding(20)
    .fullScreenCover(content: TextNode("Cover"))
    .background(ColorNode("#FF0000"))

    XCTAssertEqual(node.attributes[.padding]?.float, 20)
    XCTAssertNotNil(node.attributes[.fullScreenCover])
    XCTAssertNotNil(node.attributes[.background])
  }

  // MARK: - Alert Tests

  func testAlertWithBasicConfiguration() {
    let node = VStackNode {
      TextNode("Main")
    }
    .alert(
      title: "Delete Item?",
      message: "This action cannot be undone",
      isPresented: true,
      buttons: [
        .cancel("Cancel"),
        .destructive("Delete", action: .dict([.action: "deleteItem"])),
      ]
    )

    let alert = node.attributes[.alert]?.dict
    XCTAssertNotNil(alert)
    XCTAssertEqual(alert?[.title]?.string, "Delete Item?")
    XCTAssertEqual(alert?[.message]?.string, "This action cannot be undone")
    XCTAssertEqual(alert?[.isPresented]?.bool, true)

    let buttons = alert?[.buttons]?.array
    XCTAssertEqual(buttons?.count, 2)
    XCTAssertEqual(buttons?[0].dict?[.label]?.string, "Cancel")
    XCTAssertEqual(buttons?[0].dict?[.role]?.string, "cancel")
    XCTAssertEqual(buttons?[1].dict?[.label]?.string, "Delete")
    XCTAssertEqual(buttons?[1].dict?[.role]?.string, "destructive")
  }

  func testAlertWithoutMessage() {
    let node = VStackNode {
      TextNode("Main")
    }
    .alert(
      title: "Confirm",
      isPresented: true,
      buttons: [
        .default("OK"),
      ]
    )

    let alert = node.attributes[.alert]?.dict
    XCTAssertNotNil(alert)
    XCTAssertEqual(alert?[.title]?.string, "Confirm")
    XCTAssertNil(alert?[.message])
  }

  func testAlertWithOnDismiss() {
    let onDismiss: AttributeValue = .dict([.action: "alertDismissed"])

    let node = VStackNode {
      TextNode("Main")
    }
    .alert(
      title: "Alert",
      isPresented: true,
      buttons: [.default("OK")],
      onDismiss: onDismiss
    )

    let alert = node.attributes[.alert]?.dict
    XCTAssertEqual(alert?[.onDismiss]?.dict?[.action]?.string, "alertDismissed")
  }

  func testAlertDefaults() {
    let node = VStackNode {
      TextNode("Main")
    }
    .alert(
      title: "Test",
      buttons: []
    )

    let alert = node.attributes[.alert]?.dict
    XCTAssertEqual(alert?[.isPresented]?.bool, true)
    XCTAssertNil(alert?[.message])
    XCTAssertNil(alert?[.onDismiss])
  }

  func testAlertCanBeChainedWithOtherModifiers() {
    let node = VStackNode {
      TextNode("Main")
    }
    .padding(20)
    .alert(title: "Test", buttons: [.default("OK")])
    .background(ColorNode("#FF0000"))

    XCTAssertEqual(node.attributes[.padding]?.float, 20)
    XCTAssertNotNil(node.attributes[.alert])
    XCTAssertNotNil(node.attributes[.background])
  }

  // MARK: - Confirmation Dialog Tests

  func testConfirmationDialogWithBasicConfiguration() {
    let node = VStackNode {
      TextNode("Main")
    }
    .confirmationDialog(
      title: "Delete Item?",
      message: "This action cannot be undone",
      isPresented: true,
      buttons: [
        .cancel("Cancel"),
        .destructive("Delete", action: .dict([.action: "deleteItem"])),
      ]
    )

    let dialog = node.attributes[.confirmationDialog]?.dict
    XCTAssertNotNil(dialog)
    XCTAssertEqual(dialog?[.title]?.string, "Delete Item?")
    XCTAssertEqual(dialog?[.message]?.string, "This action cannot be undone")
    XCTAssertEqual(dialog?[.isPresented]?.bool, true)

    let buttons = dialog?[.buttons]?.array
    XCTAssertEqual(buttons?.count, 2)
    XCTAssertEqual(buttons?[0].dict?[.label]?.string, "Cancel")
    XCTAssertEqual(buttons?[0].dict?[.role]?.string, "cancel")
    XCTAssertEqual(buttons?[1].dict?[.label]?.string, "Delete")
    XCTAssertEqual(buttons?[1].dict?[.role]?.string, "destructive")
  }

  func testConfirmationDialogWithoutMessage() {
    let node = VStackNode {
      TextNode("Main")
    }
    .confirmationDialog(
      title: "Confirm",
      isPresented: true,
      buttons: [
        .default("OK"),
      ]
    )

    let dialog = node.attributes[.confirmationDialog]?.dict
    XCTAssertNotNil(dialog)
    XCTAssertEqual(dialog?[.title]?.string, "Confirm")
    XCTAssertNil(dialog?[.message])
  }

  func testConfirmationDialogWithOnDismiss() {
    let onDismiss: AttributeValue = .dict([.action: "dialogDismissed"])

    let node = VStackNode {
      TextNode("Main")
    }
    .confirmationDialog(
      title: "Test",
      buttons: [.default("OK")],
      onDismiss: onDismiss
    )

    let dialog = node.attributes[.confirmationDialog]?.dict
    XCTAssertNotNil(dialog)
    XCTAssertEqual(dialog?[.onDismiss]?.dict?[.action]?.string, "dialogDismissed")
  }

  func testConfirmationDialogDefaults() {
    let node = VStackNode {
      TextNode("Main")
    }
    .confirmationDialog(
      title: "Test",
      buttons: [.default("OK")]
    )

    let dialog = node.attributes[.confirmationDialog]?.dict
    XCTAssertNotNil(dialog)
    XCTAssertEqual(dialog?[.isPresented]?.bool, true)
  }

  func testConfirmationDialogCanBeChainedWithOtherModifiers() {
    let node = VStackNode {
      TextNode("Main")
    }
    .padding(20)
    .confirmationDialog(title: "Test", buttons: [.default("OK")])
    .background(ColorNode("#FF0000"))

    XCTAssertEqual(node.attributes[.padding]?.float, 20)
    XCTAssertNotNil(node.attributes[.confirmationDialog])
    XCTAssertNotNil(node.attributes[.background])
  }

  // MARK: - Popover Tests

  func testPopoverWithSingleNode() {
    let popoverContent = TextNode("Popover Content")
    let node = VStackNode {
      TextNode("Main")
    }
    .popover(content: popoverContent)

    let popover = node.attributes[.popover]?.dict
    XCTAssertNotNil(popover)
    XCTAssertEqual(popover?[.isPresented]?.bool, true)
    XCTAssertEqual(popover?[.animated]?.bool, true)
    XCTAssertEqual(popover?[.value]?.node?.type, .text)
  }

  func testPopoverWithNodeBuilder() {
    let node = VStackNode {
      TextNode("Main")
    }
    .popover {
      TextNode("Popover Line 1")
      TextNode("Popover Line 2")
    }

    let popover = node.attributes[.popover]?.dict
    XCTAssertNotNil(popover)
    XCTAssertEqual(popover?[.value]?.node?.type, .vStack)
    XCTAssertEqual(popover?[.value]?.node?.children?.count, 2)
  }

  func testPopoverWithAllOptions() {
    let popoverContent = TextNode("Popover")
    let onPresented: AttributeValue = .dict([.action: "opened"])
    let onDismiss: AttributeValue = .dict([.action: "closed"])

    let node = VStackNode {
      TextNode("Main")
    }
    .popover(
      id: "my-popover",
      isPresented: false,
      animated: false,
      content: popoverContent,
      onPresented: onPresented,
      onDismiss: onDismiss
    )

    let popover = node.attributes[.popover]?.dict
    XCTAssertEqual(popover?[.id]?.string, "my-popover")
    XCTAssertEqual(popover?[.isPresented]?.bool, false)
    XCTAssertEqual(popover?[.animated]?.bool, false)
    XCTAssertEqual(popover?[.onPresented]?.dict?[.action]?.string, "opened")
    XCTAssertEqual(popover?[.onDismiss]?.dict?[.action]?.string, "closed")
  }

  func testPopoverDefaults() {
    let node = VStackNode {
      TextNode("Main")
    }
    .popover(content: TextNode("Popover"))

    let popover = node.attributes[.popover]?.dict
    XCTAssertNil(popover?[.id])
    XCTAssertEqual(popover?[.isPresented]?.bool, true)
    XCTAssertEqual(popover?[.animated]?.bool, true)
    XCTAssertNil(popover?[.onPresented])
    XCTAssertNil(popover?[.onDismiss])
  }

  func testPopoverCanBeChainedWithOtherModifiers() {
    let node = VStackNode {
      TextNode("Main")
    }
    .padding(20)
    .popover(content: TextNode("Popover"))
    .background(ColorNode("#FF0000"))

    XCTAssertEqual(node.attributes[.padding]?.float, 20)
    XCTAssertNotNil(node.attributes[.popover])
    XCTAssertNotNil(node.attributes[.background])
  }

  // MARK: - NavigationStack Tests

  func testNavigationStackNodeWithSingleChild() {
    let node = NavigationStackNode {
      TextNode("Home")
    }

    XCTAssertEqual(node.type, .navigationStack)
    XCTAssertEqual(node.children?.count, 1)
    XCTAssertEqual(node.children?[0].type, .text)
  }

  func testNavigationStackNodeWithMultipleChildren() {
    let node = NavigationStackNode {
      TextNode("Title")
      TextNode("Subtitle")
      ButtonNode("Tap", onTap: "action")
    }

    XCTAssertEqual(node.type, .navigationStack)
    XCTAssertEqual(node.children?.count, 3)
    XCTAssertEqual(node.children?[0].type, .text)
    XCTAssertEqual(node.children?[1].type, .text)
    XCTAssertEqual(node.children?[2].type, .button)
  }

  func testNavigationStackNodeWithVStack() {
    let node = NavigationStackNode {
      VStackNode {
        TextNode("Home")
        ButtonNode("Navigate", onTap: "push")
      }
    }

    XCTAssertEqual(node.type, .navigationStack)
    XCTAssertEqual(node.children?.count, 1)
    XCTAssertEqual(node.children?[0].type, .vStack)
    XCTAssertEqual(node.children?[0].children?.count, 2)
  }

  // MARK: - NavigationDestination Tests

  func testNavigationDestinationWithSingleNode() {
    let destinationContent = TextNode("Detail View")
    let node = VStackNode {
      TextNode("Home")
    }
    .navigationDestination(
      value: "detail",
      content: destinationContent
    )

    let destination = node.attributes[.navigationDestination]?.dict
    XCTAssertNotNil(destination)
    XCTAssertEqual(destination?[.value]?.string, "detail")
    XCTAssertEqual(destination?[.isPresented]?.bool, false)
    XCTAssertEqual(destination?[.content]?.node?.type, .text)
  }

  func testNavigationDestinationWithNodeBuilder() {
    let node = VStackNode {
      TextNode("Home")
    }
    .navigationDestination(value: "detail") {
      TextNode("Detail Line 1")
      TextNode("Detail Line 2")
    }

    let destination = node.attributes[.navigationDestination]?.dict
    XCTAssertNotNil(destination)
    XCTAssertEqual(destination?[.content]?.node?.type, .vStack)
    XCTAssertEqual(destination?[.content]?.node?.children?.count, 2)
  }

  func testNavigationDestinationWithAllOptions() {
    let destinationContent = TextNode("Detail")
    let onPresented: AttributeValue = .dict([.action: "pushed"])
    let onDismiss: AttributeValue = .dict([.action: "popped"])

    let node = VStackNode {
      TextNode("Home")
    }
    .navigationDestination(
      value: "detail",
      id: "my-detail",
      isPresented: true,
      content: destinationContent,
      onPresented: onPresented,
      onDismiss: onDismiss
    )

    let destination = node.attributes[.navigationDestination]?.dict
    XCTAssertEqual(destination?[.value]?.string, "detail")
    XCTAssertEqual(destination?[.id]?.string, "my-detail")
    XCTAssertEqual(destination?[.isPresented]?.bool, true)
    XCTAssertEqual(destination?[.onPresented]?.dict?[AttributeKey("action")]?.string, "pushed")
    XCTAssertEqual(destination?[.onDismiss]?.dict?[AttributeKey("action")]?.string, "popped")
  }

  func testNavigationDestinationDefaults() {
    let node = VStackNode {
      TextNode("Home")
    }
    .navigationDestination(value: "detail", content: TextNode("Detail"))

    let destination = node.attributes[.navigationDestination]?.dict
    XCTAssertNil(destination?[.id])
    XCTAssertEqual(destination?[.isPresented]?.bool, false)
    XCTAssertNil(destination?[.onPresented])
    XCTAssertNil(destination?[.onDismiss])
  }

  // MARK: - NavigationTitle Tests

  func testNavigationTitle() {
    let node = VStackNode {
      TextNode("Content")
    }
    .navigationTitle("Home")

    XCTAssertEqual(node.attributes[.navigationTitle]?.string, "Home")
  }

  func testNavigationTitleCanBeChainedWithOtherModifiers() {
    let node = VStackNode {
      TextNode("Content")
    }
    .padding(20)
    .navigationTitle("Screen Title")
    .background(ColorNode("#FF0000"))

    XCTAssertEqual(node.attributes[.padding]?.float, 20)
    XCTAssertEqual(node.attributes[.navigationTitle]?.string, "Screen Title")
    XCTAssertNotNil(node.attributes[.background])
  }

  // MARK: - NavigationBar Display Mode Tests

  func testNavigationBarTitleDisplayMode() {
    let node = VStackNode {
      TextNode("Content")
    }
    .navigationBarTitleDisplayMode(.inline)

    XCTAssertEqual(node.attributes[.navigationBarTitleDisplayMode]?.string, "inline")
  }

  // MARK: - NavigationBar Hidden Tests

  func testNavigationBarHiddenDefault() {
    let node = VStackNode {
      TextNode("Content")
    }
    .navigationBarHidden()

    XCTAssertEqual(node.attributes[.navigationBarHidden]?.bool, true)
  }

  func testNavigationBarHiddenExplicitTrue() {
    let node = VStackNode {
      TextNode("Content")
    }
    .navigationBarHidden(true)

    XCTAssertEqual(node.attributes[.navigationBarHidden]?.bool, true)
  }

  func testNavigationBarHiddenFalse() {
    let node = VStackNode {
      TextNode("Content")
    }
    .navigationBarHidden(false)

    XCTAssertEqual(node.attributes[.navigationBarHidden]?.bool, false)
  }

  // MARK: - NavigationBar Back Button Hidden Tests

  func testNavigationBarBackButtonHiddenDefault() {
    let node = VStackNode {
      TextNode("Content")
    }
    .navigationBarBackButtonHidden()

    XCTAssertEqual(node.attributes[.navigationBarBackButtonHidden]?.bool, true)
  }

  func testNavigationBarBackButtonHiddenExplicitTrue() {
    let node = VStackNode {
      TextNode("Content")
    }
    .navigationBarBackButtonHidden(true)

    XCTAssertEqual(node.attributes[.navigationBarBackButtonHidden]?.bool, true)
  }

  func testNavigationBarBackButtonHiddenFalse() {
    let node = VStackNode {
      TextNode("Content")
    }
    .navigationBarBackButtonHidden(false)

    XCTAssertEqual(node.attributes[.navigationBarBackButtonHidden]?.bool, false)
  }

  // MARK: - Navigation Bar Modifiers Chaining Tests

  func testNavigationBarModifiersCanBeChainedTogether() {
    let node = VStackNode {
      TextNode("Content")
    }
    .navigationTitle("My Screen")
    .navigationBarTitleDisplayMode(.inline)
    .navigationBarBackButtonHidden()

    XCTAssertEqual(node.attributes[.navigationTitle]?.string, "My Screen")
    XCTAssertEqual(node.attributes[.navigationBarTitleDisplayMode]?.string, "inline")
    XCTAssertEqual(node.attributes[.navigationBarBackButtonHidden]?.bool, true)
  }

  func testNavigationDestinationCanBeChainedWithNavigationTitle() {
    let node = VStackNode {
      TextNode("Home")
    }
    .navigationTitle("Home Screen")
    .navigationDestination(value: "detail", content: TextNode("Detail"))

    XCTAssertEqual(node.attributes[.navigationTitle]?.string, "Home Screen")
    XCTAssertNotNil(node.attributes[.navigationDestination])
  }

  func testCompleteNavigationStackExample() {
    let node = NavigationStackNode {
      VStackNode {
        TextNode("Welcome")
        ButtonNode("Go to Detail", onTap: "navigate")
      }
      .navigationTitle("Home")
      .navigationDestination(
        value: "detail",
        isPresented: false,
        content: VStackNode {
          TextNode("Detail Screen")
        }
        .navigationTitle("Detail")
      )
    }

    XCTAssertEqual(node.type, ViewType.navigationStack)
    XCTAssertEqual(node.children?.count, 1)

    let rootView = node.children?[0]
    XCTAssertEqual(rootView?.type, .vStack)
    XCTAssertEqual(rootView?.attributes[.navigationTitle]?.string, "Home")
    XCTAssertNotNil(rootView?.attributes[.navigationDestination])
  }

  // MARK: - NavigationLink Tests

  func testNavigationLinkWithTextLabel() {
    let node = NavigationLinkNode("Go to Detail", value: "detail")

    XCTAssertEqual(node.type, .navigationLink)
    XCTAssertEqual(node.attributes[.value]?.string, "detail")
    XCTAssertEqual(node.children?.count, 1)
    XCTAssertEqual(node.children?[0].type, .text)
    XCTAssertEqual(node.children?[0].attributes[.text]?.string, "Go to Detail")
  }

  func testNavigationLinkWithSingleNode() {
    let labelNode = HStackNode(spacing: 8) {
      ImageNode(systemName: "arrow.right")
      TextNode("Navigate")
    }
    let node = NavigationLinkNode(value: "detail", label: labelNode)

    XCTAssertEqual(node.type, .navigationLink)
    XCTAssertEqual(node.attributes[.value]?.string, "detail")
    XCTAssertEqual(node.children?.count, 1)
    XCTAssertEqual(node.children?[0].type, .hStack)
  }

  func testNavigationLinkWithNodeBuilder() {
    let node = NavigationLinkNode(value: "settings") {
      ImageNode(systemName: "gear")
      TextNode("Settings")
    }

    XCTAssertEqual(node.type, .navigationLink)
    XCTAssertEqual(node.attributes[.value]?.string, "settings")
    XCTAssertEqual(node.children?.count, 2)
    XCTAssertEqual(node.children?[0].type, .image)
    XCTAssertEqual(node.children?[1].type, .text)
  }

  func testNavigationLinkCanBeChainedWithModifiers() {
    let node = NavigationLinkNode("Detail", value: "detail")
      .padding(12)
      .backgroundColor("#007AFF")
      .foregroundColor("#FFFFFF")

    XCTAssertEqual(node.type, .navigationLink)
    XCTAssertEqual(node.attributes[.value]?.string, "detail")
    XCTAssertEqual(node.attributes[.padding]?.float, 12)
    XCTAssertEqual(node.attributes[.backgroundColor]?.string, "#007AFF")
    XCTAssertEqual(node.attributes[.foregroundColor]?.string, "#FFFFFF")
  }

  func testCompleteNavigationLinkExample() {
    let node = NavigationStackNode {
      VStackNode(spacing: 20) {
        TextNode("Home Screen")
        NavigationLinkNode("Go to Detail", value: "detail")
      }
      .navigationTitle("Home")
      .navigationDestination(value: "detail") {
        TextNode("Detail Screen")
          .navigationTitle("Detail")
      }
    }

    XCTAssertEqual(node.type, .navigationStack)
    XCTAssertEqual(node.children?.count, 1)

    let rootView = node.children?[0]
    XCTAssertEqual(rootView?.type, .vStack)
    XCTAssertEqual(rootView?.children?.count, 2)

    let linkNode = rootView?.children?[1]
    XCTAssertEqual(linkNode?.type, .navigationLink)
    XCTAssertEqual(linkNode?.attributes[.value]?.string, "detail")
  }

  // MARK: - NavigationDestinations (Plural) Tests

  func testNavigationDestinationKey() {
    let node = TextNode("Detail")
      .navigationDestinationKey("detail")

    XCTAssertEqual(node.attributes[.navigationDestinationKey]?.string, "detail")
  }

  func testNavigationDestinationsWithTwoDestinations() {
    let node = VStackNode {
      TextNode("Main")
    }
    .navigationDestinations {
      TextNode("Settings").navigationDestinationKey("settings")
      TextNode("Detail").navigationDestinationKey("detail")
    }

    let destinations = node.attributes[.navigationDestinations]?.array
    XCTAssertNotNil(destinations)
    XCTAssertEqual(destinations?.count, 2)

    let firstDest = destinations?[0].node
    XCTAssertEqual(firstDest?.type, .text)
    XCTAssertEqual(firstDest?.attributes[.navigationDestinationKey]?.string, "settings")

    let secondDest = destinations?[1].node
    XCTAssertEqual(secondDest?.type, .text)
    XCTAssertEqual(secondDest?.attributes[.navigationDestinationKey]?.string, "detail")
  }

  func testNavigationDestinationsCanBeChainedWithOtherModifiers() {
    let node = VStackNode {
      TextNode("Main")
    }
    .padding(20)
    .navigationDestinations {
      TextNode("Settings").navigationDestinationKey("settings")
    }
    .navigationTitle("Home")

    XCTAssertEqual(node.attributes[.padding]?.float, 20)
    XCTAssertNotNil(node.attributes[.navigationDestinations])
    XCTAssertEqual(node.attributes[.navigationTitle]?.string, "Home")
  }

  func testCompleteNavigationDestinationsExample() {
    let node = NavigationStackNode {
      VStackNode(spacing: 16) {
        NavigationLinkNode("Go to Settings", value: "settings")
        NavigationLinkNode("Go to Detail", value: "detail")
      }
      .navigationTitle("Home")
      .navigationDestinations {
        VStackNode {
          TextNode("Settings View")
        }
        .navigationDestinationKey("settings")
        .navigationTitle("Settings")

        VStackNode {
          TextNode("Detail View")
        }
        .navigationDestinationKey("detail")
        .navigationTitle("Detail")
      }
    }

    XCTAssertEqual(node.type, .navigationStack)
    XCTAssertEqual(node.children?.count, 1)

    let rootView = node.children?[0]
    XCTAssertEqual(rootView?.type, .vStack)

    let destinations = rootView?.attributes[.navigationDestinations]?.array
    XCTAssertNotNil(destinations)
    XCTAssertEqual(destinations?.count, 2)

    let settingsDest = destinations?[0].node
    XCTAssertEqual(settingsDest?.attributes[.navigationDestinationKey]?.string, "settings")
    XCTAssertEqual(settingsDest?.attributes[.navigationTitle]?.string, "Settings")

    let detailDest = destinations?[1].node
    XCTAssertEqual(detailDest?.attributes[.navigationDestinationKey]?.string, "detail")
    XCTAssertEqual(detailDest?.attributes[.navigationTitle]?.string, "Detail")
  }
}
