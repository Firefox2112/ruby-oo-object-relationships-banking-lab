class Transfer
attr_accessor :amount
attr_reader :sender, :receiver, :status
@@all = []

def initialize(sender, receiver, amount)
  @sender = sender
  @receiver = receiver
  @status = "pending"
  @amount = amount
  @@all << self
end
def valid?
  if self.amount < self.sender.balance
  self.sender.valid?
  self.receiver.valid?
  end
end
def execute_transaction
  if self.valid? && @status == "pending" && @sender.balance > @amount
  @sender.balance -= @amount
  @receiver.balance += @amount
  @status = "complete"
  else
  @status = "rejected"
  "Transaction rejected. Please check your account balance."
  end
end

#def reverse_transfer        First attempt. Not sure why this failed "Can reverse transfer between two accounts test"
  #if self.status == "complete"
  #self.sender.balance += amount
  #self.receiver.balance -= amount
  #self.status = "reversed"
  #end
#end

def reverse_transfer
  if self.execute_transaction
    @sender.balance += @amount
    @receiver.balance -= @amount
    @status = "reversed"
  end
end






end
