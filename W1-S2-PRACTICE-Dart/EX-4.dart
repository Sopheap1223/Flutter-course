void main() {
  const pizzaPrices = {
    'margherita': 5.5,
    'pepperoni': 7.5,
    'vegetarian': 6.5,
  };

  const order = ['margherita', 'pepperoni', 'pineapple']; // Example order

  double total = calculateTotal(pizzaPrices, order);
  
  if (total >= 0) {
    print('Total: \$${total.toStringAsFixed(2)}');
  }
}

double calculateTotal(Map<String, double> prices, List<String> order) {
  double total = 0;

  for (var pizza in order) {
    if (prices.containsKey(pizza)) {
      total += prices[pizza]!;
    } else {
      print('$pizza pizza is not on the menu');
      return -1; 
    }
  }

  return total;
}
