module UrlGenerator
  class API < Grape::API
    version 'v1', using: :path
    helpers do
      def return_hash
        ret_hash = {}
        ret_hash[:status] = "Success"
        ret_hash
      end
    end
      resource :tracked_urls do
        post do
          return_message = return_hash
          if params[:destination_id].present? && params[:name].present?
            d = DestinationUrl.find_by_id(params[:destination_id])
            if d.present?
              tracked = TrackedUrl.create(name: params[:name], destination_url_id: params[:destination_id].to_i)
              return_message[:message]= "Tracked Urlis added."
              return_message[:tracked_url]= tracked
            else
              return_message[:message]= "Destination Url does not exist."
            end
          else
            return_message[:message]= "Something is missing. Destination id or tracked url is missing."
          end
          return_message
        end

        put ':id' do
          tracked_url = TrackedUrl.find_by_id(params[:id])
          return_message = return_hash
          if tracked_url.present?
            if params[:name].present?
              TrackedUrl.find(params[:id]).update({name: params[:name], destination_url_id: tracked_url.destination_url_id})
              return_message[:message]= "Tracked Url Updated"
              return_message[:tracked_url]= tracked_url
            else
              return_message[:message]=  "Something is missing. Tracked url is missing."
            end
          else
            return_message[:message]= "Tracked Url does not exist."
          end
          return_message
        end

        get ':id' do
          tracked_url = TrackedUrl.includes(:visitors).where(id: params[:id]).first
          return_message = return_hash
          if tracked_url
            return_message[:tracked_url]= tracked_url
            return_message[:visitors] = tracked_url.visitors
          else
            return_message[:message]= "Tracked Url does not exist."
          end
          return_message
        end

        get ':id/delete' do
          tracked_url = TrackedUrl.includes(:visitors).where(id: params[:id]).first
          return_message = return_hash
          if tracked_url
            if tracked_url.visitors.blank?
              tracked_url.destroy
              return_message[:message]= "Tracked Url deleted successfully."
            else
              return_message[:message]= "Can not delete because data is associated."
            end
          else
            return_message[:message]= "Tracked Url does not exist."
          end
          return_message
        end

        get do
          tracked_urls = TrackedUrl.all
          return_message = return_hash
          if tracked_urls
            return_message[:tracked_urls] = tracked_urls
          else
            return_message[:message] = 'No tracked urls present.'
          end
        end

      end
    end

end