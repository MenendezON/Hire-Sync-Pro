require 'pdf-reader'

class ResumeParserService
  def parse_resume(file_path)
    begin
      reader = PDF::Reader.new(file_path)
      text_content = extract_text_content(reader)
      parsed_data = parse_information(text_content)
      return parsed_data
    rescue PDF::Reader::MalformedPDFError => e
      # Handle the case where the PDF is malformed or incomplete
      Rails.logger.error("Malformed PDF Error: #{e.message}")
      return {}
    end
  end

  private

  def extract_text_content(reader)
    text_content = ""
    reader.pages.each do |page|
      text_content << page.text
    end
    text_content
  end

  # def extract_first_name(text_content)
  #   # Split the text into words
  #   words = text_content.split(/\s+/)

  #   # The first non-empty word is considered as the first name
  #   first_name = words.find { |word| !word.strip.empty? }

  #   # Clean up the first name (remove non-alphabetic characters)
  #   first_name&.gsub(/[^a-zA-Z]/, '')
  # end

  def parse_information(text_content)
    parsed_data = {}
  
    # Extracting phone number (assuming it's in the format XXX-XXX-XXXX)
    phone_match = text_content.match(/\b(\d{3}-\d{3}-\d{4})\b/)
    parsed_data[:phone] = phone_match[1] if phone_match
  
    # Extracting email address
    email_match = text_content.match(/\b[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Z|a-z]{2,}\b/)
    parsed_data[:email] = email_match[0] if email_match
  
    # Extracting address (assuming it's on a line starting with 'Address:')
    address_line = text_content.lines.find { |line| line =~ /\bAddress:\s*(.*)/ }
    parsed_data[:address] = Regexp.last_match(1).strip if address_line
  
    # Add more parsing logic for other fields based on your needs
  
    parsed_data
  end
  
end
