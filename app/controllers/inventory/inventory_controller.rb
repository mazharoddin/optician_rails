class Inventory::InventoryController < Inventory::ApplicationController

	def index
		@items = Inventory.order(:description).page(params[:page])
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
					redirect_to inventory_lenses_inventory_path(@item)
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
