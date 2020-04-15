//
//  Calculations.swift
//  Cooking Time!
//
//  Created by Daniel Golęba Frygies on 14/04:105.
//  Copyright © 2020 Tymon Golęba Frygies. All rights reserved.
//

import Foundation


struct Item {
    let egg = [
        Product(name: "Soft", time: 300, desc: "White is just set, and yolk is creamy. Serve on its own, over pasta, or on toast."),
        Product(name: "Medium", time: 420, desc: "Yolk is almost opaque and just firm. Great for composed salads."),
        Product(name: "Hard", time: 450, desc: "The all-purpose egg. Yolk is bright yellow and just cooked all the way through."),
        Product(name: "SuperHard", time: 660, desc: "You have ring-around-the-yolk because you boiled them for too long. Don't toss them; they're still edible. Many cultures prize long-cooked eggs.")
    ]
    
    let pasta = [
        Product(name: "raviolli", time: 600, desc: "Square shaped sheets of dough are stuffed with cheese, figs, meat or vegetables and boiled. Ravioli is usually cooked with light sauces because the pasta itself is so rich."),
        Product(name: "spaghetti", time: 480, desc: "An American favourite, spaghetti goes well with sauces that have oil or cream in them. It needs to be soft at all times so that you can slurp the long strands in all at once."),
        Product(name: "penne", time: 660, desc: "A cylindrical pasta, this one is slightly hard and takes longer to cook but it pairs really well with chunky and cream-based sauces and vegetables. "),
        Product(name: "macaroni", time: 480, desc: "Also known as elbow macaroni, this shape of pasta is usually used to make mac and cheese. But you can also mix it up with some vegetables and thick cheese sauce."),
        Product(name: "farfale", time: 660, desc: "This shape of pasta resembles a bow tie and is slightly pinched in the centre. It's got a large surface are which is why rich tomato or cream sauce sticks really well to its surface."),
        Product(name: "fusili", time: 780, desc: "This is probably one of the most common shapes you'll find and it resembles a cork screw. It's made by wrapping thin strips of pasta around long skewers and then cutting them into multiple pieces. ")
    ]
    
    
    func eggButtonPressed (title button: String) -> (String, Int, String) {
        
        var countDown: Int
        var picked: String
        var desc = String()
        
        switch button {
        case "Soft":
            countDown = egg[0].cookingTime
            picked = egg[0].name
            desc = egg[0].description
            return (picked,countDown,desc)
        case "Medium":
            countDown = egg[1].cookingTime
            picked = egg[1].name
            desc = egg[1].description
            return (picked,countDown,desc)
        case "Hard":
            countDown = egg[2].cookingTime
            picked = egg[2].name
            desc = egg[2].description
            return (picked,countDown,desc)
        case "SuperHard":
            countDown = egg[3].cookingTime
            picked = egg[3].name
            desc = egg[3].description
            return (picked,countDown,desc)
        default:
            countDown = egg[0].cookingTime
            picked = egg[0].name
            desc = egg[0].description
            return (picked,countDown,desc)
        }
    }
    
    func pastaButtonChosen (title button: String) -> (String, Int, String) {
        
        var countDown: Int
        var picked: String
        var desc = String()
        
        switch button {
        case "Ravioli":
            picked = pasta[0].name
            countDown = pasta[0].cookingTime
            desc = pasta[0].description
            return (picked,countDown, desc)
        case "Spaghetti":
            picked = pasta[1].name
            countDown = pasta[1].cookingTime
            desc = pasta[1].description
            return (picked,countDown, desc)
        case "Pene":
            picked = pasta[2].name
            countDown = pasta[2].cookingTime
            desc = pasta[2].description
            return (picked,countDown, desc)
        case "Macaroni":
            picked = pasta[3].name
            countDown = pasta[3].cookingTime
            desc = pasta[3].description
            return (picked,countDown, desc)
        case "Farfale":
            picked = pasta[4].name
            countDown = pasta[4].cookingTime
            desc = pasta[4].description
            return (picked,countDown, desc)
        case "Fusili":
            picked = pasta[5].name
            countDown = pasta[5].cookingTime
            desc = pasta[5].description
            return (picked,countDown, desc)
        default:
            picked = pasta[1].name
            countDown = pasta[1].cookingTime
            desc = pasta[1].description
            return (picked,countDown, desc)
        }
    }
    
 var remainingTime: (Int) -> String = { time in
        
        let minutes = String (time / 60)
        var seconds = String (time % 60)

        if time % 60 < 10 {
            seconds = "0\(seconds)"
        }
        
        print(minutes)
        print(seconds)
        return "\(minutes):\(seconds)"
    }
    
}


