ActiveAdmin.register TrackedUrl do

# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
# permit_params :list, :of, :attributes, :on, :model
  permit_params :id, :name, :destination_url_id
#
# or
#
# permit_params do
#   permitted = [:permitted, :attributes]
#   permitted << :other if params[:action] == 'create' && current_user.admin?
#   permitted
# end

  before_save do |url|
    url.create_via_admin = true
  end


  controller do
    def scoped_collection
      super.includes([:destination_url, :visitors]) # prevents N+1 queries to your database
    end
  end

  index do
    id_column
    column :destination_url, sortable: 'destination_urls.name'
    column :name
    column :status
    column "Visits", sortable: :visitors_count do |t|
      t.visitors.count
    end
    actions
  end

end
