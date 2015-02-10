class String

  def to_slug
    #strip and downcase the string
    ret = self.strip.downcase

    #blow away apostrophes
    ret.gsub! /['`]/,""

    # @ --> at, and & --> and
    ret.gsub! /\s*@\s*/, " at "
    ret.gsub! /\s*&\s*/, " and "

    #replace all non alphanumeric, underscore or periods with hifen
    ret.gsub! /\s*[^A-Za-z0-9\.\-]\s*/, '-'

    #convert double underscores to single
    ret.gsub! /_+/,"_"

    #convert double hifen to single
    ret.gsub! /-+/,"-"

    #strip off leading/trailing underscore
    ret.gsub! /\A[_\.]+|[_\.]+\z/,""

    #strip off leading/trailing hifen
    ret.gsub! /\A[-\.]+|[-\.]+\z/,""

    ret
  end

end
