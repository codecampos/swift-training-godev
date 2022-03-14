import UIKit

func isPalindrome(_ word:String) {
    if (word == String(word.reversed())) {
        print("A palavra \(word) é um palíndromo")
    } else {
        print("A palavra \(word) não é um palíndromo")
    }
}

let test = "radar"
isPalindrome(test)

let test2 = "casa"
isPalindrome(test2)

let test3 = "osso"
isPalindrome(test3)

