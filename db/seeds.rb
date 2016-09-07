# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
Tag.create!( [
              { name: 'javascript' }, 
              { name: 'swift' },
              { name: 'ios' },
              { name: 'android' },
              { name: 'ruby-on-rails' },
              { name: 'php' },
              { name: 'c++' },
              { name: 'java' },
              { name: 'ruby' },
              { name: 'objective-c' },
              { name: 'xcode' },
              { name: 'python' },
              { name: 'c#' },
              { name: 'html' },
              { name: 'jquery' },
              { name: 'linux' },
              { name: 'css' },
              { name: 'html5' },
              { name: 'iphone' },
              { name: 'git' },
              { name: 'aws' }
            ] )