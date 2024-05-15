module ApplicationHelper
    def data_br(data_us)
        if data_us != nil
            data_us.strftime("%d/%m/%Y")
        end
    end
end
