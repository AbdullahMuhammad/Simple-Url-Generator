ActiveAdmin.register DestinationUrl do

# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
# permit_params :list, :of, :attributes, :on, :model
  permit_params :id, :name, tracked_urls_attributes: [:name, :id, :status, :destination_url_id]
#
# or
#
# permit_params do
#   permitted = [:permitted, :attributes]
#   permitted << :other if params[:action] == 'create' && current_user.admin?
#   permitted
# end


  index do
    id_column
    column :name
    #column "tracked_links" do |t|
    #  t.tracked_urls.count
    #end
    actions
  end

  show do

    attributes_table do
      row :name

      row 'Tracked Links' do |n|
        destination_url.tracked_urls.map(&:name).join("<br />").html_safe
      end
    end

  end


  form do |f|
    f.semantic_errors *f.object.errors.keys
    f.inputs 'Details' do
      f.input :name
    end

    f.inputs 'Tracked Urls' do
      f.has_many :tracked_urls, heading: '', allow_destroy: true, new_record: true do |a|
        a.input :name
        a.input :status
      end
    end

    f.actions
  end

end
