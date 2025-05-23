class Product {
  final String id, name, imageUrl;
  final double price;
  final int rating;

  const Product({
    required this.id,
    required this.name,
    required this.imageUrl,
    required this.price,
    required this.rating,
  });
}

const sampleProducts = [
  Product(
    id: '1',
    name: 'Margherita Italian',
    imageUrl:
    'https://media-cdn.grubhub.com/image/upload/d_search:browse-images:default.jpg/w_1200,q_auto,fl_lossy,dpr_auto,c_fill,f_auto,h_800,g_auto/bhroxavttzwurpwvxcig',
    price: 80,
    rating: 4,
  ),
  Product(
    id: '2',
    name: 'Sausage Pizza',
    imageUrl:
    'https://m.media-amazon.com/images/I/71X57RJJKDL._AC_UF894,1000_QL80_.jpg',
    price: 50,
    rating: 4,
  ),
  Product(
    id: '3',
    name: 'Pepperoni Pizza',
    imageUrl:
    'https://images.deliveryhero.io/image/fd-my/Products/1093280.jpg?width=%25s',
    price: 60,
    rating: 4,
  ),
  Product(
    id: '4',
    name: 'Cheese Pizza',
    imageUrl:
    'https://images.deliveryhero.io/image/fd-my/Products/1093280.jpg?width=%25s',
    price: 50,
    rating: 4,
  ),
];
