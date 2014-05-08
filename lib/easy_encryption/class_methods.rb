module EasyEncryption

  module ClassMethods

    attr_reader :simple_box

    # creates a simple_box using the passed key
    #
    #   created_simple_box('secret')
    def create_simple_box(key)
      @simple_box ||= RbNaCl::SimpleBox.from_secret_key(RbNaCl::Hash.sha256(key))
    end
  end
end
