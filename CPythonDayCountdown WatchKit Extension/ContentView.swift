//
//  ContentView.swift
//  pieday WatchKit Extension
//
//  Created by Trevor Beaton on 9/9/20.
//

import SwiftUI

struct ContentView: View {
    @State var distantFuture = Date()
    @State var locationLabel = "nada"
    @State var daysTo = Date()
    
    func viewDidLoad() -> Void {
        let calendar = Calendar.current
        
        var components = DateComponents()
        //Circuit Python Day
        components.day = 10
        components.month = 9
        components.year = 2021
        components.hour = 0
        components.minute = 0
        
        distantFuture = calendar.date(from: components)!
        
        print(distantFuture)
    }
    
    
    
    var body: some View {
        
        ZStack{
            
            Circle()
                .foregroundColor(Color(#colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)))
                .frame(width: 120 , height: 120)
                .offset(x: 0, y: 1)
                .shadow(color: Color(#colorLiteral(red: 0.5568627715, green: 0.3529411852, blue: 0.9686274529, alpha: 1)),radius: 20, x:0, y:5)
            
            Image("blinka")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 180 , height: 180)
                .onAppear {
                    viewDidLoad()
                }
            HStack{
                DayView(setDate: distantFuture)
                Text("Days")
            }
           
                .foregroundColor(.white)
                .font(.system(size: 19, weight: .heavy, design: .monospaced))
        }
       
        
    }
    
}

struct DayView : View {
    
    @State var now = Date()
    
    let setDate : Date
    
    var timer : Timer {
        Timer.scheduledTimer(withTimeInterval: 1, repeats: true) {
            _ in
            self.now = Date()
        }
    }
    
    
    
    public func daysToPieDay(_: Date) -> String {
        
        let calender = Calendar(identifier: .gregorian)
        let storedTime = calender
            .dateComponents([.day], from: now, to: setDate)
        
        
        return String(format: " %02d", storedTime.day!)
    }
    
    var body : some View {
        
        VStack{
            
            Text(daysToPieDay(setDate))

        }
        
    }
    
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
