require 'grape-swagger'

class SwaggerRoot < Grape::API
  mount API
  add_swagger_documentation
end