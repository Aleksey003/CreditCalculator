class CreditCalculator
  
  def initialize(percent, credit, term, pay_off)
    @percent = percent
    @credit  = credit
    @term    = term
    @pay_off = pay_off
  end
  
  def valid?
    instance_variables.each do |ver|
      if instance_variable_get(ver) == 0
        return false
      end
    end
  end
   
  def calculate()
    credit_table = [] 
    if @pay_off == "usual"
      month_credit_sum = @credit/@term
      @term.times do |i|
        month_percent_payment = (@credit*@percent/1200).round(2)
        month_payment = month_percent_payment + month_credit_sum 
        @credit -= month_credit_sum
        credit_table << {month: i+1, month_credit_sum: month_credit_sum, month_percent_payment: month_percent_payment,
          month_payment: month_payment, credit: @credit} 
      end
    else
      month_percent = @percent.to_f/1200
      equal_factor = (month_percent*((1+month_percent)**@term)/(((1+month_percent)**@term)-1))
      month_payment = @credit*equal_factor
      @term.times do |i|
        month_percent_payment = @credit * month_percent
        month_credit_sum = month_payment - month_percent_payment
        
        if @credit < month_credit_sum
          @credit = 0  
        else
          @credit -= month_credit_sum
        end
        credit_table << {month: i+1, month_credit_sum: month_credit_sum, month_percent_payment: month_percent_payment,
            month_payment: month_payment, credit: @credit}
      end
    end
    credit_table  
  end
  
end
