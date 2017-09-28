module Mock

	def self.client_params
        params = {bank_ifsc_code: 'ICIC0000002',bank_account_number: 2444877363262,amount: 50000,merchant_transaction_ref: 'txn0036',transaction_date: '2017-09-28',payment_gateway_merchant_reference: 'merc004'}
		puts "Mock parameters received from client\n"
		puts "****************************************"
		puts params
		return parse_params(params)
	end

	def self.pg_params
        pg_params = {txn_status: 'success',amount: 50000,merchant_transaction_ref: 'txn0036',transaction_date: '2017-09-28',payment_gateway_merchant_reference: 'merc004',payment_gateway_transaction_reference:'pg_txn_0001'}
        puts "Mock parameters for PG:\n"
		puts "****************************************"
        puts pg_params
        return parse_params(pg_params)
	end


    #Mocking the request parameters hash and converting into a string with | seperator
    #Finally appending the string with hash digest
	def self.parse_params(params)
		string = ""
		params.each do |key, val|
		  string+= key.to_s+'='+val.to_s+'|'
		end
		digest = Digest::SHA1.hexdigest string
		return  string +'hash='+ digest
	end
end