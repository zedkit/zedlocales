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

module Zedlocales
  class Content
    class << self
      #
      # = Zedlocales Content
      #
      # All Zedkit applications have optional content that can be maintained with the Zedkit management interface. You can
      # create, read, update, or delete content within content scopes. To perform an operation on a specific content scope
      # you need its UUID, as available from the Zedlocales::ContentScopes::Content.get method.
      #
      # To get a Content item:
      #
      #   Zedlocales::Content.get(:user_key => user['user_key'], :uuid => content['uuid'])
      #
      # To update a Content item:
      # 
      #   Zedlocales::Content.update(:user_key => user['user_key'],
      #                                    :uuid => content['uuid'], :content => { :content => 'whatever' })
      #
      # To delete a Content item:
      #
      #   Zedlocales::Content.delete(:user_key => user['user_key'], :uuid => scope['uuid'])
      #
      # To create a new Content item you submit the required parameters with the scope UUID that you are creating the content
      # for. Whatever items you send within the :content Hash are passed through to the ZedAPI untouched. There is no client
      # side validation within this gem.
      #
      #   Zedlocales::Content.create(:user_key => user['user_key'], :scope => { :uuid => scope['uuid'] },
      #                              :content => { :key => 'whatever', :content => 'yo this the api' })
      #
      # From each of these requests the Zedkit::Client class will return a response hash for your reference, if needed,
      # or as applicable to the request. If there was a HTTP 401 or 404 you will get a nil response. This indicates a
      # security failure or that an UUID is incorrect, not attached the user's account, or non-existent.
      #
      # For each request you can also pass a block to process the response directly:
      #
      #   Zedlocales::Content.get(:user_key => user['user_key'], :uuid => content['uuid']) do |result|
      #   end
      #

      def get(zks = {}, &block)
        Zedkit::Client.crud(:get, "content/content/#{zks[:uuid]}", zks, [], &block)
      end

      def create(zks = {}, &block)
        Zedkit::Client.crud(:create, 'content/content', zks, [], &block)
      end

      def update(zks = {}, &block)
        Zedkit::Client.crud(:update, "content/content/#{zks[:uuid]}", zks, [], &block)
      end

      def delete(zks = {}, &block)
        Zedkit::Client.crud(:delete, "content/content/#{zks[:uuid]}", zks, [], &block)
      end
    end

    class Translations
      class << self
        def get(zks = {}, &block)
          Zedkit::Client.crud(:get, "content/translations", zks, [], &block)
        end
      end
    end
  end
end
