import SwiftUI
import Foundation

public struct Tank: Codable, Identifiable {
    
    public var id: Int?
    public var datetime: String
    public var Temperature: Double?
    public var Pressure: Double?
    public var Level: Int?
    public var engine_rpm: Int?
    public var voltage: Int?
    public var fanRPM: Int?
    
}

class ReadData: ObservableObject {
    @Published var tank: Tank?
    
    private var timer: Timer?
    
    init() {
        fetchData()
        // Schedule timer to fetch data every second
        timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { _ in
            self.fetchData()
        }
    }
    
    private func fetchData() {
        guard let url = URL(string: "http://10.228.226.154/myWebService1/getLatestData.php") else {
            print("Invalid URL")
            return
        }
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            do {
                if let tankData = data {
                    let decodedData = try JSONDecoder().decode(Tank.self, from: tankData)
                    
                    DispatchQueue.main.async {
                        self.tank = decodedData
                    }
                } else {
                    print("No data")
                }
                
            } catch {
                print("Error: \(error)")
            }
        }.resume()
    }
}

