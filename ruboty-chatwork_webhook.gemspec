
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "ruboty/chatwork_webhook/version"

Gem::Specification.new do |spec|
  spec.name          = "ruboty-chatwork_webhook"
  spec.version       = Ruboty::ChatworkWebhook::VERSION
  spec.authors       = ["honeniq"]
  spec.email         = ["honeniq@gmail.com"]

  spec.summary       = "An ruboty adapter for Chatwork webhook."
  spec.description   = "An ruboty adapter for Chatwork webhook."
  spec.homepage      = "https://github.com/honeniq/ruboty-chatwork_webhook"
  spec.license       = "MIT"

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files         = Dir.chdir(File.expand_path('..', __FILE__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.16"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
  spec.add_dependency "ruboty"
  spec.add_dependency "webrick"
  spec.add_dependency "chatwork"
end
