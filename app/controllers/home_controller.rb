require "helix"
load "lib/video.rb"

class HomeController < ApplicationController

  before_filter :init

  def init
    Helix::Config.load("config/helix-settings.yml")
  end

  def index
  end

  def all_video; end

  def show_video
    guid = params[:guid] || ""
    @video = Helix::Video.find(guid)
  end

  def get_list
    filter_by       = params[:filter_by] || "created_at"
    contributor     = params[:contributor_name] || ""
    limit           = params[:limit] || 99
    query           = params[:query] || ""

    video_data = Video::get_top("", 
                            {
                              :contributor => contributor, 
                              :limit => limit,
                              :search_query => query
                            })
=begin
    video_data = [
      {
        "guid"            => "123", 
        "title"           => "title",
        "thumb-src"       => "/assets/rails.png",
        "created_at"      => "",
        "play_counts"     => 5,
        "duration"        => 0.3
      },
      {
        "guid"            => "123", 
        "title"           => "title",
        "thumb-src"       => "/assets/rails.png",
        "created_at"      => "",
        "play_counts"     => 5,
        "duration"        => 0.3
      },
      {
        "guid"            => "123", 
        "title"           => "title",
        "thumb-src"       => "/assets/rails.png",
        "created_at"      => "",
        "play_counts"     => 5,
        "duration"        => 0.3
      }
    ]
=end
    render :json => video_data and return
  end
end