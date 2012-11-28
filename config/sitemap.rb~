# Set the host name for URL creation
SitemapGenerator::Sitemap.default_host = "http://www.cfmagazineonline.com"

SitemapGenerator::Sitemap.create do
  add '/home', :changefreq => 'daily', :priority => 0.9


  add blogs_path, :priority => 0.7, :changefreq => 'daily'
  add redcarpets_path, :priority => 0.7, :changefreq => 'daily'
  add fashion_fashion_juries_path, :priority => 0.7, :changefreq => 'daily'
  add fashion_men_fashions_path, :priority => 0.7, :changefreq => 'daily'
  add fashion_trend_spottings_path, :priority => 0.7, :changefreq => 'daily'
  add runway_path, :priority => 0.7, :changefreq => 'daily'

  add fashion_path, :priority => 0.7, :changefreq => 'daily'
  add styles_path, :priority => 0.7, :changefreq => 'daily'
  add style_functional_fashions_path, :priority => 0.7, :changefreq => 'daily'
  add style_look_books_path, :priority => 0.7, :changefreq => 'daily'
  add style_tips_path, :priority => 0.7, :changefreq => 'daily'
  add features_path, :priority => 0.7, :changefreq => 'daily'
  #
  # Add all articles:
  #
  Blog.find_each do |story|
    add blog_path(story), :lastmod => story.updated_at
  end

  Redcarpet.find_each do |story|
    add redcarpet_path(story), :lastmod => story.updated_at
  end

  FashionJury.find_each do |story|
    add fashion_fashion_jurie_path(story), :lastmod => story.updated_at
  end

  MenFashion.find_each do |story|
    add fashion_men_fashion_path(story), :lastmod => story.updated_at
  end

  TrendSpotting.find_each do |story|
    add fashion_trend_spotting_path(story), :lastmod => story.updated_at
  end

  Collection.find_each do |story|
    add runway_collection_path(story), :lastmod => story.updated_at
  end

  FunctionalFashion.find_each do |story|
    add style_functional_fashion_path(story), :lastmod => story.updated_at
  end

  LookBook.find_each do |story|
    add style_look_book_path(story), :lastmod => story.updated_at
  end

  Tip.find_each do |story|
    add style_tip_path(story), :lastmod => story.updated_at
  end

  Feature.find_each do |story|
    add feature_path(story), :lastmod => story.updated_at
  end
end
