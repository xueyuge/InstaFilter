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
            
            if intensity < 0{
                if Int(redValue) + intensity > 0{
                    pixel.red = UInt8(min(0, Int(redValue) + intensity))
                }else{
                    pixel.red = 0
                }
                
                if Int(blueValue) + intensity > 0{
                    pixel.blue = UInt8(min(0, Int(blueValue) + intensity))
                }else{
                    pixel.blue = 0
                }
            
                if Int(greenValue) + intensity > 0{
                    pixel.green = UInt8(max(0, Int(greenValue) + intensity))
                }else{
                    pixel.green = 0
                }
            }else{
                if Int(redValue) + intensity < 255{
                    pixel.red = UInt8(min(255, Int(redValue) + intensity))
                }else{
                    pixel.red = 255
                }
                
                if Int(blueValue) + intensity < 255{
                    pixel.blue = UInt8(min(255, Int(blueValue) + intensity))
                }else{
                    pixel.blue = 255
                }
                
                if Int(greenValue) + intensity < 255{
                    pixel.green = UInt8(min(255, Int(greenValue) + intensity))
                }else{
                    pixel.green = 255
                }

            }
            
            myRGBA!.pixels[index] = pixel
        }
    }
    
    let newImage = myRGBA!.toUIImage()
    
    return newImage!
}

brightnessAdjustment(image!, intensity: 40)
