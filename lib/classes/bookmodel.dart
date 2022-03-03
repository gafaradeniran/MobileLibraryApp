import 'package:flutter/material.dart';

class BookDetails {
  final String img, bookTitle, author, description; 
  final int pages;
  final double rating;
  final double? price;
  final String? isbn;

  BookDetails({
    required this.img,
    required this.bookTitle,
    required this.author,
    required this.rating,
    required this.description,
    required this.pages,
    this.price,
    this.isbn,
  });
}

//shuffles between the category lists
List allBooks = [...scienceBooks, ...comBooks, ...artBooks, ...generalBooks];

//books in the science category
List<BookDetails> scienceBooks = [
  BookDetails(
      img: 'assets/science/calChem.jpg',
      bookTitle: 'Calculations in Chemistry with Practicals',
      author: 'Oyebanji A. O',
      rating: 3.0,
      description:
          'Calculations in chemistry with practicals for Senior Secondary School 1, 2, 3. It is a must have for science students who intend to sit and pass their final examinations (WASCE) once',
      pages: 214),
  BookDetails(
      img: 'assets/science/classicBio.jpg',
      bookTitle: 'Classic Biology',
      author: 'Nneka Okechukwu',
      rating: 3.0,
      description:
          'Classical Biology for Senior Secondary School 1, 2, 3. It is a must have for science students who intend to sit and pass their final examinations (WASCE) once',
      pages: 350),
  BookDetails(
      img: 'assets/science/comp2.jpg',
      bookTitle: 'Computer Studies for SSS 1',
      author: 'Oyebanji A. O et al',
      rating: 4.0,
      description:
          'Computer Studies for Senior Secondary School 1. This is a recomended text for students in the first year of Senior Secondary School. All concepts are explained in clear terms and illustrations',
      pages: 149),
  BookDetails(
      img: 'assets/science/pracbiology.jpg',
      bookTitle: 'Vital Practical Biology',
      author: 'Oyebanji A. O',
      rating: 2.0,
      description:
          'Vital Practical Biology for Senior Secondary School 1, 2, 3. It is a must have for science students who intend to sit and pass their final examinations (WASCE) once',
      pages: 350),
  BookDetails(
      img: 'assets/science/lamladPhysics.jpg',
      bookTitle: "Lamlad's SSCE & UTME physics",
      author: 'Oyebanji A. O',
      rating: 5.0,
      description:
          'Lamlad UTME & SSCE Physics is an essential handbook for Senior Secondary School students and A level students preparing for JAMB and Post UTME exams.',
      pages: 95),
  BookDetails(
      img: 'assets/science/modernBio.jpg',
      bookTitle: 'Modern Biology for Senior Secondary Schools',
      author: 'Authors et all',
      rating: 3.0,
      description:
          'Modern Biology for Senior Secondary School 1, 2, 3. It is a must have for science students who intend to sit and pass their final examinations (WASCE) once',
      pages: 570),
  BookDetails(
      img: 'assets/science/techDraw.jpg',
      bookTitle: 'Technical drawing for Senior Certificate and G.C.E',
      author: 'J. N. Green',
      rating: 4.0,
      description:
          'Technical Drawing for Senior Certificate and G.C.E. It is a must have for science students who intend to sit and pass their final examinations (WASCE) once',
      pages: 120),
  BookDetails(
      img: 'assets/science/sschem2.jpg',
      bookTitle: 'Senior Secondary Chemistry 2',
      author: 'S. T. Ayuba et al',
      rating: 3.0,
      description:
          'Senior Secobadry Chemistry for Senior Secondary School 2. It is a must have for science students who intend to sit and pass their final examinations (WASCE) once',
      pages: 100),
  BookDetails(
      img: 'assets/science/orgChem.jpg',
      bookTitle: 'Organic Chemistry',
      author: 'Jonathan Clayden & Staurt Wareen',
      rating: 4.0,
      description:
          'Organic Chemistry is a comprehensive text for A-level and O-level students. It is a must have for science students who intend to sit and pass their final examinations (WASCE) once',
      pages: 200),
  BookDetails(
      img: 'assets/science/prinPhysics.jpg',
      bookTitle: 'Principles of Physics',
      author: 'M. Nelkon',
      rating: 2.0,
      description:
          'Principles of Physics for Senior Secondary Schools and A-level students. It is a must have for science students who intend to sit and pass their final examinations (WASCE) and JAMB once',
      pages: 450),
];
//books in the Commercial category
List<BookDetails> comBooks = [
  BookDetails(
      img: 'assets/commercial/acc1.png',
      bookTitle: 'Introduction to Financial Accounting',
      author: 'H. Dauderis & D. Annand',
      rating: 2.0,
      description:
          'Lorem Ipsum Lorem Iosum Lorem Ipsum. Every Lorem ipsum in lorem ipsum for lorem ipsum',
      pages: 200),
  BookDetails(
      img: 'assets/commercial/buyAcc.png',
      bookTitle: 'Principles of Accounting Vol. 2',
      author: 'Manegerial Accounting',
      rating: 2.0,
      description:
          'Lorem Ipsum Lorem Iosum Lorem Ipsum. Every Lorem ipsum in lorem ipsum for lorem ipsum',
      pages: 150),
  BookDetails(
      img: 'assets/commercial/compComm.jpg',
      bookTitle: 'Comprehensive Certificate Commerce for SS 2',
      author: 'H. Michael',
      rating: 3.0,
      description:
          'Lorem Ipsum Lorem Iosum Lorem Ipsum. Every Lorem ipsum in lorem ipsum for lorem ipsum',
      pages: 180),
  BookDetails(
      img: 'assets/commercial/compComm1.jpg',
      bookTitle: 'Comprehensive Commerce for Senior Sec Schools',
      author: 'D. Annand',
      rating: 3.0,
      description:
          'Lorem Ipsum Lorem Iosum Lorem Ipsum. Every Lorem ipsum in lorem ipsum for lorem ipsum',
      pages: 120),
  BookDetails(
      img: 'assets/commercial/introAcc.jpg',
      bookTitle: 'Introducing Accounting for A S',
      author: 'Ian Harrison',
      rating: 4.0,
      description:
          'Lorem Ipsum Lorem Iosum Lorem Ipsum. Every Lorem ipsum in lorem ipsum for lorem ipsum',
      pages: 111),
  BookDetails(
      img: 'assets/commercial/manAcc.jpg',
      bookTitle: 'Financial Accounting for Management',
      author: 'Ambrish Grupto',
      rating: 3.0,
      description:
          'Lorem Ipsum Lorem Iosum Lorem Ipsum. Every Lorem ipsum in lorem ipsum for lorem ipsum',
      pages: 213),
  BookDetails(
      img: 'assets/commercial/moreComm1.jpg',
      bookTitle: 'More Commerce TextBook for Senior Sec. Schools',
      author: 'Nwogu Kevin',
      rating: 2.0,
      description:
          'Lorem Ipsum Lorem Iosum Lorem Ipsum. Every Lorem ipsum in lorem ipsum for lorem ipsum',
      pages: 197),
];
//Books in the art category
List<BookDetails> artBooks = [
  BookDetails(
      img: 'assets/art/govt1.jpg',
      bookTitle: 'Senior Seconadry School Goverment Book 1',
      author: 'Oyebanji A. O',
      rating: 2.0,
      description:
          'Government for Senior Secondary School 1. It is an awesmome introductory text for senior secondary school students studying Goverment as a subject for the first time',
      pages: 157),
  BookDetails(
      img: 'assets/art/lit-eng1.jpg',
      bookTitle: 'The Life Changer',
      author: 'Khadija Abubakar',
      rating: 4.0,
      description:
          'The Life Changer is a literart material recommended by the JAMB for senior secondary school students and A-level students alike. This is must read from an established author- Khadija Abubakar',
      pages: 237),
  BookDetails(
      img: 'assets/art/litEng1.jpg',
      bookTitle: 'Literature Exam Questions & Answers for SS3',
      author: 'Tost Streams',
      rating: 3.0,
      description:
          'Literature Exam Quetsions & Answers for senior secondary school students contains compiled series of past questions and answers from different Examination bodies',
      pages: 237),
  BookDetails(
      img: 'assets/art/litEng2.jpg',
      bookTitle: 'Sleep Well My Lady',
      author: 'Kwei Quartey',
      rating: 4.0,
      description:
          'This 300 page novel is one of the bestsellers of 2020. It is truly a case of an African story written by an Africans for Africans and the rest of the world',
      pages: 300),
  BookDetails(
      img: 'assets/art/pqGovt.jpg',
      bookTitle: 'Government Exam Questions & Answers for SS1',
      author: 'Tost Streams',
      rating: 3.0,
      description:
          'Government Exam Quetsions & Answers for senior secondary school 1 contains relevant past questions and answers to aid learning the subject',
      pages: 237),
  BookDetails(
      img: 'assets/art/secedu1.jpg',
      bookTitle: 'Security Education for SS1',
      author: 'Dayo Oyetunji et al',
      rating: 3.0,
      description:
          'Security Education for senior secondary school 1. A good text on security studies for SS1 students',
      pages: 237),
  BookDetails(
      img: 'assets/art/civic1.jpg',
      bookTitle: 'Past Leaders of Nigeria',
      author: 'Anonymous Author',
      rating: 3.0,
      description:
          'Past Leaders of Nigeria is a must read for every good citizen of the country',
      pages: 237),
];
//list of books in the general category
List<BookDetails> generalBooks = [
  BookDetails(
      img: 'assets/general/buyYoruba1.jpg',
      bookTitle: 'Yoruba Myths',
      author: 'Ulli Beier',
      rating: 3.0,
      description:
          'A comprehensive text on beliefs, culture and life of the Yoruba ethnic nationality of SouthWest Nigeria. A very good reference book',
      pages: 257),
  BookDetails(
      img: 'assets/general/MathDic.jpg',
      bookTitle: 'Concise Dictionary of Mathematics',
      author: 'Oxford Books',
      rating: 3.0,
      description:
          'A concise reference materials for lovers and learners of Mathematics. It is a very good companion for students who intend to build a career in Engineering and Physical Science',
      pages: 1300),
  BookDetails(
      img: 'assets/general/oxfordEng3.jpg',
      bookTitle: 'New Oxford Secondary English Course for SS3',
      author: 'Oxford Books',
      rating: 4.0,
      description:
          'The New Oxford Secondary English Course (NOSEC) series has found its way into the curricular of seconadry schools in Nigeria owing to its invaluable content',
      pages: 990),
  BookDetails(
      img: 'assets/general/oralEng.jpg',
      bookTitle: 'Oral English Pedagogue',
      author: 'Opeifa Olasunkanmi',
      rating: 4.0,
      description:
          'The book, Oral English Pedagogue demystifies the usual hitch students experience while learning oral English',
      pages: 990),
  BookDetails(
      img: 'assets/general/compEcons.jpg',
      bookTitle: 'Comprehensive Economics for Senior Secondary Schools',
      author: 'Johnson Anyaele',
      rating: 5.0,
      description:
          'The New Oxford Secondary English Course (NOSEC) series has found its way into the curricular of seconadry schools in Nigeria owing to its invaluable content',
      pages: 990),
  BookDetails(
      img: 'assets/general/ecoSenior.jpg',
      bookTitle: 'Economics for Senior Secondary Schools',
      author: 'Gbenga Babalola',
      rating: 5.0,
      description:
          'Despite having a nice cover and receiving good reviews, it was not selling as many copies as it should have. So we dove into the book description, figured out the flaws, and completely revamped it.',
      pages: 990),
  BookDetails(
      img: 'assets/general/effectMath1.jpg',
      bookTitle: 'Effective Mathematics for Senior Secondary Schools Book 1',
      author: 'O. Popoola, M. Ejike, C. N. Osendu, & A. Adeniyan',
      rating: 5.0,
      description:
          'Despite having a nice cover and receiving good reviews, it was not selling as many copies as it should have. So we dove into the book description, figured out the flaws, and completely revamped it.',
      pages: 990),
  BookDetails(
      img: 'assets/general/newGen3.jpg',
      bookTitle: 'New General Mathematics Book 3',
      author: 'M. F. Macrae, A. O. Kalejaiye et al',
      rating: 5.0,
      description:
          'Despite having a nice cover and receiving good reviews, it was not selling as many copies as it should have. So we dove into the book description, figured out the flaws, and completely revamped it.',
      pages: 990),
  BookDetails(
      img: 'assets/general/engMath.jpg',
      bookTitle: 'Engineering Mathematics',
      author: 'K. A. Stroud',
      rating: 5.0,
      description:
          'Despite having a nice cover and receiving good reviews, it was not selling as many copies as it should have. So we dove into the book description, figured out the flaws, and completely revamped it.',
      pages: 990),
  BookDetails(
      img: 'assets/general/concEnglish2.jpg',
      bookTitle: 'New Concept English for Senior Sec. Schools Book 2',
      author: 'Gbenga Babalola',
      rating: 5.0,
      description:
          'Despite having a nice cover and receiving good reviews, it was not selling as many copies as it should have. So we dove into the book description, figured out the flaws, and completely revamped it.',
      pages: 990),
  BookDetails(
      img: 'assets/general/alawiye.jpg',
      bookTitle: 'Alawiye Iwe keji',
      author: 'J. F. Odunjo',
      rating: 5.0,
      description:
          'Despite having a nice cover and receiving good reviews, it was not selling as many copies as it should have. So we dove into the book description, figured out the flaws, and completely revamped it.',
      pages: 990),
];
//books to be paid for
List<BookDetails> paidBooks = [
  BookDetails(
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
      img: 'assets/general/buyYoruba.jpg',
      bookTitle: 'A Dictionary of the Yoruba Language',
      author: 'Oduduwa Oranmiyan',
      rating: 5.0,
      description:
          'A comprehensive text on beliefs, culture and life of the Yoruba ethnic nationality of SouthWest Nigeria. A very good reference book',
      pages: 257,
      isbn: 'ISBN: 978-078-213-243-3',
      price: 400.0),
  BookDetails(
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
      img: 'assets/science/lamladPhysics.jpg',
      bookTitle: 'Lamlad Physics for SSCE & UTME',
      author: 'Theodore Brown et al',
      rating: 4.0,
      description:
          'Organic Chemistry is a comprehensive text for A-level and O-level students. It is a must have for science students who intend to sit and pass their final examinations (WASCE) once',
      pages: 200,
      isbn: 'ISBN: 978-978-213-243-7',
      price: 400.0),
  BookDetails(
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
