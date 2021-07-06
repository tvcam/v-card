ActiveAdmin.register User do
  active_admin_import

  permit_params(
    :khmer_name,
    :english_name,
    :position,
    :address,
    :primary_phone_number,
    :secondary_phone_number,
    :email,
    :gender,
    :nickname,
    :s2_id
  )

  index do
    selectable_column
    id_column

    column :khmer_name
    column :english_name
    column :position
    column :address
    column :primary_phone_number
    column :secondary_phone_number
    column :email
    column :gender
    column :nickname
    column :s2_id
    column :qr_code do |user|
      "<img src='#{user.qr_path}' width=50 heigh=50>".html_safe
    end

    actions do |user|
      link_to('Download QR Code', download_qr_admin_user_path(user), target: :_blank)
    end
  end

  member_action :download_qr, method: :get do
    File.open("public#{resource.qr_path}", 'rb') do |f|
      send_data f.read, type: 'image/png', disposition: 'inline', filename: "#{resource.khmer_name}-qr-code.png"
    end
  end
end
