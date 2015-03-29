require 'rubygems'
require 'sinatra'
require './ext/credit_calculator.rb'
require 'pry'

get "/" do
     erb :index
end

post "/calculate" do
    credit  = CreditCalculator.new(params[:percent].to_i, params[:credit].to_f, params[:term].to_i, params[:pay_off])
    if credit.valid?
        @credit_table = credit.calculate
        erb :calculate, :layout => false
    else
        '<span class="label label-danger">Вы ввели не все данные </span>'
    end
end