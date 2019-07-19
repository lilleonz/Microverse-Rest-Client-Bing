require 'rest-client'

class Search
    Url = "https://www.bing.com/search"
    def initialize
        @searchTerm = ''
        @result = ''
        userInput
        searchBing
        displayResults
    end
    def userInput
        puts "Enter your search query"
        @searchTerm = gets.chomp
        @searchTerm.split(" ").join("+")
    end
    def searchBing
        @result = RestClient.get Url, {params: {q: @searchTerm}}

    end
    def displayResults
        puts "Query response code : #{@result.code}"
        puts ''
        puts "Query response cookies : #{@result.cookies}"
        puts ''
        puts "Query response headers : #{@result.headers}"
        puts ''
        puts "Query response body : #{@result.body}"
    end
end

Search.new
