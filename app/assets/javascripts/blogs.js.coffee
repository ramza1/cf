# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

jQuery ->
  $('#blog_published_at, #tip_published_at, #video_published_at, #magazine_published_at, #slide_published_at, #right_ad_start_date, #right_ad_end_date, #top_ad_start_date, #top_ad_end_date, #trend_spotting_published_at, #men_fashion_published_at, #runway_collection_published_at, #functional_fashion_published_at, #look_book_published_at, #redcarpet_published_at, #fashion_jury_published_at, #feature_published_at').datepicker
    dateFormat: 'yy-mm-dd'
