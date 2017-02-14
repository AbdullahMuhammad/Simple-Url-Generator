class API < Grape::API
  prefix 'api'
  format :json
  mount UrlGenerator::API
end