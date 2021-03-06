here = File.expand_path File.dirname(__FILE__)
require "#{here}/spec_helper"

require "step_page"

describe StepPage do

  it "renders a step file" do
    src = "step 'hello'"
    page = StepPage.new(src: src,
      case_name: "greetings",
      doc_title: "Hello",
      doc_path: "/tmp/hello.step"
    )
    html_doc = Nokogiri.parse(page.to_html)
    main_html = html_doc.css(".main").first.serialize(:save_with => 0).chomp
    assert { main_html ==
      "<div class=\"main\">" +
        "<h1 class=\"doc_title\">Hello</h1>" +
        "<div class=\"doc\">" +
          "<div class=\"step\">" +
            "<h1><span class=\"prefix\">Step 1: </span>hello</h1>" +
          "</div>" +
        "</div>" +
      "</div>"
    }
  end

end

