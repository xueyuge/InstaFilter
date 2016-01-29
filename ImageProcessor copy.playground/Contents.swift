//: Playground - noun: a place where people can play

import UIKit

let image = UIImage(named: "sample")

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




