require 'nokogiri'
require 'json'

# Load the HTML file
html_file_path = 'template.html'
doc = Nokogiri::HTML(File.open(html_file_path))

# Read JSON data from a file
json_file_path = 'cucumber.json'
json_data = JSON.parse(File.read(json_file_path))

# Create a <script> element with the JSON constant assignment
script_content = "const jsonData = #{JSON.generate(json_data)};"
script_element = Nokogiri::XML::Node.new('script', doc)
script_element['type'] = 'text/javascript'
script_element.content = script_content

# Add the <script> element to the <head> or <body> of the document
head_element = doc.at_css('head')
head_element.add_child(script_element)

# Save the modified HTML to a new file
modified_html_file_path = 'report.html'
File.open(modified_html_file_path, 'w') do |file|
  file.write(doc.to_html)
end
