//
//  ContentView.swift
//  Weather
//
//  Created by Khadijatul Kubro on 26/04/25.
//

import SwiftUI

struct ContentView: View {
    
    @State private var isNight = false
    
    var body: some View {
        ZStack {
            BackgroundView(isNight: $isNight)
            
            VStack{
                CityNameView(cityName: "Bondowoso", province: "East Java")
                
                MainWeatherDisplayView(imageName: isNight ? "moon.stars.fill" : "cloud.sun.fill", temp: 32)
                
                HStack(spacing: 15){
                    WeatherDayView(dayName: "MON", imageName: "cloud.sun.rain.fill", temp: 28)
                    WeatherDayView(dayName: "TUE", imageName: "sun.max.fill", temp: 33)
                    WeatherDayView(dayName: "WED", imageName: "cloud.sun.fill", temp: 30)
                    WeatherDayView(dayName: "THU", imageName: "sun.max.fill", temp: 32)
                    WeatherDayView(dayName: "FRI", imageName: "cloud.sun.rain.fill", temp: 29)
                }
                .padding(.bottom, 100)
                Button {
                    isNight.toggle()
                } label: {
                    Text("Change Day Time")
                        .font(.system(size: 20, weight: .medium))
                        .frame(width: 280, height: 50)
                        .background(Color.white)
                        .clipShape(.buttonBorder)
                }
                Spacer()
            }
        }
    }
}

#Preview {
    ContentView()
}

struct WeatherDayView: View {
    var dayName: String
    var imageName: String
    var temp: Int
    var body: some View {
        VStack {
            Text(dayName)
                .font(.system(size: 18, weight: .medium))
                .foregroundStyle(.white)
            Image(systemName: imageName)
                .renderingMode(.original)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 50, height: 50)
            Text("\(temp)°")
                .font(.system(size: 20, weight: .medium))
                .foregroundStyle(.white)
        }
    }
}

struct BackgroundView: View {
    @Binding var isNight: Bool
    
    var body: some View {
        LinearGradient(colors: [isNight ? .black : .blue,
                                isNight ? .gray : Color("lightBlue")],
                       startPoint: .topLeading,
                       endPoint: .bottomTrailing)
            .ignoresSafeArea()
    }
}

struct MainWeatherDisplayView: View {
    var imageName: String
    var temp: Int
    
    var body: some View {
        VStack (spacing: 2){
            Image(systemName: imageName)
                .renderingMode(.original)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 180, height: 180)
            Text("\(temp)°")
                .font(.system(size: 60, weight: .medium))
                .foregroundStyle(.white)
        }
        .padding(.bottom, 60)
    }
}

struct CityNameView: View {
    var cityName: String
    var province: String
    
    var body: some View {
        Text("\(cityName), \(province)")
            .font(.system(size: 28, weight: .medium))
            .foregroundStyle(.white)
            .padding(.top, 25)
    }
}
