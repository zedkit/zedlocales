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

class TestSimpleBackend < Test::Unit::TestCase
  def test_get_english_locale
    en = Zedlocales::Simple.get(:en)
  end

  def test_get_french_locale
    fr = Zedlocales::Simple.get(:fr)
    assert_not_nil fr
    assert_equal ["dim", "lun", "mar", "mer", "jeu", "ven", "sam"], fr['fr']['date']['abbr_day_names']
  end

  def test_get_spanish_locale
    es = Zedlocales::Simple.get(:es)
    assert_not_nil es
    assert_equal ["Dom", "Lun", "Mar", "Mie", "Jue", "Vie", "Sab"], es['es']['date']['abbr_day_names']
  end
end
