require "easy_encryption/version"
require "easy_encryption/instance_methods"
require "easy_encryption/class_methods"
require "gibberish"

module EasyEncryption

  # sets up EasyEncryption
  def self.setup(cipher_key)
    @cipher_key = cipher_key
    String.send :include, InstanceMethods
    String.send :extend, ClassMethods
    true
  end

  # getter for the default cipher key
  def self.cipher_key
    @cipher_key
  end

  # setter to change the default cipher key
  def self.cipher_key=(cipher_key)
    @cipher_key = cipher_key
  end

  # lambda for creating Gibberish ciphers
  CREATE_CIPHER = lambda do |cipher_key|

    if cipher_key == @last_cipher_key
      # no cipher has been created or cipher_key is the same
      @cipher = Gibberish::AES.new cipher_key
    else
      # cipher_key was changed
      @cipher = Gibberish::AES.new cipher_key
    end
    
    # remember the cipher key to determine if a new cipher
    # needs to be created on the next call
    @last_cipher_key = cipher_key
    # return the cipher
    @cipher
  end
end
