module Gitscrub
  class Level

    attr_accessor :ldifficulty, :ldescription, :lsolution
    
    class << self
      
      def load(level_no)
        level = new
        level.instance_eval(File.read("../levels/#{level_no}.rb"))
        level
      end

    end

    def difficulty(num)
      @ldifficulty = num
    end

    def description(description)
      @ldescription = description
    end

    def solution(&block)
      @lsolution = block
    end

    def solve
      lsolution.call
      true
    rescue
      false
    end

  end
end