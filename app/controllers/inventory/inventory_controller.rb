class Inventory::InventoryController < Inventory::ApplicationController

	def index
		if params[:q] then
			add_breadcrumb "Search Results", :inventory_root_path
			@items = Inventory.where('description like ?', '%' + params[:q] + '%').order(:description).page(params[:page])
		else
			@items = Inventory.order(:description).page(params[:page])
		end
	end

	def show
		@item = Inventory.find(params[:id])
		if @item.type == "ContactsInventory" then
			redirect_to inventory_contacts_inventory_path(@item)
		else
			if @item.type == "FramesInventory" then
				redirect_to inventory_frames_inventory_path(@item)
			else
				if @item.type == "LensInventory" then
					redirect_to inventory_lens_inventory_path(@item)
				else
					if @item.type == "ServicesInventory" then
						redirect_to inventory_services_inventory_path(@item)
					else
						redirect_to inventory_other_inventory_path(@item)
					end
				end
			end
		end
	end
end
