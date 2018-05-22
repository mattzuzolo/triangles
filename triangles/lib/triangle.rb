class Triangle

      attr_accessor :length1, :length2, :length3

      def initialize(length1, length2, length3)
        @length1 = length1
        @length2 = length2
        @length3 = length3
      end



      def kind

          if is_triangle?(length1, length2, length3) && triangle_inequality?(length1, length2, length3)
                triangle_type(length1, length2, length3) #check what type
          else
            begin
                raise TriangleError
            rescue TriangleError => error
                puts error.message
            end
          end #end triangle inequality

      end #end kind method

      class TriangleError < StandardError
          def message
              "You must provide the dimensions of a mathematically possible triangle."
          end
      end
end #end class


def is_triangle?(length1, length2, length3)
    length1 > 0 && length2 > 0 && length3 > 0
end

def triangle_inequality?(length1, length2, length3)
  if ((length1 + length2) > length3) || ((length2 + length3) > length1) || ((length1 + length3) > length2)
    true
  else
    false
  end
end

def triangle_type(length1, length2, length3)
    if length1 == length2 && length2 == length3
      :equilateral
    elsif length1 == length2 || length2 == length3 || length1 == length3
      :isosceles
    else
      :scalene
    end
end

Triangle.new(60,60,60).kind
