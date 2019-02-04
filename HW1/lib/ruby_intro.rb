# 1. Arrays, Hashes, and Enumerables
def sum(array)
	total = 0
	if array.length > 0
		array.each do |item|
			total += item
		end
		return total
    else return 0
	end
end

def max_2_sum(array)
	max1 = 0
	max2 = 0 
	total = 0
	if array.length > 1
		max1 = array.sort[-1]
		max2 = array.sort[-2]
		total = max1 + max2 
		return total
		else if array.length == 1
			return array[0]
			else
				return 0
		end 
	end
end

def sum_to_n?(array,n)
	result = false
	if array.length  > 1
		for i in 1..array.length  - 1
			for j in 0..i - 1
				if array[j] + array[i] == n
					result = true
					break
				end
			end
		end
	end
	return result
end

# 2. Strings and Regular Expressions
def hello(name)
	"Hello, #{name}"
end

def starts_with_consonant? (s)
	/^[b-df-hj-np-tv-z]/i.match(s) != nil
end

def binary_multiple_of_4? (s)
	return true if s == "0"
	/^[10]*00$/.match(s) != nil
end

# 3. Object Oriented Basics
class BookInStock 
    
    attr_accessor :isbn
	attr_accessor :price
    
	def initialize(isbn,price)
		@isbn=isbn
		@price=price
		# exeption 
		if @isbn.empty? || @price <= 0 
			raise ArgumentError
		end
	end

	def price_as_string
		"$#{'%.2f' %  @price}"
	end

end