class MaskFormatter {
  static String maskNumberCreditCards(String cardNumber) {
    if (cardNumber.length != 16) {
      return cardNumber;
    }

    var visiblePart = cardNumber.substring(cardNumber.length - 4);
    var maskedPart = '${'*' * 4} ${'*' * 4} ${'*' * 4} ';
    return '$maskedPart$visiblePart';
  }
}
