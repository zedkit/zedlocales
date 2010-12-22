##
# Copyright (c) Zedkit.
#
# Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation
# files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy,
# modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the
# Software is furnished to do so, subject to the following conditions:
#
# The above copyright notice and this permission notice shall be included in all copies or substantial portions of the
# Software.
# 
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE
# WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR
# COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE,
# ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
##

require 'helper'

class TestProjects < Test::Unit::TestCase
  def test_get_content_sections
    pl = Zedkit::Projects::ContentSections.get(:user_key => @uu['user_key'], :project => { :uuid => @uu['projects'][0] })
    assert pl.is_a? Array
    assert_equal 1, pl.length
    assert_not_nil pl[0]['uuid']
  end

  def test_get_locale_connections
    pl = Zedkit::Projects::Locales.get(:user_key => @uu['user_key'], :project => { :uuid => @uu['projects'][0] })
    assert pl.is_a? Array
    assert_equal 2, pl.length
  end

  def test_create_locale_connection
    pl = Zedkit::Projects::Locales.create(:user_key => @uu['user_key'],
                                          :project => { :uuid => @uu['projects'][0] }, :locale => { :code => 'sk' })
    assert pl.is_a? Hash
    assert_equal @uu['projects'][0], pl['project']['uuid'] 
    assert_equal 'sk', pl['locale']['code']
    assert_equal 'DEVELOPMENT', pl['stage']
  end

  def test_update_locale_connection
    pl = Zedkit::Projects::Locales.update(:user_key => @uu['user_key'], :project => { :uuid => @uu['projects'][0] },
                                                                        :locale => { :code => 'fr', :stage => 'development' })
    assert pl.is_a? Hash
    assert_equal @uu['projects'][0], pl['project']['uuid']
    assert_equal 'fr', pl['locale']['code']
    assert_equal 'DEVELOPMENT', pl['stage']
  end

  def test_delete_locale_connection
    assert_nil Zedkit::Projects::Locales.delete(:user_key => @uu['user_key'], :project => { :uuid => @uu['projects'][0] },
                                                                              :locale => { :code => 'fr'})
  end
end
