module Smtp
  class BoundaryHeader < GenericHeader
    def initialize(boundary)
      super "--#{boundary}"
    end
  end
end
