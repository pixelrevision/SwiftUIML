//
//  GridTests.swift
//  SwiftUIML
//
//  Grid view rendering tests
//

import XCTest
@testable import SwiftUIML
@testable import SwiftUIMLCore

class GridTests: XCTestCase {
  @MainActor
  func testGridBasic() {
    testNode(TestCase.view.grid.basic, size: CGSize(width: 100, height: 100)) {
      GridNode(horizontalSpacing: 2, verticalSpacing: 2) {
        GridRowNode {
          ColorNode("#FF0000:#FF3333")
          ColorNode("#00FF00:#33FF33")
          ColorNode("#0000FF:#3333FF")
        }
        GridRowNode {
          ColorNode("#FFFF00:#FFFF33")
          ColorNode("#FF00FF:#FF33FF")
          ColorNode("#00FFFF:#33FFFF")
        }
      }
    }
  }

  @MainActor
  func testGridVariableColumns() {
    testNode(TestCase.view.grid.variableColumns, size: CGSize(width: 100, height: 150)) {
      GridNode(horizontalSpacing: 2, verticalSpacing: 2) {
        GridRowNode {
          ColorNode("#FF0000:#FF3333")
          ColorNode("#00FF00:#33FF33")
          ColorNode("#0000FF:#3333FF")
        }
        GridRowNode {
          ColorNode("#FFFF00:#FFFF33")
          ColorNode("#FF00FF:#FF33FF")
        }
        GridRowNode {
          ColorNode("#FFFF00:#FFFF33")
        }
      }
    }
  }

  @MainActor
  func testGridCellColumns() {
    testNode(TestCase.view.grid.cellColumns, size: CGSize(width: 150, height: 100)) {
      GridNode(horizontalSpacing: 2, verticalSpacing: 2) {
        GridRowNode {
          ColorNode("#FF0000:#FF3333")
            .frame(height: 30)
          ColorNode("#00FF00:#33FF33")
            .frame(height: 30)
          ColorNode("#0000FF:#3333FF")
            .frame(height: 30)
        }
        GridRowNode {
          ColorNode("#FFFF00:#FFFF33")
            .frame(height: 30)
            .gridCellColumns(2)
          ColorNode("#FF00FF:#FF33FF")
            .frame(height: 30)
        }
        GridRowNode {
          ColorNode("#00FFFF:#33FFFF")
            .frame(height: 30)
            .gridCellColumns(3)
        }
      }
    }
  }
}
