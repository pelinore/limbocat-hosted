mb_block_size = 100
count = (node[:wordpress][:gb_swap_size] * 1024) / mb_block_size
bash "add_swap" do
  user "root"
  code < "#{node[:wordpress][:swap_file]}"
  )
end
