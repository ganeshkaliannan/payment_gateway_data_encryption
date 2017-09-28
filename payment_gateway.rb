require_relative 'mock'
require_relative 'http_request'
require 'digest'
require 'openssl'
require "base64"

include Base64

class PaymentGateway

    #initializing the key and encrypting the client parameters
	def initialize
		@key = 'Q9fbkBF8au24C9ws'
	end

    #encrypting the message using AES128CBC algorithm with mock data
	def encrypt_msg
		payload_with_sha = Mock.client_params
		payload_to_pg = msg_encrypt(payload_with_sha)
		puts "Message sent to pg after encryption (AES128CBC ):\n"
		puts "****************************************" 
		puts payload_to_pg
		
	end

   # Mocking pg response
	def decrypt_pg_response
        pg_sha_params = Mock.pg_params
        payload_from_pg = msg_encrypt(pg_sha_params)
        puts "Mock response received from PG:\n"
        puts "****************************************"
        puts payload_from_pg
        decrypted_pg_response = msg_decrypt(payload_from_pg)
        puts "Decrypted pg response:\n"
        puts "****************************************"
        puts decrypted_pg_response
        puts "Printing all parameters received from PG:"
        puts "****************************************"
        decrypted_pg_response.split('|').each do |response|
          puts response
        end
	end

	private

  #encrypting the data using AES128CBC algorithm and encoding it using base64
	def msg_encrypt(data)
		cipher = OpenSSL::Cipher.new('AES-128-CBC').encrypt
		cipher.key = @key
		encrypted_msg = cipher.update(data) + cipher.final
		return urlsafe_encode64(encrypted_msg)
	end

  #decrypting the data using AES128CBC algorithm and decoding it using base64
	def msg_decrypt(encrypted_msg)
		decode_response = urlsafe_decode64(encrypted_msg)
		decipher = OpenSSL::Cipher.new('AES-128-CBC').decrypt
		decipher.key = @key
		decrypted_msg = decipher.update(decode_response) + decipher.final
	end
end
