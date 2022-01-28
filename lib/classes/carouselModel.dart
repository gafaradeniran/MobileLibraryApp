import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Carousels {
  final String? quote, quoteAuthor, img;

  Carousels({this.quote, this.quoteAuthor, this.img});
}

List<Carousels> carouselDetails = [
  Carousels(
    quote: 'Reading is to the mind what exercise is to the body.',
    quoteAuthor: '-Addison',
    img: ('assets/Addison.png'),
  ),
  Carousels(
    quote:
        'Any people that is starved with books, will suffer intellectual malnutrition, stagnation & atrophy',
    quoteAuthor: "Obafemi Awolowo (1909-'87)",
    img: ('assets/awolowo.jpg'),
  ),
  Carousels(
    quote:
        'Education is the most powerful weapon which you can use to change the world.',
    quoteAuthor: 'Nelson Mandela, (1866-1959)',
    img: ('assets/mandela.jpg'),
  ),
  Carousels(
    quote:
        'Many stories matter.... But stories can also be used to empower, and to humanize.',
    quoteAuthor: 'Chimamanda Ngozi Adichie',
    img: ('assets/chimamanda.jpg'),
  ),
  Carousels(
    quote: 'A truly great library has something in it to offend everyone.',
    quoteAuthor: 'Jo Godwin',
    img: ('assets/godwin.jpg'),
  ),
  Carousels(
    quote:
        'And I believe that the best learning process of any kind of craft is just to look at the work of others.',
    quoteAuthor: 'Wole Soyinka',
    img: ('assets/soyinka.jpg'),
  ),
];

List<Widget> generateCarousel() {
  return carouselDetails
      .map((Carousels) => ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: Container(
              color: Colors.white,
              child: Row(
                children: [
                  Expanded(
                    flex: 2,
                    child: Container(
                        width: 40,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage(Carousels.img!),
                              fit: BoxFit.cover),
                        )),
                  ),
                  Expanded(
                    flex: 3,
                    child: Padding(
                      padding: const EdgeInsets.all(3.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            Carousels.quote!,
                            style: GoogleFonts.poppins(fontSize: 14),
                            softWrap: true,
                          ),
                          const SizedBox(height: 5),
                          Text(Carousels.quoteAuthor!,
                              style: GoogleFonts.croissantOne(fontSize: 12)),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ))
      .toList();
}
