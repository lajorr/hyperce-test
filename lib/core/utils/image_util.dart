import 'dart:math';

class ImageUtil {
  static List<String> getImagesFromAsset() {
    final random = Random();
    int count = 1 + random.nextInt(5);

    return List.generate(count, (index) => 'assets/images/shoe.png');
  }

  static String getBrandLogo(String brandName) {
    switch (brandName.toLowerCase()) {
      case 'adidas':
        return 'assets/logos/adidas.svg';
      case 'nike':
        return 'assets/logos/nike.svg';
      case 'puma':
        return 'assets/logos/puma.svg';
      case 'reebok':
        return 'assets/logos/reebok.svg';
      case 'jordan':
        return 'assets/logos/jordan.svg';
      case 'vans':
        return 'assets/logos/vans.svg';
      default:
        return 'assets/logos/shoe.svg';
    }
  }
}
