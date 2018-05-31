const marked = require 'marked'

export tag Markdown
  prop html
  def mount
    this.dom:innerHTML = marked html