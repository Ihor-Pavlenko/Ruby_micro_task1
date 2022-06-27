
    class ShopInventory
        def initialize(inventory)
            @inventory = inventory
        end
        def item_in_stock
            output = []
            @inventory.each do |name|
                item = name[:name]
                output << item if not name[:quantity_by_size].empty?
            end
            output.sort
        end

        def affordable
            output = []
            @inventory.each do |item|
                output << item if item[:price] < 50
            end
            output
        end

        def out_of_stock
            output = []
            @inventory.each do |item|
                output << item if item[:quantity_by_size].empty?
            end
            output
        end

        def how_much_left(drink)
            @inventory.each do |item|
                return item[:quantity_by_size] if item.has_value?(drink)
            end
        end

        def total_stock
            sum = 0
            @inventory.each do |item|
                item[:quantity_by_size].each { |key, value| sum += value}
            end
            sum
        end
    end