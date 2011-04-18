#++
# Derived from code from Spree
# Copyright (c) 2007-2010, Rails Dog LLC and other contributors
# All rights reserved.
#
# Redistribution and use in source and binary forms, with or without modification,
# are permitted provided that the following conditions are met:
#
#     * Redistributions of source code must retain the above copyright notice,
#       this list of conditions and the following disclaimer.
#     * Redistributions in binary form must reproduce the above copyright notice,
#       this list of conditions and the following disclaimer in the documentation
#       and/or other materials provided with the distribution.
#     * Neither the name of the Rails Dog LLC nor the names of its
#       contributors may be used to endorse or promote products derived from this
#       software without specific prior written permission.
#
# THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS
# "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT
# LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR
# A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT OWNER OR
# CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL,
# EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO,
# PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR
# PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF
# LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING
# NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS
# SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
#--

module K3cms::Core
module HookHelper

  # Allow hooks to be used in views like this:
  #
  #   <%= hook :some_hook %>
  #
  #   <%= hook :some_hook do %>
  #     <p>Some HTML</p>
  #   <% end %>
  #
  def hook(hook_name, locals = {}, &block)
    content = block_given? ? capture(&block) : ''
    K3cms::ThemeSupport::Hook.render_hook(hook_name, content, self, locals)
  end

  def locals_hash(names, binding)
    names.inject({}) {|memo, key| memo[key.to_sym] = eval(key, binding); memo}
  end

  def replace(hook_name, options = {}, &block)
    K3cms::ThemeSupport::HookListener.send(:add_hook_modifier, hook_name, :replace, options.merge(:text => capture(&block)) )
  end

  def insert_before(hook_name, options = {}, &block)
    K3cms::ThemeSupport::HookListener.send(:add_hook_modifier, hook_name, :insert_before, options.merge(:text => capture(&block)) )
  end

  def insert_after(hook_name, options = {}, &block)
    K3cms::ThemeSupport::HookListener.send(:add_hook_modifier, hook_name, :insert_after, options.merge(:text => capture(&block)) )
  end
end
end
