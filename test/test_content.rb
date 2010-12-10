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

class TestContent < Test::Unit::TestCase  
  def test_get_translations
    cs = Zedlocales::ContentScopes::Content.get(:user_key => @uu['user_key'], :scope => { :uuid => con_scopes[0]['uuid'] })
    tt = Zedlocales::Content::Translations.get(:user_key => @uu['user_key'], :content => { :uuid => cs[0]['uuid'] })
    assert_equal 2, tt.length
  end

  def test_get_content
    cs = Zedlocales::ContentScopes::Content.get(:user_key => @uu['user_key'], :scope => { :uuid => con_scopes[0]['uuid'] })
    cc = Zedlocales::Content.get(:user_key => @uu['user_key'], :uuid => cs[0]['uuid'])
    assert_equal 'whatever', cc['key']
    assert_equal cs[0]['uuid'], cc['uuid']
  end

  def test_create_content
    cc = Zedlocales::Content.create(:user_key => @uu['user_key'], :scope => { :uuid => con_scopes[0]['uuid'] },
                                                                  :content => { :key => 'yo', :content => 'yo yo' })
    assert_equal 32, cc['uuid'].length
    assert_equal 'yo', cc['key']
    assert_equal 'yo yo', cc['content']
  end
  
  def test_update_content
    cs = Zedlocales::ContentScopes::Content.get(:user_key => @uu['user_key'], :scope => { :uuid => con_scopes[0]['uuid'] })
    cc = Zedlocales::Content.update(:user_key => @uu['user_key'], :uuid => cs[0]['uuid'], :content => { :content => 'yo' })
    assert_equal cs[0]['uuid'], cc['uuid']
    assert_equal 'whatever', cc['key']
    assert_equal 'yo', cc['content']
  end

  def test_destroy_content
    cs = Zedlocales::ContentScopes::Content.get(:user_key => @uu['user_key'], :scope => { :uuid => con_scopes[0]['uuid'] })
    cc = Zedlocales::Content.delete(:user_key => @uu['user_key'], :uuid => cs[0]['uuid'])
    assert_equal cc, {}
  end
end
