require 'spec_helper'

describe Picture do
  it "accepts valid params" do
    Picture.new(:title => 'valid title',
                       :description => "valid description",
                       :filename => 'filename',
                       :location => 'here',
                       :content_type => 'type').should be_valid
  end

  it "requires a title" do
    Picture.new(:description => "valid description",
                :filename => 'filename',
                :location => 'here',
                :content_type => 'type').should_not be_valid
  end

  it 'requires a description' do
    Picture.new(:title => 'valid title',
                :filename => 'filename',
                :location => 'here',
                :content_type => 'type').should_not be_valid
  end

  it 'requires a filename' do
    Picture.new(:title => 'valid title',
                :description => 'valid desc',
                :location => 'here',
                :content_type => 'type').should_not be_valid
  end

  it 'requires a location' do
    Picture.new(:title => 'valid title',
                :description => 'valid desc',
                :filename => 'filename',
                :content_type => 'type').should_not be_valid
  end

  it 'requires a content_type' do
    Picture.new(:title => 'valid title',
                :description => 'valid desc',
                :filename => 'filename',
                :location => 'here').should_not be_valid
  end
end
