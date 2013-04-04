load "lib/video.rb"
require "helix"

class HomeController < ApplicationController

  before_filter :init

  def init
    Helix::Config.load("config/helix-settings.yml")
  end

  def index
  end
end