//: Playground - noun: a place where people can play

import UIKit

let image = UIImage(named: "sample")

// Process the image!

func dimImage(myImage:UIImage, dim_value:Int) -> UIImage{
    let myRGBA = RGBAImage(image: myImage)
    
    for y in 0 ..< myRGBA!.height{
        for x in 0 ..< myRGBA!.width{
            let index = y * myRGBA!.width + x
            var pixel = myRGBA!.pixels[index]
            let redValue = myRGBA!.pixels[index].red
            let blueValue = myRGBA!.pixels[index].blue
            let greenValue = myRGBA!.pixels[index].green
            
            if redValue > UInt8(dim_value){
                pixel.red = UInt8(max(0, redValue - UInt8(dim_value)))
            }else{
                pixel.red = 0
            }
            
            if blueValue > UInt8(dim_value){
                pixel.blue = UInt8(max(0, blueValue - UInt8(dim_value)))
            }else{
                pixel.blue = 0
            }
            
            if greenValue > UInt8(dim_value){
                pixel.green = UInt8(max(0, greenValue - UInt8(dim_value)))
            }else{
                pixel.green = 0
            }
            
            myRGBA!.pixels[index] = pixel
        }
    }
    
    let newImage = myRGBA!.toUIImage()
    
    return newImage!
}

dimImage(image!, dim_value: -2)


