//
//  ContentView.swift
//  SwiftUI-Wearther
//
//  Created by Nirmal Koirala on 08/09/2022.
//

import SwiftUI


struct ContentView: View {
    @State private var isNight = false
    var body: some View {
        ZStack {
             
            BackgroungView(isNight: $isNight)
            
            VStack {
                CityTextView(cityName: "Kathmandu, Nepal")
                MainWeatherStatusView(imageName: isNight ? "sparkles" : "cloud.sun.fill", temperature: 35)
                
                ScrollView(.horizontal) {
                HStack {
                    WeatherDayView(dayOfWeek: "Sun", imageName:  isNight ? "moon.stars.fill" : "cloud.sun.fill", temperature: 30)
                        .padding()
                    WeatherDayView(dayOfWeek: "Mon", imageName:  isNight ? "moon.circle" : "sun.max.fill", temperature: 45)
                        .padding()
                    WeatherDayView(dayOfWeek: "Tue", imageName:  isNight ? "moon.circle.fill" : "cloud.sun.fill", temperature: 33)
                        .padding()
                    WeatherDayView(dayOfWeek: "Wed", imageName:  isNight ? "moon" : "sun.max.fill", temperature: 15)
                        .padding()
                    WeatherDayView(dayOfWeek: "Thu", imageName:  isNight ? "moon.fill" : "wind.snow", temperature: 10)
                        .padding()
                    WeatherDayView(dayOfWeek: "Fri", imageName:  isNight ? "moon.stars" : "sunset.fill", temperature: 40)
                        .padding()
                    WeatherDayView(dayOfWeek: "Sat", imageName:  isNight ? "sparkles" : "snow", temperature: 25)
                        .padding()
                }
                }
                Spacer()
                
                Button {
                    isNight.toggle()
                } label: {
                    WeatherButton(title: "Change Day Time", textColor: .blue, backgroundColor: .white )
                    
                }
                Spacer()
                }
            
              
            }
        }
    }



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
       
        ContentView()
      
    }
}
  

struct WeatherDayView: View{
    var dayOfWeek: String
    var imageName: String
    var temperature: Int
    
    var body: some View {
        VStack {
            Text(dayOfWeek)
                .font(.system(size: 30, weight: .medium, design: .default))
                .foregroundColor(.white)
            Image(systemName: imageName)
                .renderingMode(.original)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 40, height: 40)
                
            Text("\(temperature)º")
                .font(.system(size: 28, weight: .medium))
                .foregroundColor(.white)
        }
    }
}

struct BackgroungView: View {
   @Binding var isNight: Bool
     
    var body: some View {
       
        
         
        LinearGradient(gradient:  Gradient(colors: [isNight ? .black : .blue, isNight ? .gray : Color("lightBlue")]),
                       startPoint: .topLeading,
                       endPoint: .bottomTrailing)
            .edgesIgnoringSafeArea(.all)
    }
}

struct CityTextView: View {
    var cityName: String
    
    var body: some View {
        Text(cityName)
            .font(.system(size: 32, weight: .medium, design: .default))
            .foregroundColor(.white)
            .padding()
    }
}

struct MainWeatherStatusView: View {
    var imageName: String
    var temperature: Int
    
    var body: some View {
        VStack(spacing: 10) {
            Image(systemName: imageName)
                .renderingMode(.original)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 180, height: 180)
                
            Text("\(temperature)º ")
                .font(.system(size: 70, weight: .medium))
                .foregroundColor(.white)
            
            
        }
        .padding(.bottom, 50)
    }
}


