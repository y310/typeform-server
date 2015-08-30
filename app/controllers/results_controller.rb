class ResultsController < ApplicationController
  protect_from_forgery with: :null_session, only: :create
  before_action :set_typeform, only: [:index, :create]

  def index
    @results = @typeform.results.order(created_at: :desc)
  end

  def show
    @result = Result.find(params[:id])
  end

  def create
    @result = @typeform.results.find_or_initialize_by(result_params.slice(:token))
    if @result.update(result_params)
      head :created
    else
      head :unprocessable_entity
    end
  end

  private

  def set_typeform
    @typeform = Typeform.find(params[:typeform_id])
  end

  def result_params
    params.require(:result).permit(:token, :uid).merge(params[:result].slice(:answers))
  end
end
