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
  class ContentSections
    class ContentScopes
      class << self
        def get(*args)
          zopts = args.extract_zedkit_options!
          reshh = Zedkit::Client.get('content/scopes', zopts[:user_key], zopts.zdelete_keys!(%w(user_key)))
          yield(reshh) if (not reshh.nil?) && block_given?
          reshh
        end
      end
    end

    class << self
      #
      # = Zedlocales Content Sections
      #
      # All Zedkit applications have optional content. You can create, read, update, or delete content sections to organize
      # it. To perform an operation on a specific content section you need its UUID, as available from the
      # Zedkit::Projects::ContentSections.get method.
      #
      # To get a Content Section:
      #
      #   Zedlocales::ContentSections.get(:user_key => user['user_key'], :uuid => section['uuid'])
      #
      # To update a Content Section:
      # 
      #   Zedlocales::ContentSections.update(:user_key => user['user_key'],
      #                                      :uuid => section['uuid'], :section => { :key => 'whatever' })
      #
      # To delete a Content Section:
      #
      #   Zedlocales::ContentSections.delete(:user_key => user['user_key'], :uuid => section['uuid'])
      #
      # To create a new Content Section you submit the required parameters with the project UUID that you are creating the 
      # content section for. Whatever items you send within the :section Hash are passed through to the ZedAPI untouched.
      # There is no client side validation within this gem.
      #
      #   Zedlocales::ContentSections.create(:user_key => user['user_key'],
      #                                      :project => { :uuid => project['uuid'] }, :section => { :key => 'whatever' })
      #
      # From each of these requests the Zedkit::Client class will return a response hash for your reference, if needed,
      # or as applicable to the request. If there was a HTTP 401 or 404 you will get a nil response. This indicates a
      # security failure or that an UUID is incorrect, not attached the user's account, or non-existent.
      #
      # For each request you can also pass a block to process the response directly:
      #
      #   Zedlocales::ContentSections.get(:user_key => user['user_key'], :uuid => section['uuid']) do |result|
      #   end
      #

      def get(*args)
        zopts = args.extract_zedkit_options!
        reshh = Zedkit::Client.get("content/sections/#{zopts[:uuid]}", zopts[:user_key],
                                                 zopts.zdelete_keys!(%w(uuid user_key)))
        yield(reshh) if (not reshh.nil?) && block_given?
        reshh
      end

      def create(*args)
        zopts = args.extract_zedkit_options!
        reshh = Zedkit::Client.create('content/sections', zopts[:user_key], zopts.zdelete_keys!(%w(user_key)))
        yield(reshh) if (not reshh.nil?) && block_given?
        reshh
      end

      def update(*args)
        zopts = args.extract_zedkit_options!
        reshh = Zedkit::Client.update("content/sections/#{zopts[:uuid]}", zopts[:user_key],
                                                    zopts.zdelete_keys!(%w(uuid user_key)))
        yield(reshh) if (not reshh.nil?) && block_given?
        reshh
      end

      def delete(*args)
        zopts = args.extract_zedkit_options!
        reshh = Zedkit::Client.delete("content/sections/#{zopts[:uuid]}", zopts[:user_key])
        yield(reshh) if (not reshh.nil?) && block_given?
        reshh
      end
    end
  end
end
