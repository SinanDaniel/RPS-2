import SwiftUI

struct ContentView: View {
    @State private var playerChoice: String = ""
    @State private var computerChoice: String = ""
    @State private var result: String = ""
    @State private var showResult: Bool = false
    
    let gameLogic = GameLogic()
    
    var body: some View {
        VStack {
            Text("Taş Kağıt Makas Oyunu")
                .font(.largeTitle)
                .padding()
            
            HStack {
                ForEach(gameLogic.choices, id: \.self) { choice in
                    Button(action: {
                        playGame(with: choice)
                    }) {
                        Text(choice)
                            .font(.title)
                            .padding()
                    }
                }
            }
            
            if showResult {
                Text("Sen: \(playerChoice)")
                Text("Bilgisayar: \(computerChoice)")
                Text(result)
                    .font(.headline)
                    .padding()
            }
        }
    }
    
    func playGame(with choice: String) {
        playerChoice = choice
        computerChoice = gameLogic.getComputerChoice()
        result = gameLogic.determineWinner(playerChoice: playerChoice, computerChoice: computerChoice)
        showResult = true
    }
}

@main
struct MyApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
