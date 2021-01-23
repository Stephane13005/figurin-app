ActiveAdmin.register Figurine do

index do
    selectable_column
    column :id
    column :user
    column :name
    column :year
    column :brand
    column :description
    column :like
    column :media_title
    column :media_universe
    column :price_cents
    actions
  end

 form do |f|
    f.inputs "Figurine" do
      f.input :name
      f.input :year
      f.input :brand
      f.input :description
      f.input :media_title
      f.input :media_universe
      f.input :price_cents
    end
    f.actions
  end
  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  permit_params :name, :year, :brand, :description, :media_title, :media_year, :media_universe, :price_cents
  #
  # or
  #
  # permit_params do
  #   permitted = [:name, :year, :brand, :description, :like, :user_id, :media_title, :media_year, :media_universe, :likes_count, :price_cents]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end

end
