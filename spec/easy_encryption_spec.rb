# encoding: utf-8
require 'spec_helper'

describe EasyEncryption do

  let(:key) { 'test' }

  describe '.create_cipher' do

    it 'should create a simple box on String' do 
      EasyEncryption.setup key
      String.simple_box.should be_an_instance_of(RbNaCl::SimpleBox)
    end
  end
end
