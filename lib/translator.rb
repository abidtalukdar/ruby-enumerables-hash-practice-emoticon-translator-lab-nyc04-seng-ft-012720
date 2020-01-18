require 'yaml'

def load_library(file)
  emoticons = YAML.load_file(file)
  emoticons_translator = {"get_emoticon" => {}, "get_meaning" => {}}
  emoticons.each do |key, value|
    emoticons_translator["get_emoticon"][emoticons[key][0]] = emoticons[key][1]
    emoticons_translator["get_meaning"][emoticons[key][1]] = key
  end  
  return emoticons
end

def get_japanese_emoticon(file, emoticon)
  emoticons_translator = load_library(file)
  emoticons_translator.each do |key, value|
    value.each do |eng_emoticon, jap_emoticon|
      if eng_emoticon == emoticon
        return jap_emoticon
      end
    end   
  end
  return "Sorry, that emoticon was not found"
end

def get_english_meaning(file, emoticon)
  emoticons_translator = load_library(file)["get_meaning"]
  emoticons_translator.each do |key, value|
    if key == emoticon
      return value
    end
  end
  return "Sorry, that emoticon was not found"
end

pp load_library('/home/whimsical-operand-0270/ruby-enumerables-hash-practice-emoticon-translator-lab-nyc04-seng-ft-012720/lib/emoticons.yml')

# emoticons_translator = {"get_emoticon"=>
#   {"O:)"=>"☜(⌒▽⌒)☞",
#   ">:("=>"ヽ(ｏ`皿′ｏ)ﾉ",
#   ":O"=>"(ΘεΘ;)",
#   "%)"=>"(゜.゜)",
#   ":$"=>"(#^.^#)",
#   "><>"=>">゜))))彡",
#   "8D"=>"(^0_0^)",
#   "=D"=>"(￣ー￣)",
#   ":)"=>"(＾ｖ＾)",
#   ":*"=>"(*^3^)/~☆",
#   ":'("=>"(Ｔ▽Ｔ)",
#   ":o"=>"o_O",
#   ";)"=>"(^_-)"},
# "get_meaning"=>
#   {"☜(⌒▽⌒)☞"=>"angel",
#   "ヽ(ｏ`皿′ｏ)ﾉ"=>"angry",
#   "(ΘεΘ;)"=>"bored",
#   "(゜.゜)"=>"confused",
#   "(#^.^#)"=>"embarrased",
#   ">゜))))彡"=>"fish",
#   "(^0_0^)"=>"glasses",
#   "(￣ー￣)"=>"grinning",
#   "(＾ｖ＾)"=>"happy",
#   "(*^3^)/~☆"=>"kiss",
#   "(Ｔ▽Ｔ)"=>"sad",
#   "o_O"=>"surprised",
#   "(^_-)"=>"wink"}}