# encoding: utf-8
require 'spec_helper'

describe String do

  before(:all) do 
    EasyEncryption.setup 'test'
  end

  let(:text) { 'foo' }
  let(:encrypted_text) {
    simple_box = RbNaCl::SimpleBox.from_secret_key(RbNaCl::Hash.sha256('test'))
    simple_box.encrypt text
  }

  describe '#encrypt' do

    context 'with a string instance' do

      it 'encrypts a string instance' do
        text.encrypt.encoding.should eql(Encoding::BINARY)
      end
    end
  end

  describe '#decrypt' do

    context 'with a string instance' do

      it 'decrypts a string instance' do
        encrypted_text.decrypt.should eql(text)
      end
    end
  end
end
