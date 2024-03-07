import SwiftUI
import AVFoundation
import AudioToolbox

struct ContentView: View {
    @State private var showSceneTwo = false
    @State private var audioPlayer: AVAudioPlayer!

    var body: some View {
        GeometryReader { geometry in
            ZStack {
                Color(UIColor(hex: "#868882")!)
                    .edgesIgnoringSafeArea(.all)

                VStack {
                    Image("logo")
                        .resizable()
                        .scaledToFit()
                        .frame(width: min(geometry.size.width, geometry.size.height) * 1.0)
                        .padding(.top, geometry.safeAreaInsets.top)
                        .padding(.bottom, geometry.safeAreaInsets.bottom)

                    Button(action: {
                        AudioServicesPlaySystemSound(1104)
                        self.showSceneTwo = true
                    }) {
                        Image("startButton")
                            .resizable()
                            .scaledToFit()
                            .frame(width: geometry.size.width * 0.20)
                    }
                    .offset(y: -geometry.size.height * 0.15)

                    Spacer()
                }
            }
        }
        .onAppear {
            playBackgroundMusic()
        }
        .fullScreenCover(isPresented: $showSceneTwo) {
            SceneTwoView()
        }
    }

    func playBackgroundMusic() {
        if let bundlePath = Bundle.main.path(forResource: "backgroundMusic", ofType: "m4a") {
            let backgroundMusicUrl = URL(fileURLWithPath: bundlePath)

            do {
                audioPlayer = try AVAudioPlayer(contentsOf: backgroundMusicUrl)
                audioPlayer.numberOfLoops = -1
                audioPlayer.prepareToPlay()
                audioPlayer.play()
            } catch {
                print(error)
            }
        }
    }
}


////

struct SceneTwoView: View {
    @State private var showSceneThree = false

    var body: some View {
        GeometryReader { geometry in
            ZStack {
                Image("Background")
                    .resizable()
                    .scaledToFill()
                    .edgesIgnoringSafeArea(.all)
                    .opacity(0.1)
                Image("ted_1") 
                    .resizable()
                    .scaledToFit()
                    .frame(width: geometry.size.width * 0.8)
                    .offset(x: -(geometry.size.width * 0.3), y: (geometry.size.width * 0.1))

                VStack {
                    Spacer()
                    
                     
                    Image("text_1")
                        .resizable()
                        .scaledToFit()
                        .frame(width: geometry.size.width * 0.5)
                        .padding(.top, 20)
                        .offset(x:100, y:-200)

                    Button(action: {
                        AudioServicesPlaySystemSound(1104)
                        showSceneThree = true
                                       }) {
                                    Image("answer_1")
                                               .resizable()
                                               .scaledToFit()
                                               .frame(width: geometry.size.width * 0.3)
                                       }
                                       .padding(.top, 10)
                                       .offset(x:100, y:-200)
                }
                            }
        
                    
                        }
                        .fullScreenCover(isPresented: $showSceneThree) {
                            SceneThreeView()
                        }
                    }
                }


///
///
struct SceneThreeView: View {
    @State private var showSceneFour = false

    var body: some View {
        GeometryReader { geometry in
            ZStack {
                Image("Background")
                    .resizable()
                    .scaledToFill()
                    .edgesIgnoringSafeArea(.all)
                    .opacity(0.1)
                Image("ted_2")
                    .resizable()
                    .scaledToFit()
                    .frame(width: geometry.size.width * 0.8)
                    .offset(x: -(geometry.size.width * 0.3), y: (geometry.size.width * 0.1))
                Button(action: {
                    AudioServicesPlaySystemSound(1104)
                    showSceneFour = true
                }) {
                    Image("answer_2")
                        .resizable()
                        .scaledToFit()
                        .frame(width: geometry.size.width * 0.5)
                }
                .offset(x:150)
                
                VStack {
                    Spacer()
                    
                    Image("text_2")
                        .resizable()
                        .scaledToFit()
                        .frame(width: geometry.size.width * 0.5)
                        .padding(.top, 20)
                        .offset(x:150, y:-500)
            

                }
            }
        }
        .fullScreenCover(isPresented: $showSceneFour) {
            SceneFourView()
        }
    }
}

// SceneFourView
struct SceneFourView: View {
    @State private var showSceneFive = false

    var body: some View {
        GeometryReader { geometry in
            ZStack {
                Image("Background")
                    .resizable()
                    .scaledToFill()
                    .edgesIgnoringSafeArea(.all)
                    .opacity(0.1)
                Image("ted_2")
                    .resizable()
                    .scaledToFit()
                    .frame(width: geometry.size.width * 0.8)
                    .offset(x: -(geometry.size.width * 0.3), y: (geometry.size.width * 0.1))
                Button(action: {
                    
                    AudioServicesPlaySystemSound(1104)
                    showSceneFive = true
                }) {
                    Image("answer_3")
                        .resizable()
                        .scaledToFit()
                        .frame(width: geometry.size.width * 0.5)
                }
                .offset(x:150)
                
                VStack {
                    Spacer()
                    
                    Image("text_3")
                        .resizable()
                        .scaledToFit()
                        .frame(width: geometry.size.width * 0.5)
                        .padding(.top, 20)
                        .offset(x:150, y:-500)
                }
            }
        }
        .fullScreenCover(isPresented: $showSceneFive) {
            SceneFiveView()
        }
    }
}

// SceneFiveView


struct SceneFiveView: View {
    @State private var boxValue = 0
    @State private var showSceneSix = false
    @State private var showSceneSeven = false
    @State private var inBox = Set<String>()
    @State private var positions = [
        "hardhat": CGPoint(x: 0.64, y: 0.49),
        "safetyvest": CGPoint(x: 0.51, y: 0.36),
        "safetyshoes": CGPoint(x: 0.23, y: 0.95),
        "caphat": CGPoint(x: 0.95, y: 0.58),
        "cat": CGPoint(x: 0.29, y: 0.58),
        "flower": CGPoint(x: 0.46, y: 0.59),
        "pig": CGPoint(x: 0.44, y: 0.29),
        "slipper": CGPoint(x: 0.70, y: 0.80),
        "vest": CGPoint(x: 0.62, y: 0.80)
    ]

    var body: some View {
        GeometryReader { geometry in
            let width = geometry.size.width
            let height = geometry.size.height

            
            ZStack {
                Image("Background")
                    .resizable()
                    .scaledToFill()
                    .edgesIgnoringSafeArea(.all)
                Image("box")
                    .resizable()
                    .frame(width: 200, height: 200)
                    .position(x: width / 2, y: height / 2 + 270)

                ForEach(["hardhat", "safetyvest", "safetyshoes", "caphat", "cat", "flower", "pig", "slipper", "vest"], id: \.self) { item in
                    if !inBox.contains(item) {
                        Image(item)
                            .resizable()
                            .frame(width: 100, height: 100)
                            .position(x: positions[item]!.x * width, y: positions[item]!.y * height)
                            .gesture(
                                DragGesture()
                                    .onChanged { gesture in
                                        positions[item] = CGPoint(x: gesture.location.x / width, y: gesture.location.y / height)
                                    }
                                    .onEnded { gesture in
                                        AudioServicesPlaySystemSound(1104)
                                        let boxFrame = CGRect(x: width / 2 - 100, y: height / 2 + 170, width: 200, height: 200)
                                        if boxFrame.contains(gesture.location) {
                                            inBox.insert(item)
                                            switch item {
                                            case "hardhat": boxValue += 1
                                            case "safetyvest": boxValue += 2
                                            case "safetyshoes": boxValue += 3
                                            case "caphat", "cat", "flower", "pig", "slipper", "vest": boxValue = 999
                                            default: break
                                            }
                                        }
                                    }
                            )
                    }
                }
            }
            .onChange(of: boxValue) { newValue in
                if newValue == 6 {
                    showSceneSix = true
                } else if newValue == 999 {
                    showSceneSeven = true
                }
            }
        }
        .fullScreenCover(isPresented: $showSceneSix) {
            SceneSixView()
        }
        .fullScreenCover(isPresented: $showSceneSeven) {
            SceneSevenView()
        }
    }
}


struct SceneSixView: View {
    @State private var showSceneEight = false

    var body: some View {
        GeometryReader { geometry in
            ZStack {
                Image("Background")
                    .resizable()
                    .scaledToFill()
                    .edgesIgnoringSafeArea(.all)
                    .opacity(0.1)
                Image("ted_6")
                    .resizable()
                    .scaledToFit()
                    .frame(width: geometry.size.width * 0.8)
                    .offset(x: -(geometry.size.width * 0.3), y: (geometry.size.width * 0.1))
                Button(action: {
                    AudioServicesPlaySystemSound(1104)
                    showSceneEight = true
                }) {
                    Image("answer_6")
                        .resizable()
                        .scaledToFit()
                        .frame(width: geometry.size.width * 0.5)
                }
                .offset(x:150)
                
                VStack {
                    Spacer()
                    
                    Image("text_6")
                        .resizable()
                        .scaledToFit()
                        .frame(width: geometry.size.width * 0.5)
                        .padding(.top, 20)
                        .offset(x:150, y:-500)
                }
            }
        }
        .fullScreenCover(isPresented: $showSceneEight) {
            SceneEightView()
        }
    }
}



struct SceneSevenView: View {
    @State private var showSceneFive = false

    var body: some View {
        GeometryReader { geometry in
            ZStack {
                Image("Background")
                    .resizable()
                    .scaledToFill()
                    .edgesIgnoringSafeArea(.all)
                    .opacity(0.1)
                Image("ted_7")
                    .resizable()
                    .scaledToFit()
                    .frame(width: geometry.size.width * 0.8)
                    .offset(x: -(geometry.size.width * 0.3), y: (geometry.size.width * 0.1))
                Button(action: {
                    AudioServicesPlaySystemSound(1104)
                    showSceneFive = true
                }) {
                    Image("answer_7")
                        .resizable()
                        .scaledToFit()
                        .frame(width: geometry.size.width * 0.5)
                }
                .offset(x:150)
                
                VStack {
                    Spacer()
                    
                    Image("text_7")
                        .resizable()
                        .scaledToFit()
                        .frame(width: geometry.size.width * 0.5)
                        .padding(.top, 20)
                        .offset(x:150, y:-500)
                }
            }
        }
        .fullScreenCover(isPresented: $showSceneFive) {
            SceneFiveView()
        }
    }
}


struct SceneEightView: View {
    @State private var showSceneTwo = false
    @State private var jump = false
    
    var body: some View {
        GeometryReader { geometry in
            ZStack {
                Color(UIColor(hex: "#868882")!)
                    .edgesIgnoringSafeArea(.all)

                HStack(spacing: 0) {
                    Image("ted_8")
                        .resizable()
                        .scaledToFit()
                        .frame(width: geometry.size.width * 0.5)
                        .offset(y: jump ? -20 : 20)
                        .animation(Animation.easeInOut(duration: 0.5).repeatForever(autoreverses: true), value: jump)
                        .onAppear {
                            jump = true
                        }

                    VStack {
                    
                        Text("You are exposed to various risks in the field.")
                            .font(.system(size: 55, weight: .bold, design: .default))
                            .multilineTextAlignment(.center)
                            .padding(.horizontal)
                            .padding(.bottom, 20)
                        HStack(spacing: 20) {
                            Image(systemName: "bolt.fill")
                                .font(.system(size: 75, weight: .bold))
                            Image(systemName: "gear")
                                .font(.system(size: 75, weight: .bold))
                            Image(systemName: "flame.fill")
                                .font(.system(size: 75, weight: .bold))
                            Image(systemName: "exclamationmark.triangle.fill")
                                .font(.system(size: 75, weight: .bold))
                        }
                        .padding(.top, 50)
                        .padding(.bottom, 20)
                        Text("Be sure to prepare and wear safety equipment.")
                            .font(.system(size: 55, weight: .bold, design: .default))
                            .multilineTextAlignment(.center)
                            .padding(.horizontal)
                            .padding(.bottom, 20)

                        Button(action: {
                            AudioServicesPlaySystemSound(1104)
                            self.showSceneTwo = true
                        }) {
                            Image("final_1")
                                .resizable()
                                .scaledToFit()
                                .frame(width: geometry.size.width * 0.20)
                        }
                        .padding(.top, -10)
                    }
                    .padding(.leading, -75)
                }
                .frame(maxWidth: .infinity, alignment: .leading)
            }
        }
        .fullScreenCover(isPresented: $showSceneTwo) {
            SceneTwoView()
        }
    }
}



//////////
///

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
        .previewInterfaceOrientation(.landscapeRight)
    }
}

extension UIColor {
    convenience init?(hex: String) {
        let r, g, b, a: CGFloat

        if hex.hasPrefix("#") {
            let start = hex.index(hex.startIndex, offsetBy: 1)
            let hexColor = String(hex[start...])

            if hexColor.count == 6 {
                let scanner = Scanner(string: hexColor)
                var hexNumber: UInt64 = 0

                if scanner.scanHexInt64(&hexNumber) {
                    r = CGFloat((hexNumber & 0xff0000) >> 16) / 255
                    g = CGFloat((hexNumber & 0x00ff00) >> 8) / 255
                    b = CGFloat(hexNumber & 0x0000ff) / 255
                    a = 1.0

                    self.init(red: r, green: g, blue: b, alpha: a)
                    return
                }
            }
        }
        return nil
    }
}





