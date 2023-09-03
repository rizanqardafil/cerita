import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart' show kIsWeb;

class SearchPage extends StatefulWidget {
  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  double _width = 100;
  String _btnText = "GO";

  @override
  void initState() {
    _width = 100;
    _btnText = "GO";
    super.initState();
  }

  Future _pretendSearch() async {
    setState(() {
      this._btnText = "";
      this._width = 36;
    });
    await Future.delayed(Duration(seconds: 2));
    setState(() {
      this._btnText = "GO";
      this._width = 100;
    });
  }

  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      padding: EdgeInsets.all(16),
      height: double.infinity,
      width: double.infinity,
      color: Colors.white,
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _searchBox(),
          ]),
    ));
  }

  Widget _searchBox() {
    return Container(
        width: kIsWeb ? 450 : double.infinity,
        padding: EdgeInsets.fromLTRB(8, 2, 8, 2),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(80)),
          gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                Color.fromARGB(255, 127, 0, 255),
                Color.fromARGB(255, 255, 0, 255)
              ]),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.4),
              spreadRadius: 3,
              blurRadius: 5,
              offset: Offset(0, 5),
            ),
          ],
        ),
        child: Row(
          children: [
            _searchField(),
            _searchBtn(),
          ],
        ));
  }

  Widget _searchField() {
    return Expanded(
        child: TextField(
      keyboardType: TextInputType.text,
      textCapitalization: TextCapitalization.sentences,
      textAlign: TextAlign.start,
      style: TextStyle(
        fontWeight: FontWeight.w300,
        fontSize: 20,
        color: Theme.of(context).backgroundColor,
      ),
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.symmetric(
          vertical: 10.0,
        ),
        hintText: "Search...",
        hintStyle: TextStyle(
          fontWeight: FontWeight.w300,
          color: Colors.white.withOpacity(0.7),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(80.0)),
          borderSide: BorderSide.none,
        ),
        prefixIcon: Icon(
          Icons.search,
          size: 32,
          color: Theme.of(context).backgroundColor,
        ),
      ),
      enabled: true,
      onChanged: (text) {},
    ));
  }

  Widget _searchBtn() {
    return AnimatedContainer(
        width: this._width,
        height: 36,
        duration: Duration(milliseconds: 500),
        curve: Curves.fastOutSlowIn,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
              padding: EdgeInsets.fromLTRB(4, 10, 4, 10),
              primary: Colors.white,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(40))),
          child: this._btnText == "" ? _loadingBox() : _btnTextWidget(),
          onPressed: () async {
            await _pretendSearch();
          },
        ));
  }

  Widget _btnTextWidget() {
    return Text(
      this._btnText,
      style: TextStyle(
        color: Color.fromARGB(255, 127, 0, 255),
        fontWeight: FontWeight.bold,
      ),
    );
  }

  Widget _loadingBox() {
    return Container(
        decoration: BoxDecoration(
          color: Colors.white,
        ),
        padding: EdgeInsets.all(0),
        child: SizedBox(
            height: 16,
            width: 16,
            child: CircularProgressIndicator(
              backgroundColor: Color.fromARGB(255, 127, 0, 255),
              valueColor: new AlwaysStoppedAnimation<Color>(
                  Color.fromARGB(255, 255, 0, 255)),
            )));
  }

}
