require 'spec_helper'

describe Picture do
  it "accepts valid params" do
    Picture.new(
      :title => 'valid title',
      :album_id => 1,
      :description => "valid description",
      :filename => 'filename',
      #:location => 'here',
      :content_type => 'type'
    ).should be_valid
  end

  it "requires a title" do
    Picture.new(
      :description => "valid description",
      :filename => 'filename',
      #:location => 'here',
      :content_type => 'type'
    ).should_not be_valid
  end

  it 'requires a description' do
    Picture.new(
      :title => 'valid title',
      :filename => 'filename',
      #:location => 'here',
      :content_type => 'type'
    ).should_not be_valid
  end

  it 'requires a filename' do
    Picture.new(
      :title => 'valid title',
      :description => 'valid desc',
      #:location => 'here',
      :content_type => 'type'
    ).should_not be_valid
  end

  it 'requires a content_type' do
    Picture.new(
      :title => 'valid title',
      :description => 'valid desc',
      :filename => 'filename'
    ).should_not be_valid
  end

  describe "#generate_ordering" do
    xit "tests" do # TODO: fix this
      album = Album.new(:name => 'test', :ordering => 0)
      album.save!
      picture = Picture.new(:filename => 'test', :album_id => album.id, :title => 'test', :description => 'test', :content_type => 'test', :ordering => 1)
      picture.save!

      picture2 = Picture.new(:filename => 'test2', :album_id => album.id, :title => 'test2', :description => 'test2', :content_type => 'test2', :ordering => 2)
      picture2.save!

      Picture.generate_ordering(album).should == 3
    end
  end
end
