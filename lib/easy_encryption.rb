require "easy_encryption/version"
require "easy_encryption/instance_methods"
require "easy_encryption/class_methods"
require "rbnacl"

module EasyEncryption

  # sets up EasyEncryption. 
  #
  #   EasyEncryption.setup('secret')
  def self.setup(key)
    String.send :include, InstanceMethods
    String.send :extend, ClassMethods
    String.create_simple_box key
  end
end
