# EasyEncryption

Easy Encryption provides a simple means for encrypting and decrypting strings. It utilizes the RbNaCl gem's simple box under the hood to do the actual encryption work (https://github.com/cryptosphere/rbnacl).

## Important

libsodium is required for the EasyEncryption gem to function. To install libsodium please refer to https://github.com/jedisct1/libsodium.

## Installation

Add this line to your application's Gemfile:

    gem 'easy_encryption'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install easy_encryption

Finally, call setup on EasyEncryption with a password:
```ruby
EasyEncryption.setup('secret')
```

In a Rails app you will need to set the default password inside of your app's ::Application.configure block:
```ruby
config.after_initialize do
  EasyEncryption.setup('secret')
end
```

## Usage

EasyEncryption provides two additional methods that can be called on any string.

`encrypt` will encrypt a string:
```ruby
encrypted_data = 'foo'.encrypt
```

`decrypt` will decrypt an encrypted string:
```ruby
decrypted_data = encrypted_data.decrypt
```
