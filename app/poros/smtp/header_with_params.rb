module Smtp
  class HeaderWithParams < Header
    def initialize(key, value, params)
      @key = key
      @value = value
      @params = params
      super @key, value_with_params
    end

    private

    def value_with_params
      ([@value] + converted_params).join(';')
    end

    def converted_params
      @converted_params ||= @params.to_a.select { |_, value| value.present? }
                                   .map { |key, value| "#{key} = #{value}" }
    end
  end
end
