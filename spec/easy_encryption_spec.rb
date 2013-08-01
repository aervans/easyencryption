# encoding: utf-8
require 'spec_helper'

describe EasyEncryption do
  
  before(:all) do 
    EasyEncryption.setup 'default_password'
  end

  let(:default_password) { EasyEncryption.cipher_key }

  describe '.create_cipher' do
    after { remove_instance_variable :@cipher }

    it 'should create a cipher in the context of the caller' do 
      instance_exec default_password, &EasyEncryption::CREATE_CIPHER
      @cipher.should be_an_instance_of(Gibberish::AES)
    end
  end

  describe '.cipher_key=' do

    it 'should set the cipher key' do 
      expect(EasyEncryption.cipher_key=('password')).to eql('password')
    end
  end
end
