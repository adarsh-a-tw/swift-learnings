// Given a text, print out each word with number of occurences in the order of most to least

// Eg."Hello world.This is a hello world question"

// 7 words

// hello:2
// world:2
// this:1
// is:1
// a:1


func countWords(text:String) -> (count:Int,frequency:[String:Int]){
    var frequencyMap:[String:Int] = Dictionary()
    
    let lowerCased = text.lowercased()
    var tempWord = ""
    var count = 0
    
    for character in lowerCased {
        if (character.isWhitespace || [",",".","?",":"].contains(character)){
            if let found = frequencyMap[tempWord]{
                frequencyMap[tempWord] = found + 1
            }else{
                frequencyMap[tempWord] = 1
            }
            count += 1
            tempWord = ""
            continue
        }
        tempWord += String(character)
    }
    
    return (count,frequencyMap)
}

let text = "Hello world.This is a hello world question"
let result = countWords(text: text)

print("\(result.count) words\n")

for (word,freq) in result.frequency.sorted(by: {$0.value > $1.value}){
    print(word,freq,separator: ":")
}
