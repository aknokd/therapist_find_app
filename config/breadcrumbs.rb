crumb :root do
  link "TOP", root_path
end

crumb :products do |product|
  link "セラピスト詳細", product_path(product)
  parent :root
end

crumb :reservations do |reservation|
  link "セラピスト予約", product_reservations_path(reservation)
  parent :products, reservation
end
