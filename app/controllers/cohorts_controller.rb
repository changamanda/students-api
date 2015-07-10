class CohortsController < ApplicationController
  respond_to :json

  def index
    respond_with Cohort.all
  end

  def show
    begin
      cohort = Cohort.find(params[:id])
      respond_with cohort
    rescue ActiveRecord::RecordNotFound
      raise "Invalid ID!"
    end
  end

  def create
    cohort = Cohort.new(cohort_params)
    if cohort.save
      render nothing: true, status: 201
    end
  end

  def update
    begin
      cohort = Cohort.find(params[:id])
      cohort.assign_attributes(cohort_params)
      if cohort.save
        render nothing: true, status: 202
      end
    rescue ActiveRecord::RecordNotFound
      raise "Invalid ID!"
    end
  end

  def destroy
    begin
      cohort = Cohort.find(params[:id])
      cohort.destroy
      render nothing:true, status: 202
    rescue ActiveRecord::RecordNotFound
      raise "Invalid ID!"
    end    
  end

  private

    def cohort_params
      params.require(:cohort).permit(:name, :kind)
    end
end
