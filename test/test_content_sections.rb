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

class TestContentSections < Test::Unit::TestCase
  def test_get_content_section_scopes
    ss = Zedlocales::ContentSections::ContentScopes.get(:user_key => @uu['user_key'],
                                                        :section => { :uuid => con_sections[0]['uuid'] })
    assert_equal 32, ss[0]['uuid'].length
    assert_equal 'whatever', ss[0]['key']
  end

  def test_get_content_section
    ss = Zedlocales::ContentSections.get(:user_key => @uu['user_key'], :uuid => con_sections[0]['uuid'])
    assert_equal 'whatever', ss['key']
    assert_equal 32, ss['uuid'].length
  end

  def test_create_content_section
    ss = Zedlocales::ContentSections.create(:user_key => @uu['user_key'], :project => { :uuid => @uu['projects'][0] },
                                           :section => { :key => 'newsection' })
    assert_equal 32, ss['uuid'].length
    assert_equal 'newsection', ss['key']
  end

  def test_update_content_section
    ss = Zedlocales::ContentSections.update(:user_key => @uu['user_key'],
                                            :uuid => con_sections[0]['uuid'], :section => { :key => 'updatedsection' })
    assert_equal 'updatedsection', ss['key']
  end

  def test_delete_content_section
    assert_equal Zedlocales::ContentSections.delete(:user_key => @uu['user_key'], :uuid => con_sections[0]['uuid']), {}
  end
end
