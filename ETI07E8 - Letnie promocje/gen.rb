
def randomString(min, max)
	size = rand(max-min+1)+min;
	(1..size).map{ ('a'..'z').to_a[rand(26)] }.join
end

def randomNumber(min, max)
	size = rand(max-min+1)+min;
	(1..size).map{ ('2'..'9').to_a[rand(8)] }.join
end

Words = 100 * 1000;
Numbers = 1000 * 1000;

# Words = 10;
# Numbers = 10;

puts Words, Numbers

Words.times{
	puts randomString(3, 15)
}

Numbers.times{
	puts randomNumber(3, 15)
}

