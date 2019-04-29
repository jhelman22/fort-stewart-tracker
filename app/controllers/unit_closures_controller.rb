class UnitClosuresController < ApplicationController

  def index
    @all_units = UnitClosure.all
  end
end
