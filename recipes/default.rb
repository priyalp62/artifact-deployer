include_recipe "maven::default"

m2_home         = node['maven']['m2_home']
master_password = node['maven']['master_password']

template  "#{m2_home}/conf/settings.xml" do
  source  "settings.xml.erb"
  mode    0666
  owner   "root"
  group   "root"
  variables(
    :repos => MavenReposCookbook.repos
  )
end

unless master_password.nil? and master_password.empty?
  directory  "/root/.m2" do
    mode    0666
    owner   "root"
    group   "root"
  end

  template  "/root/.m2/settings-security.xml" do
    source  "settings-security.xml.erb"
    mode    0666
    owner   "root"
    group   "root"
  end
end

link "/usr/bin/mvn" do
  to "/usr/local/maven/bin/mvn"
end

include_recipe "artifact-deployer::artifacts"
include_recipe "artifact-deployer::route53"
include_recipe "artifact-deployer::jvm_host"