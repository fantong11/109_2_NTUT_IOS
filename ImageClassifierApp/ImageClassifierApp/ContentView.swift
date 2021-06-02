import SwiftUI

struct ContentView: View {
    
    let photos = ["cd player","castle","car wheel"]
    @State private var currentIndex: Int = 0
    @State private var classificationLabel: String = "Click Classify"
    @State private var classificationLabel2: String = ""
    let model = MyImageClassifier_1()
    let model2 = MobileNetV2()
    private func ImageClassification() {
        let currentImageName = photos[currentIndex]
        guard let img = UIImage(named: currentImageName),
              let resizedImage = img.resizeTo(size: CGSize(width: 299, height: 299)),
              let buffer = resizedImage.toBuffer()
        else {
            return
        }
        
        let output = try? model.prediction(image: buffer)
        if let output = output {
            let results = output.classLabelProbs.sorted {
                $0.1>$1.1
            }
            let result = results.map{(key, value) in return "\(key) = \(Double(round(1000*value * 100)/1000))%"}.joined(separator: "\n")
            classificationLabel = result
        }
        
        
    }
    private func ImageClassification2() {
        let currentImageName = photos[currentIndex]
        print("skdlfjsdl;")
        guard let img = UIImage(named: currentImageName),
              let resizedImage = img.resizeTo(size: CGSize(width: 224, height: 224)),
              let buffer = resizedImage.toBuffer()
        else {
            return
        }
        print("1234")
        let output = try? model2.prediction(image: buffer)
        if let output = output {
            let results = output.classLabelProbs.sorted {
                $0.1>$1.1
            }
            print(output.classLabel)
            let result = results.map{(key, value) in return "\(key) = \(Double(round(1000*value * 100)/1000))%"}.joined(separator: "\n")
            classificationLabel2 = result
        }
        print("qwer")
    }
    var body: some View {
        VStack {
            Image(photos[currentIndex])
            .resizable()
                .frame(width: 200, height: 200)
            HStack {
                Button("Previous"){
                    if self.currentIndex > 0 {
                        self.currentIndex = self.currentIndex - 1
                    }
                    else{
                        self.currentIndex = self.photos.count - 1
                    }
                    self.classificationLabel = "Click Classify"
                    }.padding()
                    .foregroundColor(Color.white)
                    .background(Color.gray)
                    .cornerRadius(10)
                    .frame(width: 100)
                
                Button("Next") {
                    if self.currentIndex < self.photos.count - 1 {
                        self.currentIndex = self.currentIndex + 1
                    }
                    else{
                        self.currentIndex = 0
                    }
                    self.classificationLabel = "Click Classify"
                    self.classificationLabel2 = ""
                }.padding()
                .foregroundColor(Color.white)
                .frame(width: 100)
                .background(Color.gray)
                .cornerRadius(10)
            }.padding()
            
            Button("Classify") {
                // classify the image here
                self.ImageClassification()
                self.ImageClassification2()

            }.padding()
            .foregroundColor(Color.white)
            .background(Color.green)
            .cornerRadius(8)
            
            HStack(alignment: .top) {
                VStack {
                    Text("My Model")
                    Text(classificationLabel)
                        .padding()
                }
                
                VStack {
                    Text("MobilenetV2")
                    Text(classificationLabel2)
                        .padding()
                }
            }
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
