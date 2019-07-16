class LessonsController < ApplicationController
  before_action :authenticate_user!
  before_action :require_authorized_for_current_course, only: [:show]
  
  def show
    if current_user.enrolled_in?
      redirect_to instructor_course_path(@course)  
    end  
  end


  private

  def require_authorized_for_current_course
    if current_lesson.section.course != current_user.enrolled_in?
      alert "Not Enrolled in Course", status: :unauthorized
    end
  end
  

  helper_method :current_lesson
  def current_lesson
    @current_lesson ||= Lesson.find(params[:id])
  end
end