class Scraping
  def self.get_next_page_url(link)
    agent = Mechanize.new
    category_links = []
    category_links << "http://review-movie.herokuapp.com/"
    16.times do
      page = agent.get(category_links[-1])
      elements = page.search('.navigation .next a')
      elements.each do |t|
        last_url = t.get_attribute('href')
        category_links << "http://review-movie.herokuapp.com#{last_url}"
      end
    end
    url = category_links[10, 16]
    puts url
    save_title_img_to_DB(url)
  end

  def self.save_title_img_to_DB(link)
    link.each do |link|
      agent = Mechanize.new
      links = []
      page = agent.get(link)
      elements = page.search('h2 a')
      elements.each do |ele|
        a = ele.get_attribute('href')
        links << "http://review-movie.herokuapp.com#{a}"
      end

      links.each do |t|
        agent = Mechanize.new
        page = agent.get(t)
        title = page.at('.entry-title').inner_text if page.at('.entry-title')
        image_url = page.at('.entry-content img')[:src] if page.at('.entry-content img')
        director = page.at('.director span').inner_text if page.at('.director span')
        detail = page.at('.entry-content p').inner_text if page.at('.entry-content p')
        open_date = page.at('.date span').inner_text if page.at('.date span')

        b = Product.where(title: title,
                          image_url: image_url,
                          director: director,
                          detail: detail,
                          open_date: open_date).first_or_initialize
        b.save
      end
    end
  end
end
