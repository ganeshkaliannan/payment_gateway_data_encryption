require 'rubygems'
require_relative '../payment_gateway'

#sample test cases for payment gateway

 describe PaymentGateway do 
  	before :each do
      @pg = PaymentGateway.new 
    end

   describe "#new" do
     it "payment gateway instance should exist" do
     	expect(@pg).to be_an_instance_of(PaymentGateway)
     end
   end

   describe "#encrypt_msg" do
   	 it "enrypted message should exist" do
     end
   end

 end