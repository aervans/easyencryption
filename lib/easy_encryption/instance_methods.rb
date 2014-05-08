module EasyEncryption

  module InstanceMethods

    # encrypts a string
    def encrypt
      simple_box.encrypt self
    end

    # decrypts a string
    def decrypt
      simple_box.decrypt self
    end

    # references simple_box on the singleton class
    def simple_box
      self.class.simple_box
    end
  end
end
