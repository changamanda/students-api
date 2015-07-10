class StudentsController < ApplicationController
  respond_to :json

  def index
    if params[:cohort_id]
      respond_with Cohort.find(params[:cohort_id]).students
    else
      respond_with Student.all
    end
  end

  def show
    begin
      student_hash = Student.find(params[:id]).attributes
      student_hash["message"] = "A message!"
      respond_with student_hash
    rescue ActiveRecord::RecordNotFound
      raise "Invalid Student ID!"
    end
  end
end
