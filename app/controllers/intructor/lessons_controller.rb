class Intructor::LessonsController < ApplicationController
  def new
    @section = section.find(params[:section_id])
  end
end
