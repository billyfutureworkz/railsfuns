class ProductsController < ApplicationController
	def index
		@products = Product.all.includes(:category).published
	end

	def show
		@product = Product.find(params[:id])
	end

	def new
	  @product = Product.new	
	end
  
  def edit
    @product = Product.find(params[:id])
  end

  def update
    @product = Product.find(params[:id])
    if @product.update_attributes(product_params)
      # Handle a successful update.
    else
      render 'edit'
    end
  end

	def create
	  @product = Product.new(product_params)	
	  if @product.save
      flash[:notice] = "you have successfully created product"
	    redirect_to products_url
	  else
      flash.now[:notice] = "there is an error in your form"
	  	render :new  
	  end
	end

	private 
	  def product_params
	  	params.require(:product).permit(:title, :description, :price, :category_id)
	  end
end

