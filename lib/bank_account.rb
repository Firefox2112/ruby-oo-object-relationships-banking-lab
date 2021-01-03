class BankAccount
attr_accessor :balance, :status
attr_reader :name
@@all = []


def initialize(name, balance = 1000, status = "open")
    @name = name
    @balance = balance
    @status = status
    @@all << self
end
def self.all
    @@all
end
def deposit(money)
    self.balance += money
end
def display_balance
    "Your balance is $#{self.balance}."
end
def valid?
    if @status == "open" && @balance > 0
        true
    else
        false
    end
end
def close_account
    @status = "closed"
end




end
