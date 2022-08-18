

//MARK: - Object Pool Design Pattern

class Book {
    var title: String
    var author: String
    
    init(title: String, author: String) {
        self.title = title
        self.author = author
    }
}


class BookPool {
    var books: [Book]
    
    init(books: [Book]) {
        self.books = books
    }
    
    func getBook() -> Book? {
        
        if books.isEmpty {
            print("Pool is empty")
            return nil
        }
        print("Book has given")
        return books.removeFirst()
    }
    
    func returnBook(book: Book) {
        books.append(book)
    }
}


let bookPool = BookPool(books: [Book(title: "fsd", author: "dsf"),
                                Book(title: "rrrr", author: "ooooo"),
                                Book(title: "ttttt", author: "mmmmmm")])
let book1 = bookPool.getBook()
let book2 = bookPool.getBook()
let book3 = bookPool.getBook()
let book4 = bookPool.getBook()
bookPool.returnBook(book: Book(title: "return", author: "return"))
let book5 = bookPool.getBook()
