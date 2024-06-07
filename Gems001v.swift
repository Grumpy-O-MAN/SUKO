import SwiftUI

struct SukoCell: View {
  @State private var value: String = ""
  
  var body: some View {
    Text(value)
      .font(.title)
      .frame(width: 40, height: 40)
      .overlay(
        RoundedRectangle(cornerRadius: 5)
          .stroke(lineWidth: 1)
      )
      .onChange(of: value) { newValue in
        if newValue.count > 1 {
          value = String(newValue.first!)
        } else if !newValue.isEmpty && !newValue.allSatisfy { "123456789".contains($0) } {
          value = ""
        }
      }
  }
}

struct SukoGrid: View {
  @State private var grid: [[String]] = [[]]
  
  func generatePuzzle(difficulty: Int) {
    // Implement logic to generate a new Suko puzzle based on difficulty
    // Here's a placeholder for now
    grid = [["","","","","","","",""],
            ["","","","","","","",""],
            ["","","","","","","",""],
            ["","","","","","","",""],
            ["","","","","","","",""],
            ["","","","","","","",""],
            ["","","","","","","",""],
            ["","","","","","","",""],
            ["","","","","","","",""]]
  }
  
  var body: some View {
    VStack {
      Button("Generate Puzzle (Easy)") {
        generatePuzzle(difficulty: 1)
      }
      // Add buttons for other difficulty levels if desired
      
      LazyVGrid(rows: 9, columns: 9) { row in
        ForEach(grid[row], id: \.self) { cell in
          SukoCell(value: cell)
        }
      }
    }
  }
}

struct SukoApp: App {
  var body: some Scene {
    WindowGroup {
      SukoGrid()
    }
  }
}
