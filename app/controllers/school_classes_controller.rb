class SchoolClassesController < ApplicationController
  def index
    @classes = SchoolClass.all
  end

  def new
  end

  def create
    @cla = SchoolClass.create(title: params[:school_class_title], room_number: params[:school_class_room_number])

    redirect_to class_path(@cla)
  end
  def show
    @cla = SchoolClass.find(params[:id])
  end
  def edit
    @cla = SchoolClass.find(params[:id])
  end

  def update
    @cla = SchoolClass.find(params[:id])
    @cla.update(post_params(:title, :room_number))

    redirect_to class_path(@cla)
  end

  private

  def post_params(*args)
    params.require(:school_class).permit(*args)
  end
end
