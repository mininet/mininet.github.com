require 'bundler/setup'
require 'sinatra/base'
require 'rack-rewrite'

# The project root directory
$root = ::File.dirname(__FILE__)

class SinatraStaticServer < Sinatra::Base  

  get(/.+/) do
    send_sinatra_file(request.path) {404}
  end

  use Rack::Rewrite do
     r301 %r{^/code}, 'https://github.com/mininet/mininet'
     r301 %r{^/docs}, 'https://github.com/mininet/mininet/wiki/Documentation'
     r301 %r{^/faq}, 'https://github.com/mininet/mininet/wiki/FAQ'
     r301 %r{^/gsoc}, 'https://github.com/mininet/mininet/wiki/GSoC-2013'
     r301 %r{^/papers}, 'https://github.com/mininet/mininet/wiki/Publications'
     r301 %r{^/wiki}, 'https://github.com/mininet/mininet/wiki'
  end

  not_found do
    send_sinatra_file('404.html') {"Sorry, I cannot find #{request.path}"}
  end

  def send_sinatra_file(path, &missing_file_block)
    file_path = File.join(File.dirname(__FILE__), 'public',  path)
    file_path = File.join(file_path, 'index.html') unless file_path =~ /\.[a-z]+$/i  
    File.exist?(file_path) ? send_file(file_path) : missing_file_block.call
  end

end

run SinatraStaticServer