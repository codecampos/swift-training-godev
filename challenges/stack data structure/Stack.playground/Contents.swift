import UIKit

class Box {
    
    var books : [String] = []
    var top = -1
    
    func push(book : String) {
        books.append(book)
        top = top + 1
    }
    
    func pop() {
        if (!books.isEmpty) {
            books.remove(at: top)
            top = top - 1
        } else {
            isEmpty()
        }
    }
    
    func isEmpty() {
        if(books.isEmpty){
            print("A pilha está vazia")
        } else {
            print("A pilha não está vazia")
        }
    }
    
    func printBox(){
        print("Box: \(books)")
    }
}

var booksBox = Box()

booksBox.printBox()
booksBox.pop()

booksBox.push(book: "HP")
booksBox.push(book: "HP2")
booksBox.push(book: "HP3")
booksBox.printBox()

booksBox.isEmpty()

booksBox.pop()
booksBox.printBox()


