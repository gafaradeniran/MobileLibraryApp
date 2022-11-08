
class BookDetails {
  final String img, bookTitle, author, description;
  final int pages;
  final double rating;
  final int? index;
  final double? price;
  final String? isbn;

  String get getImg => img;
  String get getBooktitle => bookTitle;
  String get getAuthor => author;
  String get getDescription => description;
  int get getPages => pages;
  int? get getIndex => index;
  double get getRating => rating;
  double? get getPrice => price;
  String? get getIsbn => isbn;

  BookDetails({
    required this.img,
    required this.bookTitle,
    required this.author,
    required this.rating,
    required this.description,
    required this.pages,
    this.index,
    this.price,
    this.isbn,
  });
}

//shuffles between the category lists
List<BookDetails> allBooks = [
  // ...scienceBooks,
  // ...comBooks,
  // ...artBooks,
  // ...generalBooks
];

//Books in the art category
// List<BookDetails> artBooks = [
//   BookDetails(
//       index: 17,
//       img: 'assets/art/govt1.jpg',
//       bookTitle: 'Senior Seconadry School Goverment Book 1',
//       author: 'Oyebanji A. O',
//       rating: 2.0,
//       description:
//           'Government for Senior Secondary School 1. It is an awesmome introductory text for senior secondary school students studying Goverment as a subject for the first time',
//       pages: 157),
//   BookDetails(
//       index: 18,
//       img: 'assets/art/lit-eng1.jpg',
//       bookTitle: 'The Life Changer',
//       author: 'Khadija Abubakar',
//       rating: 4.0,
//       description:
//           'The Life Changer is a literart material recommended by the JAMB for senior secondary school students and A-level students alike. This is must read from an established author- Khadija Abubakar',
//       pages: 237),
//   BookDetails(
//       index: 19,
//       img: 'assets/art/litEng1.jpg',
//       bookTitle: 'Literature Exam Questions & Answers for SS3',
//       author: 'Tost Streams',
//       rating: 3.0,
//       description:
//           'Literature Exam Quetsions & Answers for senior secondary school students contains compiled series of past questions and answers from different Examination bodies',
//       pages: 237),
//   BookDetails(
//       index: 20,
//       img: 'assets/art/litEng2.jpg',
//       bookTitle: 'Sleep Well My Lady',
//       author: 'Kwei Quartey',
//       rating: 4.0,
//       description:
//           'This 300 page novel is one of the bestsellers of 2020. It is truly a case of an African story written by an Africans for Africans and the rest of the world',
//       pages: 300),
//   BookDetails(
//       index: 21,
//       img: 'assets/art/pqGovt.jpg',
//       bookTitle: 'Government Exam Questions & Answers for SS1',
//       author: 'Tost Streams',
//       rating: 3.0,
//       description:
//           'Government Exam Quetsions & Answers for senior secondary school 1 contains relevant past questions and answers to aid learning the subject',
//       pages: 237),
//   BookDetails(
//       index: 22,
//       img: 'assets/art/secedu1.jpg',
//       bookTitle: 'Security Education for SS1',
//       author: 'Dayo Oyetunji et al',
//       rating: 3.0,
//       description:
//           'Security Education for senior secondary school 1. A good text on security studies for SS1 students',
//       pages: 237),
//   BookDetails(
//       index: 23,
//       img: 'assets/art/civic1.jpg',
//       bookTitle: 'Past Leaders of Nigeria',
//       author: 'Anonymous Author',
//       rating: 3.0,
//       description:
//           'Past Leaders of Nigeria is a must read for every good citizen of the country',
//       pages: 237),
// ];

//books to be paid for
List<BookDetails> paidBooks = [
  BookDetails(
      index: 35,
      img: 'assets/general/engMath.jpg',
      bookTitle: 'Engineering Mathematics',
      author: 'K. A. Stroud',
      rating: 5.0,
      description:
          'Despite having a nice cover and receiving good reviews, it was not selling as many copies as it should have. So we dove into the book description, figured out the flaws, and completely revamped it.',
      pages: 990,
      isbn: 'ISBN: 978-078-213-243-0',
      price: 400.0),
  BookDetails(
      index: 36,
      img: 'assets/general/MathDic.jpg',
      bookTitle: 'Concise Dictionary of Mathematics',
      author: 'Oxford Books',
      rating: 3.0,
      description:
          'A concise reference materials for lovers and learners of Mathematics. It is a very good companion for students who intend to build a career in Engineering and Physical Science',
      pages: 1300,
      isbn: 'ISBN: 978-078-213-243-1',
      price: 400.0),
  BookDetails(
      index: 37,
      img: 'assets/general/buyYoruba1.jpg',
      bookTitle: 'Yoruba Myths',
      author: 'Ulli Beier',
      rating: 3.0,
      description:
          'A comprehensive text on beliefs, culture and life of the Yoruba ethnic nationality of SouthWest Nigeria. A very good reference book',
      pages: 257,
      isbn: 'ISBN: 978-078-213-243-2',
      price: 400.0),
  BookDetails(
      index: 38,
      img: 'assets/general/buyYoruba.jpg',
      bookTitle: 'A Dictionary of the Yoruba Language',
      author: 'Oduduwa Oranmiyan',
      rating: 5.0,
      description:
          'A comprehensive text on language, culture and poems of the Yoruba language. A very good reference book',
      pages: 257,
      isbn: 'ISBN: 978-078-213-243-3',
      price: 400.0),
  BookDetails(
      index: 39,
      img: 'assets/general/essyoruba.jpg',
      bookTitle: 'Essentials of Yoruba Grammar',
      author: 'Awoboluyi',
      rating: 3.0,
      description:
          'A comprehensive text on beliefs, culture and life of the Yoruba ethnic nationality of SouthWest Nigeria. A very good reference book',
      pages: 257,
      isbn: 'ISBN: 978-078-213-243-4',
      price: 400.0),
  BookDetails(
      index: 40,
      img: 'assets/general/provYoruba.jpg',
      bookTitle: 'Yoruba Proverbs',
      author: 'Anthony A. K',
      rating: 3.0,
      description:
          'A comprehensive text on beliefs, culture and life of the Yoruba ethnic nationality of SouthWest Nigeria. A very good reference book',
      pages: 257,
      isbn: 'ISBN: 978-978-004-243-5',
      price: 400.0),
  BookDetails(
      index: 41,
      img: 'assets/science/buyChem.jpg',
      bookTitle: 'Chemistry in Central Science',
      author: 'Theodore Brown et al',
      rating: 4.0,
      description:
          'Organic Chemistry is a comprehensive text for A-level and O-level students. It is a must have for science students who intend to sit and pass their final examinations (WASCE) once',
      pages: 200,
      isbn: 'ISBN: 978-978-213-243-6',
      price: 400.0),
  BookDetails(
      index: 42,
      img: 'assets/science/lamladPhysics.jpg',
      bookTitle: 'Lamlad Physics for SSCE & UTME',
      author: 'Theodore Brown et al',
      rating: 4.0,
      description:
          'Lamlad Physics is a comprehensive text for A-level and O-level students. It is a must have for science students who intend to sit and pass their final examinations (WASCE) once',
      pages: 200,
      isbn: 'ISBN: 978-978-213-243-7',
      price: 400.0),
  BookDetails(
      index: 43,
      img: 'assets/commercial/jambAcc.jpg',
      bookTitle: 'Financial Accounting for the Hospitality & Toursism Sector',
      author: "Doncha O'Dounaghue",
      rating: 4.0,
      description:
          'Lorem Ipsum Lorem Iosum Lorem Ipsum. Every Lorem ipsum in lorem ipsum for lorem ipsum',
      pages: 200,
      isbn: 'ISBN: 978-978-213-243-8',
      price: 400.0),
  BookDetails(
      index: 44,
      img: 'assets/commercial/lessonComm.jpg',
      bookTitle: 'Lesson Note on Commerce for SS2',
      author: "Spectrum Books",
      rating: 4.0,
      description:
          'Lorem Ipsum Lorem Iosum Lorem Ipsum. Every Lorem ipsum in lorem ipsum for lorem ipsum',
      pages: 200,
      isbn: 'ISBN: 978-978-213-243-9',
      price: 400.0),
  BookDetails(
      index: 45,
      img: 'assets/art/novel1.jpg',
      bookTitle: 'Things Fall Apart',
      author: "Chinua Achebe",
      rating: 4.0,
      description:
          'Lorem Ipsum Lorem Iosum Lorem Ipsum. Every Lorem ipsum in lorem ipsum for lorem ipsum',
      pages: 200,
      isbn: 'ISBN: 978-978-213-241-0',
      price: 1000.0),
  BookDetails(
      index: 46,
      img: 'assets/general/buyYoruba.jpg',
      bookTitle: 'A Dictionary of the Yoruba Language',
      author: 'Oduduwa Oranmiyan',
      rating: 5.0,
      description:
          'A comprehensive text on beliefs, culture and life of the Yoruba ethnic nationality of SouthWest Nigeria. A very good reference book',
      pages: 257,
      isbn: 'ISBN: 978-078-213-241-9',
      price: 400.0),
  BookDetails(
      index: 47,
      img: 'assets/general/essyoruba.jpg',
      bookTitle: 'Essentials of Yoruba Grammar',
      author: 'Awoboluyi',
      rating: 3.0,
      description:
          'A comprehensive text on beliefs, culture and life of the Yoruba ethnic nationality of SouthWest Nigeria. A very good reference book',
      pages: 257,
      isbn: 'ISBN: 978-078-213-241-7',
      price: 400.0),
];
