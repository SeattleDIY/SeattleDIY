def rspec_options(extra_options = nil)
  {
    :all_on_start => false,
    :all_after_pass => false,
    :cmd => "zeus rspec --color --profile #{extra_options}".strip,
  }
end

all_directories = Dir.glob("spec/*").
  find_all { |d| File.directory?(d) }.
  map { |d| File.basename(d) }

# Slow acceptance (database-hitting) test directories.
acceptance_directories = %w[acceptance features scopes]

# Fast unit test directories.
unit_directories = all_directories - acceptance_directories

group 'unit' do
  guard :rspec, rspec_options("--tag ~@acceptance --tag ~@slow --tag ~@type:feature") do
    watch(%r{^lib/(.+)\.rb$})     { |m| "spec/lib/#{m[1]}_spec.rb" }

    unit_directories.each do |dir|
      watch(%r{^spec/#{dir}/.+_spec\.rb$})
    end

    watch('spec/spec_helper.rb')  { "spec" }

    watch(%r{^app/(.+)\.rb$})                           { |m| "spec/#{m[1]}_spec.rb" }
    watch(%r{^app/(.*)(\.erb|\.haml|\.slim)$})          { |m| "spec/#{m[1]}#{m[2]}_spec.rb" }
    watch(%r{^app/controllers/(.+)_(controller)\.rb$})  { |m| ["spec/routing/#{m[1]}_routing_spec.rb", "spec/#{m[2]}s/#{m[1]}_#{m[2]}_spec.rb"] }

    watch(%r{^spec/support/(.+)\.rb$})                  { "spec" }
    watch('config/routes.rb')                           { "spec/routing" }
    watch('app/controllers/application_controller.rb')  { "spec/controllers" }

    # Capybara features specs
    watch(%r{^app/views/(.+)/.*\.(erb|haml|slim)$})     { |m| "spec/features/#{m[1]}_spec.rb" }
  end
end

group 'acceptance' do
  guard :rspec, rspec_options("--tag @acceptance --tag @slow --tag @type:feature") do
    acceptance_directories.each do |dir|
      watch(%r{^spec/#{dir}/.+_spec\.rb$})
    end
  end
end
