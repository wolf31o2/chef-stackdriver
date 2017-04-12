#
# Cookbook Name:: stackdriver
# Attributes:: default
#
#

default['stackdriver']['api']['key'] = ''
default['stackdriver']['collectd']['config'] = 'yes'
default['stackdriver']['detect_gcm'] = 'yes'
default['stackdriver']['proxy_url'] = ''

# supported plugins: ['elasticsearch', 'nginx', 'mongodb', 'rabbitmq', 'tomcat']
default['stackdriver']['plugins']['active'] = []

default['stackdriver']['plugins']['elasticsearch']['requires'] = ['yajl']

default['stackdriver']['plugins']['mongodb']['allow_secondary_query'] = false
default['stackdriver']['plugins']['mongodb']['port'] = '27017'
default['stackdriver']['plugins']['mongodb']['requires'] = []

default['stackdriver']['plugins']['nginx']['requires'] = []
# add config file to /etc/nginx/conf.d to create endpoint for nginx status plugin
default['stackdriver']['plugins']['nginx']['add_nginx_status_endpoint'] = false
default['stackdriver']['plugins']['nginx']['status_endpoint_path'] = '/nginx_status'

default['stackdriver']['plugins']['rabbitmq']['auth']['user'] = 'guest'
default['stackdriver']['plugins']['rabbitmq']['auth']['pass'] = 'guest'
default['stackdriver']['plugins']['rabbitmq']['port'] = '15672'
default['stackdriver']['plugins']['rabbitmq']['requires'] = ['yajl']
default['stackdriver']['plugins']['rabbitmq']['vhosts'] = [
  {
    'name' => '%2F',
    'queues' => [
      'queue_name'
    ]
  }
]

default['stackdriver']['plugins']['tomcat']['requires'] = []
default['stackdriver']['plugins']['tomcat']['jmx']['port'] = '1099'
default['stackdriver']['plugins']['tomcat']['jmx']['host'] = 'localhost'
default['stackdriver']['plugins']['tomcat']['jmxtrans_jar_url'] = 'https://s3.amazonaws.com/stackrpms/jmxtrans/jmxtrans-all.jar'

default['stackdriver']['apt_repo_url'] = 'http://repo.stackdriver.com/apt'
default['stackdriver']['yum_repo_url'] = 'http://repo.stackdriver.com/repo/el6/$basearch/'
default['stackdriver']['apt_gpgkey_url'] = 'https://app.stackdriver.com/RPM-GPG-KEY-stackdriver'
default['stackdriver']['yum_gpgkey_url'] = 'https://app.stackdriver.com/RPM-GPG-KEY-stackdriver'
