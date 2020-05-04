import 'package:flutter/material.dart';
import 'quote.dart';
import 'quote_card.dart';

Brightness theme = Brightness.light;
bool themeLight = true;

void main() => runApp(MaterialApp(
  title: "Quotes",
  home: quoteList(),
  theme: ThemeData(
    primarySwatch: Colors.green,
    brightness: theme,
    accentColor: Colors.blue,
  ),
));

class quoteList extends StatefulWidget {
  @override
  _quoteListState createState() => _quoteListState();
}

class _quoteListState extends State<quoteList> {

  List<Quote> quotes = [
    Quote(author: 'Oscar Wilde', text: 'Be yourself; everyone else is already taken'),
    Quote(author: 'Oscar Wilde', text: 'I have nothing to declare except my genius'),
    Quote(author: 'Oscar Wilde', text: 'I can resist everything except temptation.'),
    Quote(author: 'Oscar Wilde', text: 'The truth is rarely pure and never simple'),
    // Quote(author: 'Naman Aggarwal', text: 'Talk is cheap. Show me the code.'),
  ];

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        title: Text('Awesome Quotes'),
        backgroundColor: Colors.red,
        actions: <Widget>[
          FlatButton.icon(
            onPressed: () {
              if (themeLight) {
                themeLight = false;
                setState(() {
                  theme = Brightness.light;
                  main();
                });   
              }
              else
              {
                themeLight = true;
                setState(() {
                  theme = Brightness.dark;
                  main();
                });
              }
            },
             icon: Icon(Icons.wb_sunny),
             label: Text("Switch Theme"),
            )
        ],
      ),
      body: Column(
        children: quotes.map((quote) => QuoteCard(
          quote: quote,
          delete: () {
            setState(() {
              quotes.remove(quote);
            });
          },
        )).toList(),
      ),
    );
  }
}

