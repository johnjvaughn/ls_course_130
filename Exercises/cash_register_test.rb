require 'minitest/autorun'
require 'minitest/reporters'
Minitest::Reporters.use!

require_relative 'transaction'
require_relative 'cash_register'

class CashRegisterTest < Minitest::Test
  def setup
    @reg_total = 750
    @trans_amount = 8.25
    @trans_amount_paid = 15.75
    @register = CashRegister.new(@reg_total)
    @transaction = Transaction.new(@trans_amount)
    @transaction.amount_paid = @trans_amount_paid
    @prev_total_money = @register.total_money
    @register.accept_money(@transaction)
  end

  def test_accept_money
    assert_equal(@prev_total_money + @trans_amount_paid, @register.total_money)
  end

  def test_change
    assert_equal(@trans_amount_paid - @trans_amount, @register.change(@transaction))
  end

  def test_give_receipt
    assert_output("You've paid $#{@trans_amount}.\n")  { @register.give_receipt(@transaction) }
  end

  def test_prompt_for_payment
    input = StringIO.new("8\n10.83")
    output_model = <<~OUTPUT.chomp
            You owe $#{@trans_amount}.
            How much are you paying?
            That is not the correct amount. Please make sure to pay the full cost.
            You owe $#{@trans_amount}.
            How much are you paying?

          OUTPUT
    assert_output(output_model) { @transaction.prompt_for_payment(input: input) }
    # output = StringIO.new
    # @transaction.prompt_for_payment(input: input, output: output)
    # assert_equal(output_model, output.read)
    assert_equal(10.83, @transaction.amount_paid)
  end
end
