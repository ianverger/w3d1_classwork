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
        self.my_each { |ele| arr << ele if prc.call(ele) }
        arr
    end

    def my_reject(&prc)
        arr = []
        self.my_each { |ele| arr << ele if !prc.call(ele) }
        arr
    end

    def my_any?(&prc)
        self.my_each { |ele| return true if prc.call(ele) }

        false
    end

    def my_all?(&prc)
        self.my_each { |ele| return false if !prc.call(ele) }

        true
    end

    def my_zip(*args)
        result = Array.new(self.length) { Array.new(args.length + 1)}
        all_args = args.unshift(self)
       
        (0...self.length).each do |row| 
            (0...all_args.length).each do |col| 
                result[row][col] = all_args[col][row]
            end
        end

        result
    end
   
    def my_rotate(n = 1)
        arr = self.dup

        if n > 0
            n.times do |ele|
                holder = arr.shift
                arr.push(holder)
            end
        else
            (n * -1).times do |ele|
                holder = arr.pop
                arr.unshift(holder)
            end
        end
        return arr
    end

    def my_join(sep = "")
        result = ""

        self.each { |char| result += char + sep }
        result
    end

    def my_reverse
        result = []

        i = self.length - 1
        while i >= 0
            result << self[i]
            i -= 1
        end
        result
    end

    def my_flatten
        arr = []
        self.each do |ele| 
            if ele.is_a?(Array)
                arr += ele.my_flatten 
            else
                arr << ele
            end
        end
        arr
    end

     # def flatten(data)
    #     return [data] if !data.is_a?(Array)
    #     flattened = []
    #     data.each { |ele| flattened += flatten(ele) }
    #     flattened
    #   end
end

print [1, 2, 3, [4, [5, 6]], [[[7]], 8]].my_flatten # => [1, 2, 3, 4, 5, 6, 7, 8]




