module EasyEncryption

  module InstanceMethods

    # encrypts a string. ex: "string".encrypt
    def encrypt(cipher_key=nil)
      @cipher_key = cipher_key if cipher_key
      cipher.encrypt self
    end

    # decrypts a string. ex: "string".decrypt
    def decrypt(cipher_key=nil)
      @cipher_key = cipher_key if cipher_key
      cipher.decrypt self
    end

    # setter to change the cipher key on an instance of String
    def cipher_key=(cipher_key)
      @cipher_key = cipher_key
    end

  private

    # returns a Gibberish cipher
    def cipher

      if @cipher_key
        # create/use a cipher in the context of a String instance
        instance_exec @cipher_key, &EasyEncryption::CREATE_CIPHER
      else
        # use the singleton class's cipher
        self.class.cipher
      end
    end
  end
end
