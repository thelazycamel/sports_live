notification :growl_notify

guard :rspec, :version => 2, :bundler => false, :all_after_pass => false, :all_on_start => false, :keep_failed => false do
  watch(%r{^lib/sports_live/(.+)\.rb"}) { "spec/sports_live/#{m[1]}_spec.rb"}
end
