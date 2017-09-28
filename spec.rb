require 'rubygems'
require 'spec_helper'
require_relative 'payment_gateway'


#sample test cases for payment gateway

 describe PaymentGateway do 
  	before :each do
      @pg = PaymentGateway.new 
    end

   describe "#new" do
     it "payment gateway instance should exist" do
        @pg.should be_an_instance_of PaymentGateway
     end
   end

 end