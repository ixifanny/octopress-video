class Youku < Liquid::Tag
Syntax = /^\s*([^\s]+)(\s+(\d+)\s+(\d+)\s*)?/

def initialize(tagName, markup, tokens)
  super
  
  if markup =~ Syntax then
    @id = $1
    
    if $2.nil? then
      @width = 560
      @height = 420
    else
      @width = $2.to_i
      @height = $3.to_i
    end
  else
    raise "No Youku ID provided in the \"youku\" tag"
  end
end

def render(context)
# "<iframe height=498 width=510 src="http://player.youku.com/embed/XNTEzNzcwNDI0" frameborder=0 allowfullscreen></iframe>"
"<iframe height=\"#{@height}\" width=\"#{@width}\" src=\"http://player.youku.com/embed/#{@id}?color=white&theme=light\"></iframe>"
end

Liquid::Template.register_tag "youku", self
end
