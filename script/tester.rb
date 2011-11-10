require 'sass'
require 'compass'
require 'benchmark'

# require 'unprof'
require 'ruby-prof'

# $DEBUG=true

module SassTester
  def self.render
    sass = open('/Users/tom/Development/Percolate/sass_rails_slowness/app/assets/stylesheets/screen.css.scss').read
    engine= Sass::Engine.new(sass,
    {:preferred_syntax=>:scss, 
      :syntax => :scss,
      :style=>:expanded, 
      :cache=>true, 
      :read_cache=>true, 
      :line_comments=>true, 
      :load_paths=>['/Users/tom/Development/Percolate/sass_rails_slowness/app/assets/stylesheets', 
        '/Users/tom/.rbenv/versions/1.9.2-p290/lib/ruby/gems/1.9.1/gems/compass-0.12.alpha.0/frameworks/blueprint/stylesheets', 
        '/Users/tom/.rbenv/versions/1.9.2-p290/lib/ruby/gems/1.9.1/gems/compass-0.12.alpha.0/frameworks/compass/stylesheets'],
      :cache_location=>"/Users/tom/Development/Percolate/sass_rails_slowness/tmp/sass-cache", 
      :full_exception=>true, 
      :filename=>"/Users/tom/Development/Percolate/sass_rails_slowness/app/assets/stylesheets/screen.css.scss", 
      :line=>1
    }
    )
    
    out = ''
    # RubyProf.start
    # out << engine.render
    puts Benchmark.measure { out << engine.render }
    # printer = RubyProf::GraphHtmlPrinter.new(RubyProf.stop)
    # printer.print(open('profile.html', 'w'), {:min_percent => 10})
    
    
    out
  end
end

# SassTester.render