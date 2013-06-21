require 'doc_with_load_save'

class SomeApplication                     ##(main
  # ...

  def do_something
    doc = Document.load( 'resume.txt' )

    # Do something interesting with the document.

    doc.save
  end
end                                      ##main)


describe SomeApplication do
  it 'should just work' do
    SomeApplication.new.do_something
  end
end
