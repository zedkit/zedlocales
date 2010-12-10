##
# Copyright (c) Zedkit.
#
# Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation
# files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy,
# modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software
# is furnished to do so, subject to the following conditions:
#
# The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.
# 
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES
# OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE
# LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR
# IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
##

require 'test/unit'
require 'rubygems'
require 'zedlocales'

$LOAD_PATH.unshift(File.join(File.dirname(__FILE__), '..', 'lib'))
$LOAD_PATH.unshift(File.dirname(__FILE__))

class Test::Unit::TestCase
  TEST_GEMS_PROJECT_KEY = 'BE1OZog8gJogtQTosh'
  TEST_GEMS_LOCALES_KEY = '6yca7DsnBvaDVupKEZ'
  TEST_GEMS_LOGIN = 'gems@zedkit.com'
  TEST_GEMS_PASSWORD = 'NGIaDhr5vDlXo1tDs6bW3Gd'

  def setup
    Zedkit.configure do |zb|
      zb.project_key = TEST_GEMS_PROJECT_KEY
      zb.locales_key = TEST_GEMS_LOCALES_KEY
      # zb.api_host = '0.0.0.0'
      # zb.api_port = 5010
    end
    @uu = Zedkit::Users.verify(:username => TEST_GEMS_LOGIN, :password => TEST_GEMS_PASSWORD)
  end

  protected
  def con_sections
    Zedkit::Projects::ContentSections.get(:user_key => @uu['user_key'], :project => { :uuid => @uu['projects'][0] })
  end
  def con_scopes
    Zedlocales::ContentSections::ContentScopes::get(:user_key => @uu['user_key'], :section => { :uuid => con_sections[0]['uuid'] })
  end
end
