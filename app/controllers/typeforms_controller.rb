class TypeformsController < ApplicationController
  def index
    @typeforms = Typeform.all.order(created_at: :desc)
  end

  def show
    @typeform = Typeform.find(params[:id])
  end

  def new
    @typeform = Typeform.new(params[:id])
  end

  def create
    @typeform = Typeform.new(typeform_params)
    if @typeform.save
      redirect_to @typeform
    else
      render :new
    end
  end

  private

  def typeform_params
    params.require(:typeform).permit(:body)
  end
end
