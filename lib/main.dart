import 'package:flutter/material.dart';
import 'quote.dart';
import 'quote_card.dart';

Brightness theme = Brightness.light;
bool themeLight = true;

void main() => runApp(MaterialApp(
  title: "Quotes",
  home: quoteList(),
  theme: ThemeData(
    primarySwatch: Colors.red,
    brightness: theme,
    accentColor: Colors.red,
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
    Quote(author: 'Naman Aggarwal', text: 'Talk is cheap. Show me the code.'),
  ];

  String text ="";
  String name="";

  createAlertDialog(BuildContext context){

    // TextEditingController customController = TextEditingController();

    return showDialog(context: context, builder: (context){
      return AlertDialog(
        // title: Text("Add Quote"),
        content: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children : <Widget>[

            Text("Add Quote"),
            SizedBox(height:20.0),
            TextFormField(
              decoration: InputDecoration(
                hintText : 'Your name'
              ),
              style: TextStyle(fontSize: 17.0),
              onChanged: (val) {
                setState(() {
                  name=val;
                });
              },
            ),

            SizedBox(height : 20.0), 

            TextFormField(
              decoration: InputDecoration(
                hintText : 'Quote'
              ),
              style: TextStyle(fontSize: 17.0),
              onChanged: (val) {
                setState(() {
                  text=val;
                });
              },
            ),
            SizedBox(height : 30.0),
            RaisedButton(
              color: Colors.red,
              child: Text(
                'Submit'
              ),
              onPressed: (){

                setState(() {
                  quotes.add(Quote(author: name, text : text));
                });
                
                Navigator.of(context).pop();

              },
            ),

          ], 
        ),
        
      );
    });
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text('Awesome Quotes'),
        // backgroundColor: Colors.red,
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
      body: ListView.builder(
        itemCount: quotes.length,
        itemBuilder: (context , index){
          return QuoteCard(
            quote: quotes[index],
            delete: () {
            setState(() {
              quotes.remove(quotes[index]);
            });
          },
          );
        }
        ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          createAlertDialog(context);
        },
        child: Icon(Icons.add),
      ),
    );
  }
}

