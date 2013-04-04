require "helix"
load "lib/video.rb"

class HomeController < ApplicationController

  before_filter :init

  def init
    Helix::Config.load("config/helix-settings.yml")
  end

  def index
  end

  def get_list
    video_data = Video::get_top("", 
                            {
                              :contributor => "", 
                              :limit => 99,
                              :search_query => ""
                            })
    render :json => video_data and return
  end
end