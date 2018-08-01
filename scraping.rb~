require 'mechanize'

link = "http://review-movie.herokuapp.com/"
agent = Mechanize.new
links = []
page = agent.get(link)
elements = page.search('h2 a')
elements.each do |ele|
  a = ele.get_attribute('href')
  links << "http://review-movie.herokuapp.com#{a}"
end
puts links

links.each do |t|
  agent = Mechanize.new
  page = agent.get(t)
  elements = page.search('.entry-content img')
  elements.each do |a|
    img = a.get_attribute('src')
    title = a.get_attribute('alt')
    b = Product.where(title: title, image_url: img).first_or_initialize
    b.save
  end
end
