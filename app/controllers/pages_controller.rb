class PagesController < ApplicationController
  include AreaClosures

  def home
    @all_units = UnitClosure.all
    @todays_closures = todays_closures
  end
end
