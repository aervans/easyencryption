# encoding: utf-8
require 'spec_helper'

describe String do

  before(:all) do 
    EasyEncryption.setup 'default_password'
  end

  let(:default_password) { EasyEncryption.cipher_key }
  let(:password) { 'password' }
  let(:text) { 'foo' }
  let(:console_text) { `echo "foo"` }

  describe '#encrypt' do

    context 'with cipher key set on String' do

      it 'encrypts a string' do
        encrypted = text.encrypt 
        decrypted = `echo "#{encrypted}" | openssl enc -d -aes-256-cbc -a -k "#{default_password}"`
        decrypted.should eql(text)
      end
    end

    context 'with cipher key set on a String instance' do

      it 'encrypts a string' do
        text.cipher_key = password
        encrypted = text.encrypt
        decrypted = `echo "#{encrypted}" | openssl enc -d -aes-256-cbc -a -k "#{password}"`
        decrypted.should eql(text)
      end
    end
    
    context 'with cipher key passed to a String instance' do

      it 'encrypts a string' do
        encrypted = text.encrypt password
        decrypted = `echo "#{encrypted}" | openssl enc -d -aes-256-cbc -a -k "#{password}"`
        decrypted.should eql(text)
      end
    end
  end

  describe '#decrypt' do

    context 'with cipher key set on String' do

      it 'decrypts a string' do 
        encrypted = `echo "foo" | openssl enc -aes-256-cbc -a -k "#{default_password}"`
        decrypted = encrypted.decrypt.chomp
        decrypted.should eql('foo')
      end
    end

    context 'with cipher key set on a String instance' do

      it 'decrypts a string' do
        encrypted = `echo "foo" | openssl enc -aes-256-cbc -a -k "#{password}"`
        encrypted.cipher_key = password
        encrypted.decrypt.should eql(console_text)
      end
    end

    context 'with cipher key passed to a String instance' do

      it 'decrypts a string' do
        encrypted = `echo "foo" | openssl enc -aes-256-cbc -a -k "#{password}"`
        encrypted.decrypt(password).should eql(console_text)
      end
    end
  end
end
