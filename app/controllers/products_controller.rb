class ProductsController < ApplicationController

	def index
		@products = Product.all
		@category = Category.all
	end

	def new
		@product = Product.new
		@category = Category.all
	end

	def edit
		@product = Product.find(params[:id])
		@category = Category.all
	end

	def create
		@product = Product.new(product_params)
	 
		if @product.save
	 	 		redirect_to products_path
		else
			render :new
		end
	end

	def update
		@product = Product.find(params[:id])

		if @product.update(product_params)
			redirect_to products_path
		else
			render 'edit'
		end
	end

	def destroy
		@product = Product.find(params[:id])
		@product.destroy
		
		redirect_to products_path
	end

	private
	  	def product_params
	    	params.require(:product).permit(:name, :price, {category_ids: []})
	  	end
end
