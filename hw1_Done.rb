#Homework Problem 1 (a)
puts "Ruby Homework 1 for Software Engineering (Spring 2018)"
puts
puts "Problem 1 (a)"
def palindrome?(string)


  updatedString = string.split(/\s+/).select{|s| s}. 
        map{|s| s.downcase} #this splits the word into a list and then downcases each letter
      
  
  editedWord = updatedString.join() #join the list of characters back into a string
  editedWord = editedWord.gsub(/[,'!-]/, '') #remove non letter characters like , ! ' or -
  
  
  puts (editedWord == editedWord.reverse) ? true : false #compares the word with the reversed version of the word and returns true if there is a match and false for no match

end

#tests of palindrome?
palindrome?("A man, a plan, a canal -- Panama") #=> true
palindrome?("Madam, I'm Adam!") # => true
palindrome?("Abracadabra") # => false (nil is also ok)
#End of problem 1 (a)

#Problem 1 (b)
puts
puts "Problem 1 (b)"

def count_words(text)
  
stringHash = Hash.new 0 

editedTest = text.downcase.gsub(/[,'!-]/, '')
splitText = editedTest.split(/\s+/)

splitText.each {|string| stringHash[string] += 1} #when it hits another word 
return stringHash

end


puts "#{count_words("A man, a plan, a canal -- Panama")}"
puts "#{count_words("Doo, bee Doo Bee! doo")}"



#Problem 2 
puts
puts "Problem 2"

gameOne = [ [ "Armando", "R" ], [ "Dave", "S" ] ] 
gameTwo = [ [ "Armando", "R" ], [ "Dave", "P" ] ] 

class WrongNumberOfPlayersError < StandardError ; end
class NoSuchStrategyError < StandardError ; end
  
  
def rps_game_winner(game)
 raise WrongNumberOfPlayersError unless game.length == 2
 
 #puts game
 playerOne = game[0][0] #playerOne's name is is the first index of the array
 playerOne_Strategy = game[0][1].downcase #playerOne's strategy is in the first array, second element
 playerTwo = game[1][0] #playerTwo's name is in the second array of the list, first element
 playerTwo_Strategy = game[1][1].downcase  #playerTwo's strategy is in the second array of the list, second element
 
 #raise error if the strategies are not r, s, or p
 raise NoSuchStrategyError unless (playerOne_Strategy == "r") || (playerOne_Strategy == "s") || (playerOne_Strategy == "p")
 raise NoSuchStrategyError unless (playerTwo_Strategy == "r") || (playerTwo_Strategy == "s") || (playerTwo_Strategy == "p")
 
 #puts "#{playerOne} plays #{playerOne_Strategy}"
 #puts "#{playerTwo} plays #{playerTwo_Strategy}"
 
 #compare the strategies to determine who wins
  if  playerOne_Strategy == "r"                    
    if playerTwo_Strategy == "s"
      winner = game[0]
    elsif playerTwo_Strategy == "r"
      winner = game[0]
    elsif playerTwo_Strategy == "p"
      winner = game[1]
    end
  elsif playerOne_Strategy == "s" 
    if playerTwo_Strategy == "p"
      winner = game[0]
    elsif playerTwo_Strategy == "s"
      winner = game[0]
    elsif playerTwo_Strategy == "r"
      winner = game[1]
    end
  elsif playerOne_Strategy == "p"                            
    if playerTwo_Strategy == "r"
      winner = game[0]
    elsif playerTwo_Strategy == "p"
      winner = game[0]
    elsif playerTwo_Strategy == "s"
      winner = game[1]
    end
  end
  
  puts "Winner is #{winner[0]} with #{winner[1]}"
  return winner
  
end

rps_game_winner(gameOne)
rps_game_winner(gameTwo)



#problem 3
puts
puts "Problem 3"

def combine_anagrams(words)

    copyArray = Array.new [] #a copy of the array passed as an argument
    temporaryArray = Array.new []  #will hold our results temporarily until they can be put into newArray
    
    copyArray = words #make a copy of the array we will be inspecting
    temporaryArray = []
    newArray = [] #the array with the results
    theArrayCount = 0
    arrayCount2 = 0
    
    #until we run out of elements in the copyArray, index 0 is nil, iterate through it
    
    	  until copyArray[0] == nil
    
    	    #puts "CURRENT WORD: #{copyArray[0]}"
    	    comparisionWord = copyArray[0] #word we are compareing 
    	    copyArray.delete_at(0) #delete the word in the copy array, we have it saved in comparisionWord
    	    #puts "current array of matches now: #{temporaryArray}"
      	    #puts "current original: #{copyArray}"
    	    
    	    #for each element of the copyarray, it will be compared to the comparisionWord to see if it is an anagram
      	    copyArray[0..copyArray.length].each do |compareWord|
      	      #puts "arraycount1: #{arrayCount} and arraycount2: #{arrayCount2}"
      	      #puts "word: #{comparisionWord} and compareword: #{compareWord}"
      	      #puts "TEST: #{compareWord.chars.sort} with #{comparisionWord.chars.sort}"
      	      if compareWord.downcase.chars.sort == comparisionWord.downcase.chars.sort 
      	        #puts "match #{compareWord}"
      	        #puts "#{comparisionWord}"
      	        temporaryArray.push(copyArray[arrayCount2]) #if the word is a match, push it onto the temporary array
      	        copyArray.delete(compareWord) #delete the word from the copyArray
    
      	       #puts "current array of matches now: #{temporaryArray}"
      	        #puts "current original: #{copyArray}"
      	        theArrayCount = theArrayCount - 1 #move the counter back so it reflects the size of the array now that an element was deleted
      	      else
      	       # puts "#{compareWord} NO MATCH #{comparisionWord}"
      	        ##copyArray.delete_at(arrayCount2)
      	        #temporaryArray.delete_at(arrayCount2)
      	        arrayCount2 = arrayCount2 + 1 #if there is no match, iterate through the array by incrementing the counter
      	      end
                
      	      
      	    end
      	    temporaryArray.push(comparisionWord) #once we reach this point, we can finally push the word we have been comparing against onto the array
      	   newArray.push(temporaryArray) 
      	   temporaryArray = [] #reset this array so it can be used again to contain the results 
      	   arrayCount2 = 0 #reset the counter
      	   theArrayCount = theArrayCount + 1 #increment the outer counter so we can continue to compare words
      	   #puts "NUMBER1: #{arrayCount}"
    	   # arrayCount = arrayCount + 1
    	   #puts "Array with anagrams #{newArray}"
    	  end
    	  
    	  return newArray #once we are done, return the array of results
	  
end


listWords = ['cars', 'for', 'potatoes', 'racs', 'four','scar', 'creams', 'scream']
puts "List, listWords: #{listWords}"
puts "Anagrams sorted: #{combine_anagrams(listWords)}"
listWords = ['Neo', 'is', 'the', 'One', 'What', 'waht', 'Whoa']
puts "List, listWords: #{listWords}"
puts "Anagrams sorted: #{combine_anagrams(listWords)}"







#Problem 4
puts 
puts "Problem 4"
puts

#Part (a)
class Dessert
 def initialize(name, calories)
    @name = name
    @calories = calories
 end
 
 def name #This method gets inherited into the jellybean class as well which is handy
   @name
 end

 def healthy?
  if @calories <= 200
    return true
  else
    false
  end
 end

 def delicious?
  return true
 end
end

class JellyBean < Dessert
 def initialize(name, calories, flavor)
  @name = name
  @calories = calories
  @flavor = flavor
 end

 def delicious?
 if @flavor.downcase == "black licorice"
   return false
 else
   return true
 end
 end 
end

cake = Dessert.new("Low Cal Birthday Cake", 199)
cookie = Dessert.new("Chocolate Chip Cookie", 2000)
puts "#{cake.name} is delicious: #{cake.delicious?}"
puts "#{cake.name} is healthy: #{cake.healthy?}"
puts "#{cookie.name} is healthy: #{cookie.healthy?}"
licorice = JellyBean.new("licorice jellybean", 1000, "Black Licorice")
orangeJelly = JellyBean.new("Orange JellyBean", 1000, "Orange")
puts "#{orangeJelly.name} is delicious: #{orangeJelly.delicious?}"
puts "#{orangeJelly.name} is delicious: #{orangeJelly.delicious?}"
puts "#{licorice.name} is delicious: #{licorice.delicious?}"