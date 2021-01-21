require "pry"

parser = CssParser::Parser.new
parser.load_uri!('./index.css')

RSpec.describe 'styling' do

  context 'within index.html' do
@@ -17,4 +20,34 @@

  end

  context 'within index.css' do

    it 'contains a .grid-container rule set' do
      expect(parser.to_s.include? "grid-container").to be true
    end

    it 'the .grid-container rule contains the display property, set to grid' do
      expect(parser.to_s.include? "display: grid").to be true
      expect(parser.to_s.include? "grid-template").to be true
    end

    it 'contains a .bigItem rule set' do
      expect(parser.to_s.include? "bigItem").to be true
    end

    it 'the .bigItem rule contains the grid-area property' do
      expect(parser.to_s.include? "grid-area").to be true
    end

  end

  context 'within index.html' do

    it 'contains at least one div assigned the "bigItem" class' do
      div = parsed_html.search('div')
      expect(div.any? {|d| d.attributes["class"].to_s.include? "bigItem"}).to be true
    end

  end

end