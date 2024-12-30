import Foundation

struct GameLogic {
    let choices = ["Taş", "Kağıt", "Makas"]
    
    
    func getComputerChoice() -> String {
        return choices.randomElement() ?? "Taş"
    }
    
    
    func determineWinner(playerChoice: String, computerChoice: String) -> String {
        if playerChoice == computerChoice {
            return "Berabere!"
        } else if (playerChoice == "Taş" && computerChoice == "Makas") ||
                    (playerChoice == "Kağıt" && computerChoice == "Taş") ||
                    (playerChoice == "Makas" && computerChoice == "Kağıt") {
            return "Kazandın!"
        } else {
            return "Kaybettin!"
        }
    }
}
