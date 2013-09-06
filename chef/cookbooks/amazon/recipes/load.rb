windows_batch "Clone platform repo" do
  code <<-EOH
  Z:
  set PATH=%PATH%;C:\\Program Files (x86)\\Git\\bin
  git clone -b #{node['git']['jenkins']['branch']} #{node['git']['platform']['repo']}
  EOH
end

amazon_simpledb_load "Load initial configuration" do
  domain node['amazon']['simpledb']['domain']
  json_file node['amazon']['setup']['path']
  aws_access_key node['amazon']['access']['key']
  aws_secret_access_key node['amazon']['secret']['key']
  region node['amazon']['region']
end
