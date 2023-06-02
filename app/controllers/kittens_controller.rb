class KittensController < ApplicationController
  def index
    @kittens = Kitten.all
  end

  def show
    @kitten = Kitten.find(params[:id])
  end

  def new
    @kitten = Kitten.new
  end

  def create
    @kitten = Kitten.new kitten_params

    if @kitten.save
      redirect_to @kitten, notice: 'Kitten created successfully'
    else
      render :new, status: :unprocessable_entity, alert: 'Kitten not created'
    end
  end

  def edit
    @kitten = Kitten.find(params[:id])
  end

  def update
    @kitten = Kitten.find(params[:id])

    if @kitten.update(kitten_params)
      redirect_to @kitten, notice: 'Kitten updated successfully'
    else
      render :edit, status: :unprocessable_entity, alert: 'Kitten not updated'
    end
  end

  def destroy
    kitten = Kitten.find(params[:id])
    kitten.destroy

    redirect_to root_path, status: :see_other, notice: 'Kitten deleted successfully'
  end


  private

  def kitten_params
    params.require(:kitten).permit(:name, :age, :softness, :cuteness)
  end
end
