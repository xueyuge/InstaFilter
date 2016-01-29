//Finished by Yuge Xue 
//Jan 29 2015

import UIKit

let image = UIImage(named: "sample")

// Process the image!

class ImageProcessor{
    
////////////////////////////
//Brightness Adjustment Function
///Dim or light the image (intensity between -255 to 255)
    
    func brightnessAdjustment(myImage:UIImage, intensity:Int) -> UIImage{
        let myRGBA = RGBAImage(image: myImage)
        
        for y in 0 ..< myRGBA!.height{
            for x in 0 ..< myRGBA!.width{
                let index = y * myRGBA!.width + x
                var pixel = myRGBA!.pixels[index]
                let redValue = myRGBA!.pixels[index].red
                let blueValue = myRGBA!.pixels[index].blue
                let greenValue = myRGBA!.pixels[index].green
                
                pixel.red = UInt8(max(0, min(255, Int(redValue)+intensity)))
                pixel.blue = UInt8(max(0, min(255, Int(blueValue)+intensity)))
                pixel.green = UInt8(max(0, min(255, Int(greenValue)+intensity)))
                
                myRGBA!.pixels[index] = pixel
            }
        }
        
        let newImage = myRGBA!.toUIImage()
        
        return newImage!
    }

////////////////////////////
//Remove Color Function
///Remove color (restricted to "red","green" or "blue")
    
    func removeColor(myImage:UIImage,remove:String,intensity:UInt8) -> UIImage{
        
        let myRGBA = RGBAImage(image: myImage)
        
        for y in 0 ..< myRGBA!.height{
            for x in 0 ..< myRGBA!.width{
                let index = y * myRGBA!.width + x
                switch remove{
                case "blue":
                    if myRGBA!.pixels[index].blue > intensity{
                        myRGBA!.pixels[index].blue -= intensity
                    }else{
                        myRGBA!.pixels[index].blue = 0
                    }
                case "green":
                    if myRGBA!.pixels[index].green > intensity{
                        myRGBA!.pixels[index].green -= intensity
                    }else{
                        myRGBA!.pixels[index].green = 0
                    }
                case "red":
                    if myRGBA!.pixels[index].red > intensity{
                        myRGBA!.pixels[index].red -= intensity
                    }else{
                        myRGBA!.pixels[index].red = 0
                    }
                default:
                    print("Only blue, green and red are supported")
                }
            }
        }
        let newImage = myRGBA!.toUIImage()
        return newImage!
    }

////////////////////////////
//Transparency Switcher Function
///Adjusting the alpha value
    
    func transparencySwitcher(myImage:UIImage,intensity:Int) -> UIImage{
        let myRGBA = RGBAImage(image: myImage)
        
        for y in 0 ..< myRGBA!.height{
            for x in 0 ..< myRGBA!.width{
                let index = y * myRGBA!.width + x
                var pixel = myRGBA!.pixels[index]
                let alpha = pixel.alpha
                myRGBA!.pixels[index].alpha = UInt8(max(min(255, Int(alpha)-intensity), 0))
            }
        }
        let newImage = myRGBA!.toUIImage()
        return newImage!
    }

////////////////////////////
//Yellow Filter Function


    func yellowFilter(myImage:UIImage,intensity:UInt) -> UIImage{
        let myRGBA = RGBAImage(image: myImage)
        
        for y in 0 ..< myRGBA!.height{
            for x in 0 ..< myRGBA!.width{
                let index = y * myRGBA!.width + x
                let redValue = myRGBA!.pixels[index].red
                let blueValue = myRGBA!.pixels[index].blue
                let greenValue = myRGBA!.pixels[index].green
                
                myRGBA!.pixels[index].red = UInt8(min(255, UInt(redValue) + intensity))
                myRGBA!.pixels[index].green = UInt8(min(255, UInt(greenValue) + intensity))
                myRGBA!.pixels[index].blue = UInt8(min(102, UInt(blueValue) + intensity))
            }
        }
        let newImage = myRGBA!.toUIImage()
        return newImage!
    }

////////////////////////////
//Tan Skin Function
///Make skin more tan
    
    func tanSkin(myImage:UIImage,intensity:UInt) -> UIImage{
        let myRGBA = RGBAImage(image: myImage)
        
        for y in 0 ..< myRGBA!.height{
            for x in 0 ..< myRGBA!.width{
                let index = y * myRGBA!.width + x
                let redValue = myRGBA!.pixels[index].red
                let blueValue = myRGBA!.pixels[index].blue
                let greenValue = myRGBA!.pixels[index].green
                
                myRGBA!.pixels[index].red = UInt8(min(255, UInt(redValue) + intensity))
                myRGBA!.pixels[index].green = UInt8(min(204, UInt(greenValue) + intensity))
                myRGBA!.pixels[index].blue = UInt8(min(150, UInt(blueValue) + intensity))
            }
        }
        let newImage = myRGBA!.toUIImage()
        return newImage!
    }

}

//End of class
//Adjusting image

var imageProcessor = ImageProcessor()

//Brightness adjustment 2x
//imageProcessor.brightnessAdjustment(image!, intensity: 128)


//Remove Color red with intensity of 50 (Color restricted to "red","green","blue")
//imageProcessor.removeColor(image!, remove: "red", intensity: 50)


//Transparency adjustment with intensity of 250
//imageProcessor.transparencySwitcher(image!, intensity: 250)


//Yellow Filter intensity 50
//imageProcessor.yellowFilter(image!, intensity: 50)


//Tan skin
//imageProcessor.tanSkin(image!, intensity: 5)



