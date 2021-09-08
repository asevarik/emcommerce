class Wishlistmodel {
  final String title, price, photourl;
  final int id;
  Wishlistmodel({this.title, this.price, this.id, this.photourl});
}

List<Wishlistmodel> wishlist = [
  Wishlistmodel(
      id: 1,
      title: "Shoe 1",
      price: "250",
      photourl:
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS4PdHtXka2-bDDww6Nuect3Mt9IwpE4v4HNw&usqp=CAU'),
  Wishlistmodel(
      id: 2,
      title: "Shoe 2",
      price: "252",
      photourl:
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS4PdHtXka2-bDDww6Nuect3Mt9IwpE4v4HNw&usqp=CAU'),
  Wishlistmodel(
      id: 3,
      title: "Shoe 3",
      price: "251",
      photourl:
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS4PdHtXka2-bDDww6Nuect3Mt9IwpE4v4HNw&usqp=CAU'),
  Wishlistmodel(
      id: 4,
      title: "Shoe 4",
      price: "256",
      photourl:
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS4PdHtXka2-bDDww6Nuect3Mt9IwpE4v4HNw&usqp=CAU'),
  Wishlistmodel(
      id: 5,
      title: "Shoe 5",
      price: "259",
      photourl:
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS4PdHtXka2-bDDww6Nuect3Mt9IwpE4v4HNw&usqp=CAU'),
];
