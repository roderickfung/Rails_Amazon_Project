class ProductsController < ApplicationController
  # before_action :find_product, [except: :create]
  before_action :find_product, only: [:show, :edit, :update, :destroy] #takes in an argument for a method that gets executed just before action
  before_action :product_params, only: [:creat, :update]

  PRODUCTS_PER_PAGE = 10

  def show
    @product = Product.find params[:id]
    @reviews = @product.reviews
    @review = Review.new
  end

  def edit

  end

  def index
    # @prod = Product.order(id: :desc).page(params[:page]).per(@limit)
    # @limit = 10
    # binding.pry
    params[:page] ? @page = params[:page].to_i : @page = 1
    @query = params[:query]
    @sch = Product.search(params[:query])
    @prod = @sch.offset(10*(@page-1)).limit(PRODUCTS_PER_PAGE).order(id: :desc)
    @ent = @sch.length
  end

  def new
    #we are instantiating a new question object as it will help us build a form to create a question easily.
    @product = Product.new

    #when defining a method below is implied
    #render.new
    #render questions/new
  end

  def create
    #strong parameters feature of Rails to only let mass-assigning attributes that users are allowed to set.
    # questions_params = params.require(:question).permit([:title,:body])
    @product = Product.create product_params
    # question.save ? render (json: params) : (render :new)
    if @product.save
      # flash[:notice] = "Product created successfully."
      # render :show
      # redirect_to question_path({id: @question.id}) <- complicated way
      # redirect_to question_path ({id: @question})
      # redirect_to question_path(@question)
      redirect_to @product, notice: "Product created successfully."
    else
      flash[:alert] = error_messages
      render :new
    end
  end

  def update
    if @product.update product_params
      redirect_to product_path(@product), notice: "Product edited successfully."
    else
      flash[:alert] = error_messages
      render :edit
    end
  end

  def destroy
    @product.destroy
    redirect_to products_path
  end

  private

  def find_product
    @product = Product.find params[:id]
  end

  def product_params
    params.require(:product).permit([:title,:description,:price])
  end

  def error_messages
    @product.errors.full_messages.join('. ')
  end

end
