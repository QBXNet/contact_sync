module StringPhone
  def extract_country_code
    string = self
    if string[0..1] == "00"
      string[0..1] = "+"
    end
    if string[0] == "+"
      breakdown = GlobalPhone.parse(string)
      prefix = breakdown.country_code
      num = breakdown.national_string
      return [prefix,num]
    elsif string[0] == "0"
      num = string[1..-1]
      prefix = "0"
      return [prefix, num]
    else
      return ["", string]
    end
  end
end
String.send(:include, StringPhone)
