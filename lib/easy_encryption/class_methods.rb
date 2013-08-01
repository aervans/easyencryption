module EasyEncryption

  module ClassMethods

    # returns a Gibberish cipher
    def cipher
      # create/use a cipher in the context of the String singleton
      instance_exec EasyEncryption.cipher_key, &EasyEncryption::CREATE_CIPHER
    end
  end
end
