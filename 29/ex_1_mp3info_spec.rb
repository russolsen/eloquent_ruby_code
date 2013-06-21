describe 'Mp3Info' do

  it 'should work like the book says' do
    require 'mp3info'                       ##(main

    Mp3Info.open( 'BachGavotteShort.mp3' ) do |info|
      puts "title: #{info.tag.title}"
      puts "artist: #{info.tag.artist}"
      puts "album: #{info.tag.album}"
    end                                     ##main)
  end
end
