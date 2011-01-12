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
  class ContentScopes
    class << self
      #
      # = Zedlocales Content Scopes
      #
      # All Zedkit applications have optional content. You can create, read, update, or delete content scopes within sections
      # to organize it. To perform an operation on a specific content scope you need its UUID, as available from the
      # Zedlocales::ContentSections::ContentScopes.get method.
      #
      # To get a Content Scope:
      #
      #   Zedlocales::ContentScopes.get(:user_key => user['user_key'], :uuid => scope['uuid'])
      #
      # To update a Content Scope:
      # 
      #   Zedlocales::ContentScopes.update(:user_key => user['user_key'],
      #                                    :uuid => scope['uuid'], :scope => { :key => 'whatever' })
      #
      # To delete a Content Scope:
      #
      #   Zedlocales::ContentScopes.delete(:user_key => user['user_key'], :uuid => scope['uuid'])
      #
      # To create a new Content Scope you submit the required parameters with the section UUID that you are creating the 
      # content scope for. Whatever items you send within the :scope Hash are passed through to the ZedAPI untouched.
      # There is no client side validation within this gem.
      #
      #   Zedlocales::ContentScopes.create(:user_key => user['user_key'],
      #                                    :section => { :uuid => section['uuid'] }, :scope => { :key => 'whatever' })
      #
      # From each of these requests the Zedkit::Client class will return a response hash for your reference, if needed,
      # or as applicable to the request. If there was a HTTP 401 or 404 you will get a nil response. This indicates a
      # security failure or that an UUID is incorrect, not attached the user's account, or non-existent.
      #
      # For each request you can also pass a block to process the response directly:
      #
      #   Zedlocales::ContentScopes.get(:user_key => user['user_key'], :uuid => scope['uuid']) do |result|
      #   end
      #

      def get(zks = {}, &block)
        Zedkit::Client.crud(:get, "content/scopes/#{zks[:uuid]}", zks, [], &block)
      end

      def create(zks = {}, &block)
        Zedkit::Client.crud(:create, 'content/scopes', zks, [], &block)
      end

      def update(zks = {}, &block)
        Zedkit::Client.crud(:update, "content/scopes/#{zks[:uuid]}", zks, [], &block)
      end

      def delete(zks = {}, &block)
        Zedkit::Client.crud(:delete, "content/scopes/#{zks[:uuid]}", zks, [], &block)
      end
    end

    class Content
      class << self
        def get(zks = {}, &block)
          Zedkit::Client.crud(:get, "content/content", zks, [], &block)
        end
      end
    end
  end
end
