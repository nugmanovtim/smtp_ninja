module Smtp
  class EndingBoundaryHeader < GenericHeader
    def initialize(value)
      super "--#{value}--"
    end
  end
end
