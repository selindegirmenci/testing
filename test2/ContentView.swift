import SwiftUI
import GaugeKit
import Foundation


struct ContentView: View {
    @StateObject var fetch = ReadData()
    
    var body: some View {
        VStack {
            if let tank = fetch.tank {
                TankDetailView(tank: tank)
            } else {
                Text("Loading...")
            }
        }
  
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


struct TankDetailView: View {
    var tank: Tank
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("ID: \(tank.id ?? 0)")
            Text("Date Time: \(tank.datetime)")
            
            /* by using if let we unwrap an optional value and assign it to a new constant or variable within the scope of an if statement. This helps safely work with optional values without force unwrapping them, which can lead to runtime crashes if the optional is nil.*/
            
            if let temperature = tank.Temperature {
                Text("Temperature: \(temperature)")
            }
            if let pressure = tank.Pressure {
                Text("Pressure: \(pressure)")
            }
            if let level = tank.Level {
                Text("Level: \(level)")
            }
            if let engineRpm = tank.engine_rpm {
                Text("Engine RPM: \(engineRpm)")
            }
            if let voltage = tank.voltage {
                Text("Voltage: \(voltage)")
            }
            if let fanRpm = tank.fanRPM {
                Text("Fan RPM: \(fanRpm)")
            }
            /*
             GaugeView(title: "Temperature", value: tank.Temperature , maxValue: 100, colors: [.red, .orange, .yellow, .green])
             .frame(width: 100, height: 100)
             .padding()
             
             }
             .padding() */
            
        }
        
    }
}




