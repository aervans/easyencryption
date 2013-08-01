# EasyEncryption

Easy Encryption provides a simple means for encrypting and decrypting strings. Uses the Gibberish gem (https://github.com/mdp/gibberish) under the hood to do the actual encryption work.

## Installation

Add this line to your application's Gemfile:

    gem 'easy_encryption'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install easy_encryption

Finally, call setup on EasyEncryption passing your cipher key:
```ruby
EasyEncryption.setup 'secret'
```

In a Rails app you will need to set the default cipher key inside of your app's ::Application.configure block:
```ruby
config.after_initialize do
  EasyEncryption.setup 'secret'
end
```

To enable the gem for your Rails tests, set the default cipher key inside of `test_helper.rb` as in the first example.

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

For special cases where a different cipher key needs to be used, it can be passed directly:
```ruby
encrypted_data = 'foo'.encrypt 'secret'
decrypted_data = 'encrypted data'.decrypt 'secret'
```

Alternatively:
```ruby
string = 'foo'
string.cipher_key = 'secret'
encrypted_data = string.encrypt

encrypted_data.cipher_key = 'secret'
decrypted_data = encrypted_data.decrypt
```

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
