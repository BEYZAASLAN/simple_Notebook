struct Notes {
  var title: String
  var content: String
}

var notes = [Notes]()

func listNote() {
  if notes.isEmpty {
      print("add first note")
  } else {
      for (index, note) in notes.enumerated() {
          print("\(index + 1). \(note.title)")
      }
  }
}

func addNote() {
  print("create note title:")
  let title = readLine() ?? ""
  
  if title.isEmpty {
      print("Are you sure want to leave the title field blank? ")
      return
  }
  
  print("Contents:")
  let content = readLine() ?? ""
  
  if content.isEmpty {
      print("pls add some content")
      return
  }
  
  let newNote = Notes(title: title, content: content)
  notes.append(newNote)
  print("your note has been added successfully.")
}

func viewNote() {
  listNote()
  
  if !notes.isEmpty {
      print("enter the number of the note you want to view:")
      if let index = Int(readLine() ?? ""), index > 0, index <= notes.count {
          let note = notes[index - 1]
          print("title: \(note.title)")
          print("İçerik: \(note.content)")
      } else {
          print("try again there is not such note number")
      }
  }
}

func mainMenu() {
  print("Main Menu:")
  print("1. List notes")
  print("2. new add note")
  print("3. View")
  print("4. Finish")
  print("Choose from (1-4):")
}

var active = true
while active {
  mainMenu()
  
  if let choice = Int(readLine() ?? ""), (1...4).contains(choice) {
      switch choice {
      case 1:
          listNote()
      case 2:
          addNote()
      case 3:
          viewNote()
      case 4:
          active = false
          print("program exited")
      default:
          break
      }
  } else {
      print("Try again")
  }
}
