class RestSearch
    include ActiveModel::Model
  
    attr_accessor :search_name
  
    def execute
      RestModel.ransack(name_eq: @search_name).result
    end
  end