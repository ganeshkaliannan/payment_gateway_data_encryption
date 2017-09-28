require_relative 'payment_gateway'

#Creating instance and triggering the encrypting and decrypting methods
pg = PaymentGateway.new
pg.encrypt_msg
pg.decrypt_pg_response