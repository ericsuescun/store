class ProductsController < ApplicationController
	def new
		@product = Product.new
	end

	def create
		@product = Product.new(product_params)
	 
		if @product.save
	 	 		redirect_to @product
		else
			render :new
		end
	end

	private
	  	def product_params
	    	params.require(:product).permit(:name, :price, {category_ids: []})
	  	end
end
