module InvoicesHelper

	def invoice_status_label(invoice)
		if invoice.void_date != nil then
			return raw "<span class=\"label label-important\">Void</span>"
		end
		if invoice.invoice_date != nil then
			if invoice.balance == 0 then
				return raw "<span class=\"label label-success\">Paid</span>"
			end
			return raw "<span class=\"label label-info\">Confirmed</span>"
		end
		return raw "<span class=\"label\">New</span>"
	end
end
