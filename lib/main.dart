import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:myapp/callMaker.dart';

void main() => runApp(
      const MaterialApp(
        title: 'Flutter',
        home: MyWidget(),
      ),
    );

class MyWidget extends StatefulWidget {
  const MyWidget({super.key});

  @override
  State<MyWidget> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyWidget> {
  String imageUrl = "HELLO";

  @override
  void initState() {
    // fetch data from API
    super.initState();

    getData();
  }

  getData() async {
    var url = await callMaker().getPost();
    if (url != null) {
      int n = url.preview.length;
      imageUrl = url.preview[n-1];

    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.purple[50],
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.purple,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          onPressed: () {
            setState(() {
              getData();
            });
          },
          child: const Icon(Icons.refresh),
        ),
        appBar: AppBar(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10)),
          backgroundColor: Colors.purple,
          title: Center(
              child: Text("MEME APP",
                  style: GoogleFonts.lato(
                      fontSize: 25, fontWeight: FontWeight.bold))),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20),
          child: Column(
         mainAxisAlignment: MainAxisAlignment.start,
          children:  <Widget>[
            const SizedBox(height: 50,),
             
              Image.network(
                  imageUrl,
                  width: double.infinity,
                  height: 470,
                  fit: BoxFit.fitWidth,
                ),
           
          ],
        ),));
  }
}
