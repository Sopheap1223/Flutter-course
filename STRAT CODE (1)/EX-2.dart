class BankAccount {
  final int accountId;
  final String accountOwner;
  double _balance;

  BankAccount(this.accountId, this.accountOwner) : _balance = 0.0;

  // Get the current balance
  double get balance => _balance;

  // Credit the account
  void credit(double amount) {
    if (amount > 0) {
      _balance += amount;
      print('Account $accountId credited with \$$amount. New balance: \$_${_balance.toStringAsFixed(2)}');
    } else {
      throw Exception('Amount to be credited must be positive.');
    }
  }

  // Withdraw from the account
  void withdraw(double amount) {
    if (amount <= _balance) {
      _balance -= amount;
      print('Account $accountId debited with \$$amount. New balance: \$_${_balance.toStringAsFixed(2)}');
    } else {
      throw Exception('Insufficient balance for withdrawal!');
    }
  }
}

class Bank {
  final String name;
  final List<BankAccount> _accounts = [];

  Bank({required this.name});

  // Create a new account
  BankAccount createAccount(int accountId, String accountOwner) {
    // Ensure the account ID is unique
    for (var account in _accounts) {
      if (account.accountId == accountId) {
        throw Exception('Account with ID $accountId already exists!');
      }
    }
    
    // Create a new account
    BankAccount newAccount = BankAccount(accountId, accountOwner);
    _accounts.add(newAccount);
    print('New account created with ID $accountId for $accountOwner.');
    return newAccount;
  }

  // Fetch account by ID
  BankAccount? getAccount(int accountId) {
    for (var account in _accounts) {
      if (account.accountId == accountId) {
        return account;
      }
    }
    return null;
  }
}
 
void main() {

  Bank myBank = Bank(name: "CADT Bank");
  BankAccount ronanAccount = myBank.createAccount(100, 'Ronan');

  print(ronanAccount.balance); // Balance: $0
  ronanAccount.credit(100);
  print(ronanAccount.balance); // Balance: $100
  ronanAccount.withdraw(50);
  print(ronanAccount.balance); // Balance: $50

  try {
    ronanAccount.withdraw(75); // This will throw an exception
  } catch (e) {
    print(e); // Output: Insufficient balance for withdrawal!
  }

  try {
    myBank.createAccount(100, 'Honlgy'); // This will throw an exception
  } catch (e) {
    print(e); // Output: Account with ID 100 already exists!
  }
}
