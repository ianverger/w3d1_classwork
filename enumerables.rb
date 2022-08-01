class Array

    def my_each(&prc)

        i = 0
        while i < self.length
            prc.call(self[i])
            i += 1
        end
        self
    end

    def my_select(&prc) #{|num| num >1}
        arr = [] #[1,2,3]
        self.my_each do |ele|
            if prc.call(ele)
                arr << ele 
            end
        end

        arr
    end


end

a = [1, 2, 3]
p a.my_select { |num| num > 1 } # => [2, 3]
p a.my_select { |num| num == 4 } # => []


